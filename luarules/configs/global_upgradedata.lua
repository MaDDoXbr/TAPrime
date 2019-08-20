---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Breno.
--- DateTime: 18-Aug-19 8:49 PM
---
-- All global upgrades info (command buttons to unlock, upgrade time, etc)

CMD.UPG_CAPTURE = 42999
CMD_UPG_CAPTURE = CMD.UPG_CAPTURE

local CMD_CAPTURE = CMD.CAPTURE

-- Settings + Button options (as shown in a given unit's command list)
GlobalUpgrades = {
    -- key = upgrade id
    capture = {
        UpgradeCmdDesc = {
            id      = CMD_UPG_CAPTURE,
            name    = '^ Capture',
            action  = 'upgradecapture',
            cursor  = 'Morph',
            type    = CMDTYPE.ICON,
            tooltip = 'Enables Capture',
        },
        prereq = "",
        metalCost = 200,
        energyCost = 1200,
        upgradeTime = 5 * 30, --5 seconds, in frames
        type = "tech",
        buttonToUnlock = CMD_CAPTURE,
        techToGrant = "capture",
        --UnlockedCmdDescTootip = "" (to be added/used by handlers)
    },
}

-- Which units can research what
TechResearchers = {
    [UnitDefNames["armtech"].id] = {"capture","techbooster1"},
    [UnitDefNames["cortech"].id] = {"capture","techbooster1"},
}