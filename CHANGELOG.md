# Larlen Overload Tracker Changelog

## v1.0.6
- Fixed icon not showing in delves, dungeons, and raids. Blizzard restricts tooltip text reads inside instances, so skinning detection was rewritten to use unit APIs instead.
- Fixed icon not disappearing when moving off a skinnable corpse inside an instance.
- Added "Show icon in instances" toggle in the options panel for anyone who only wants the icon in the open world.

## v1.0.5
- Expanded node lists for DF and TWW mining and herbalism to cover base nodes, rich nodes, and additional variants like Lush, Camouflaged, Webbed, and Empowered.
- Fixed skinning icon staying up after using Sharpen Your Knife when no charges remain.

## v1.0.4
- Added node name lists for Dragonflight and The War Within mining and herbalism to prevent false positives on portals and other world objects.

## v1.0.3
- Fixed skinning icon showing when Sharpen Your Knife buff is active but no charges remain.
- Fixed minimap button not appearing in HidingBar and other broker addons.
- Fixed Lua errors caused by secret number taint from C_Spell.GetSpellCharges in certain dungeon encounters.
- Fixed Lua errors caused by Blizzard's secret string type on tooltip lines in certain dungeons.

## v1.0.2
- Added cursor offset X/Y sliders to options panel.
- Added Test Icon button to preview icon position live from options.

## v1.0.1
- Initial public release fixes and polish.

## v1.0.0 - Initial Release
- Cursor-following icon that appears when mousing over an eligible overload node.
- Supports Mining, Herbalism, and Skinning for Dragonflight, The War Within, and Midnight.
- Midnight node detection via tooltip name lookup with full node name database.
- Skinning detection via tooltip type line.
- Charge counter displayed on icon when more than one charge is available.
- Per-module toggles to enable or disable each expansion and profession individually.
- Minimap button with left-click to open options, right-click to hide.
- Combat-safe: options panel queues to open after combat ends.
- Zone and spell caching to keep the tooltip hot path allocation-free.

**Credits:** All original credit to **Markiv** for the Overload Reminder WeakAura that inspired this addon.
