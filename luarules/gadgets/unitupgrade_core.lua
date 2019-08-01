---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by MaDDo.
--- DateTime: 31-Jul-19 4:55 PM
---
function gadget:GetInfo()
    return {
        name 	= "Unit Upgrade Core",
        desc	= "Enables upgrades for units",
        author	= "MaDDoX",
        date	= "Sept 24th 2019",
        license	= "GNU GPL, v2 or later",
        layer	= -1,
        enabled = true,
        -- TODO: Currently only supports blocking/unblocking command fire weapons
    }
end

VFS.Include("gamedata/taptools.lua")

local spGetUnitDefID        = Spring.GetUnitDefID
local spGetUnitTeam         = Spring.GetUnitTeam
local spFindUnitCmdDesc     = Spring.FindUnitCmdDesc
local spGetUnitCmdDescs     = Spring.GetUnitCmdDescs
local spInsertUnitCmdDesc   = Spring.InsertUnitCmdDesc
local spEditUnitCmdDesc     = Spring.EditUnitCmdDesc
local spSetUnitRulesParam   = Spring.SetUnitRulesParam
local spMarkerAddPoint      = Spring.MarkerAddPoint
local spMarkerErasePosition = Spring.MarkerErasePosition
local spGetGameFrame        = Spring.GetGameFrame
local spUseUnitResource     = Spring.UseUnitResource
local spGetUnitPosition     = Spring.GetUnitPosition

local RedStr = "\255\255\001\001"
local unitRulesParamName = "upgrade"
local oldFrame = 0
local CMD_MANUALFIRE = CMD.MANUALFIRE

-- Per-unit upgrade settings (TODO: Move to a separate file for better organization)

CMD.UPG_DGUN = 41999
CMD_UPG_DGUN = CMD.UPG_DGUN
CMD.UPG_GRENADE = 41998
CMD_UPG_GRENADE = CMD.UPG_GRENADE
PUU = {
    dgun = {
        UpgradeCmdDesc = {
            id      = CMD_UPG_DGUN,
            name    = 'Upg D-Gun',
            action  = 'dgunupgrade',
            cursor  = 'Morph',
            type    = CMDTYPE.ICON,
            tooltip = 'Enables D-gun weapon',
        },
        Prereq = "Tech1",
        metalCost = 200,
        energyCost = 1200,
        upgradeTime = 5 * 30, --5 seconds, in frames
    },
    grenade = {     -- >> Peewee's Laser Grenade (Per Unit)
        UpgradeCmdDesc = {
            id      = CMD_UPG_GRENADE,
            name    = 'Upg Grenade',
            action  = 'grenadeupgrade',
            cursor  = 'Morph',
            type    = CMDTYPE.ICON,
            tooltip = 'Enables Laser Grenade weapon',
        },
        Prereq = "Tech",
        metalCost = 80,
        energyCost = 480,
        upgradeTime = 5 * 30, --5 seconds, in frames
    },
}
LocalUpgradeUnits = {
    [UnitDefNames["corcom"].id] = "dgun",
    --[UnitDefNames["corcom2"].id] = "dgun",
    --[UnitDefNames["corcom3"].id] = "dgun",
    --[UnitDefNames["corcom4"].id] = "dgun",
    [UnitDefNames["armcom"].id] = "dgun",
    --[UnitDefNames["armcom2"].id] = "dgun",
    --[UnitDefNames["armcom3"].id] = "dgun",
    --[UnitDefNames["armcom4"].id] = "dgun",
    [UnitDefNames["armpw"].id] = "grenade",
}
Upgrades = {} -- Auto-completed from PUU @ Initialize

--local tooltipRequirement = "\n"..RedStr.."Requires ".. Prereq,
--local UpgradeTooltip = 'Enables D-gun ability / command'
--local tooltipRequirement = "\n"..RedStr.."Requires ".. PUU.dgun.Prereq
local upgradingUnits = {}
local upgradedUnits = {}

if not gadgetHandler:IsSyncedCode() then
    return end

local function editCommand (unitID, CMDID, options)
    local cmdDescID = spFindUnitCmdDesc(unitID, CMDID)
    if not cmdDescID or not options then --or not options.defCmdDesc then
        return end

    if options.req and options.defCmdDesc then
        local append = ""
        if options.req == "perunit" then
            if not upgradedUnits[unitID] then
                append = "\n\n"..RedStr.."Requires: "..options.defCmdDesc.name.." unit upgrade."
                --append = options.missingPrereqTooltip
            end
        else
            if not options.req == "" and not GG.TechCheck(options.req, spGetUnitTeam(unitID)) then
                append = "\n\n"..RedStr.."Requires Tech: "..options.req
            end
        end
        options.tooltip = ((options.tooltip == nil) and options.defCmdDesc.tooltip or options.tooltip) .. append
    end

    local currentCmdDesc = spGetUnitCmdDescs(unitID, cmdDescID, cmdDescID)[1]

    currentCmdDesc.tooltip = options.tooltip and options.tooltip or currentCmdDesc.tooltip
    currentCmdDesc.hidden = (options.hidden == nil) and currentCmdDesc.hidden or options.hidden
    currentCmdDesc.disabled = (options.disabled == nil) and currentCmdDesc.disabled or options.disabled

    spEditUnitCmdDesc (unitID, cmdDescID, currentCmdDesc)
    --Spring.Echo(tostringplus(currentCmdDesc))

    -- getUpgradeTooltip(spGetUnitTeam(unitID))
    -- Spring.Echo("New tooltip: "..newCmdDesc.tooltip.." disabled: "..tostring(disabled))
end

-- TODO: Add manualfire edited tooltip
--addUpdateCommand(unitID, puuItem.UpgradeCmdDesc.id, puuItem.UpgradeCmdDesc, { req=puuItem.Prereq, defCmdDesc=puuItem.UpgradeCmdDesc })
local function addUpdateCommand(unitID, puuItem)
    local insertID = puuItem.UpgradeCmdDesc.id
    local cmdDesc = puuItem.UpgradeCmdDesc
    local options = { req=puuItem.Prereq, defCmdDesc=puuItem.UpgradeCmdDesc }

    local cmdDescId = spFindUnitCmdDesc(unitID, cmdDesc.id)
    if not cmdDescId then
        spInsertUnitCmdDesc(unitID, insertID, cmdDesc)
    else
        spEditUnitCmdDesc(unitID, cmdDescId, cmdDesc)
    end
    if options then
        editCommand (unitID, cmdDesc.id, options)
    end
end

local function localAlert(unitID, msg)
    local x, y, z = spGetUnitPosition(unitID)  --x and z on map floor, y is height
    spMarkerAddPoint(x,y,z,msg,true)
    spMarkerErasePosition(x,y,z)
end

local function hasPrereq(Prereq, unitTeam)
    return GG.TechCheck(Prereq, unitTeam)
end

function gadget:AllowCommand(unitID,unitDefID,unitTeam,cmdID) --,cmdParams
    local upgrade = LocalUpgradeUnits[unitDefID]
    if not upgrade then
        return true
    end
    local puu = PUU[upgrade]

    --grenade = {     -- >> Peewee's Laser Grenade (Per Unit)
    --    UpgradeCmdDesc = {
    --        id      = CMD_UPG_GRENADE,
    --        name    = 'Upg Grenade',
    --        action  = 'grenadeupgrade',
    --        cursor  = 'Morph',
    --        type    = CMDTYPE.ICON,
    --        tooltip = 'Enables Laser Grenade weapon',
    --    },
    --    Prereq = "Tech0",
    --},
    --Spring.Echo("Expected puu id: "..puu.UpgradeCmdDesc.id.." cmdID: "..cmdID)
    if cmdID == puu.UpgradeCmdDesc.id and (not upgradedUnits[unitID]) then
        if hasPrereq(puu.Prereq, unitTeam) then
            --Spring.Echo("Added "..unitID..", count: "..#upgradingUnits)
            upgradingUnits[#upgradingUnits+1] = { unitID = unitID, progress = 0, puu = puu, }
            spSetUnitRulesParam(unitID, unitRulesParamName, 0)
        else
            localAlert(unitID, "Requires: "..puu.Prereq)
        end
    else
        --TODO: Add local warning that pre-req is not met
    end
    return true
end

function gadget:Initialize()
    for _,upgrade in pairs(PUU) do
        Upgrades[upgrade] = true
    end
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam)
    local upgrade = LocalUpgradeUnits[unitDefID]
    if not upgrade then
        return end
    --Spring.Echo("Found locally available upgrade: "..upgrade)

    local puuItem = PUU[upgrade]
    if puuItem then
        addUpdateCommand(unitID, puuItem)
        editCommand(unitID, CMD_MANUALFIRE, {disabled=true, req="perunit", defCmdDesc=UpgradeCmdDesc})
    else
        --Spring.Echo ("Defined upgrade not found in Settings: "..upgrade)
    end
end

local function finishUpgrade(idx, unitID, puu)
    editCommand (unitID, puu.UpgradeCmdDesc.id, {disabled=true}) --TODO: Remove?

    -- Enable action & remove "Requires" red alert at bottom
    editCommand (unitID, CMD_MANUALFIRE, {disabled=false, req="", defCmdDesc = puu.UpgradeCmdDesc})

    upgradingUnits[idx] = nil
    upgradedUnits[unitID] = true
    spSetUnitRulesParam(unitID, unitRulesParamName, nil)
end

function gadget:UnitDestroyed(unitID)
    upgradedUnits[unitID] = nil
end

function gadget:GameFrame()
    local frame = spGetGameFrame()
    if (frame <= oldFrame) then
        return end
    oldFrame = frame
    if not upgradingUnits or #upgradingUnits == 0 then    -- If table empty, return
        return end

    --Spring.Echo("Count: "..#upgradingUnits)

    --{ unitID = unitID, progress = 0, puu = puu, }
    for idx,data in ipairs(upgradingUnits) do
        local unitID = data.unitID
        local progress = data.progress
        local puu = data.puu
        if spUseUnitResource(unitID, { ["m"] = puu.metalCost / puu.upgradeTime, ["e"] = puu.energyCost / puu.upgradeTime }) then
            local progress = progress + 1 / puu.upgradeTime -- TODO: Add "Morph speedup" bonus maybe?
            upgradingUnits[idx].progress = progress
            spSetUnitRulesParam(unitID, unitRulesParamName, progress)
            if progress >= 1.0 then
                finishUpgrade(idx, unitID, puu)
            end
        end
    end
end

