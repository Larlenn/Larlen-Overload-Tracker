local LCG = {}
LarlenOverloadTracker.LCG = LCG

local function CreatePixelGlow(frame, color, _, frequency, thickness)
    frequency = frequency or 1.5
    thickness = thickness or 3
    color     = color     or {1, 0.82, 0, 1}
    local r, g, b, a = color[1], color[2], color[3], color[4] or 1
    local pad = 3

    local gf = CreateFrame("Frame", nil, frame)
    gf:SetFrameStrata(frame:GetFrameStrata())
    gf:SetFrameLevel(frame:GetFrameLevel() + 10)
    gf:SetAllPoints(frame)
    gf:Hide()

    -- 4 border lines, explicitly sized and anchored to the frame edges
    local top = gf:CreateTexture(nil, "OVERLAY")
    top:SetColorTexture(r, g, b, a)
    top:SetBlendMode("ADD")
    top:SetHeight(thickness)
    top:SetPoint("TOPLEFT",  frame, "TOPLEFT",  -pad,  pad)
    top:SetPoint("TOPRIGHT", frame, "TOPRIGHT",  pad,  pad)

    local bot = gf:CreateTexture(nil, "OVERLAY")
    bot:SetColorTexture(r, g, b, a)
    bot:SetBlendMode("ADD")
    bot:SetHeight(thickness)
    bot:SetPoint("BOTTOMLEFT",  frame, "BOTTOMLEFT",  -pad, -pad)
    bot:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT",  pad, -pad)

    local lft = gf:CreateTexture(nil, "OVERLAY")
    lft:SetColorTexture(r, g, b, a)
    lft:SetBlendMode("ADD")
    lft:SetWidth(thickness)
    lft:SetPoint("TOPLEFT",    frame, "TOPLEFT",    -pad,  pad)
    lft:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", -pad, -pad)

    local rgt = gf:CreateTexture(nil, "OVERLAY")
    rgt:SetColorTexture(r, g, b, a)
    rgt:SetBlendMode("ADD")
    rgt:SetWidth(thickness)
    rgt:SetPoint("TOPRIGHT",    frame, "TOPRIGHT",    pad,  pad)
    rgt:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", pad, -pad)

    -- 4 corner sparkles
    local corners = {}
    local cOffsets = {
        {"TOPLEFT",     -pad,  pad},
        {"TOPRIGHT",     pad,  pad},
        {"BOTTOMRIGHT",  pad, -pad},
        {"BOTTOMLEFT",  -pad, -pad},
    }
    for i, co in ipairs(cOffsets) do
        local c = gf:CreateTexture(nil, "OVERLAY")
        c:SetColorTexture(1, 1, 0.6, 1)
        c:SetBlendMode("ADD")
        c:SetSize(thickness + 2, thickness + 2)
        c:SetPoint(co[1], frame, co[1], co[2], co[3])
        corners[i] = c
    end

    local lines = {top, bot, lft, rgt}
    local elapsed = 0
    gf:SetScript("OnUpdate", function(_, dt)
        elapsed = elapsed + dt
        -- smooth sine pulse 0→1→0
        local pulse = (math.sin(elapsed * frequency * math.pi * 2) + 1) * 0.5
        local lineAlpha  = 0.4 + pulse * 0.6
        local cornerAlpha = 0.6 + pulse * 0.4
        for _, ln in ipairs(lines) do
            ln:SetAlpha(lineAlpha * a)
        end
        for _, cn in ipairs(corners) do
            cn:SetAlpha(cornerAlpha)
            local s = thickness + 1 + pulse * 2
            cn:SetSize(s, s)
        end
    end)

    return gf
end

LCG.CreatePixelGlow = CreatePixelGlow
