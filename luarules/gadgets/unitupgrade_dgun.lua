function gadget:GetInfo()
    return {
        name 	= "Unit Upgrade - Dgun",
        desc	= "Enables D-gun command for Commanders",
        author	= "MaDDoX",
        date	= "Sept 24th 2019",
        license	= "GNU GPL, v2 or later",
        layer	= -1,
        enabled = true,
    }
end

VFS.Include("gamedata/taptools.lua")

if gadgetHandler:IsSyncedCode() then

    CMD.UPG_DGUN = 41999
    CMD_UPG_DGUN = 41999

    local CMD_MANUALFIRE = CMD.MANUALFIRE
    local unitRulesParamName = "upgrade"

    local startFrame
    local metalCost = 200
    local energyCost = 1200
    local upgradeTime = 5 * 30 --5 seconds, in frames
    local upgradingUnits = {}
    local upgradedUnits = {}
    local RedStr = "\255\255\001\001"
    local Prereq = "Tech1"
    local UpgradeTooltip = 'Enables D-gun ability / command'
    local tooltipRequirement = "\n"..RedStr.."Requires ".. Prereq

    local SYNCED = SYNCED
    local spairs = spairs
    local oldFrame = 0        --// used to save bandwidth between unsynced->LuaUI

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

    local ADVCOMMANDER = {
        [UnitDefNames["corcom2"].id] = true,
        [UnitDefNames["corcom3"].id] = true,
        [UnitDefNames["corcom4"].id] = true,
        [UnitDefNames["armcom2"].id] = true,
        [UnitDefNames["armcom3"].id] = true,
        [UnitDefNames["armcom4"].id] = true,
    }

    local UpgradeCmdDesc = {
        id      = CMD_UPG_DGUN,
        name    = 'Upg D-Gun',
        action  = 'dgunupgrade',
        cursor  = 'Morph',
        type    = CMDTYPE.ICON,
        tooltip = UpgradeTooltip,
    }

    local function localAlert(unitID, msg)
        local x, y, z = spGetUnitPosition(unitID)  --x and z on map floor, y is height
        spMarkerAddPoint(x,y,z,msg,true)
        spMarkerErasePosition(x,y,z)
    end

    local function hasPrereq(unitTeam)
        return GG.TechCheck(Prereq, unitTeam)
    end

    function gadget:AllowCommand(unitID,_,unitTeam,cmdID,cmdParams)
        -- Require Tech1 for Upgrade
        if cmdID == CMD_UPG_DGUN and (not upgradedUnits[unitID]) then
            if hasPrereq(unitTeam) then
                --Spring.Echo("Added "..unitID..", count: "..#upgradingUnits)
                upgradingUnits[#upgradingUnits+1] = { unitID = unitID, progress = 0 }
                spSetUnitRulesParam(unitID,unitRulesParamName, 0)
            else
                localAlert(unitID, "Requires: "..Prereq)
            end
        else
            --TODO: Add local warning that pre-req is not met
        end
        return true
    end

    function gadget:Initialize()
        startFrame = spGetGameFrame()
        for ct, unitID in pairs(Spring.GetAllUnits()) do
            gadget:UnitCreated(unitID)
        end
    end

    --    local UpgradeTooltip = 'Enables D-gun ability / command'
    --    local tooltipRequirement = "\n"..RedStr.."Requires "..TechRequirement
    --local function getUpgradeTooltip(unitTeam)
    --    return UpgradeTooltip..(hasPrereq(unitTeam) and "" or tooltipRequirement)
    --end

    ---TODO: options = { req = "tech1" | "perunit", => "perunit" checks for upgradedUnits[unitID]
    ---                                             => req = "" removes any prereq alerts from tooltip
    ---                  defCmdDesc = UpgradeCmdDesc,
    ---                  tooltip = "Does this and that",
    ---                  missingPrereqTooltip = "req this",
    ---                  disabled = true | false,
    ---                  hidden = true | false }
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
    local function addUpdateCommand(unitID, insertID, cmd, options)
        local cmdDescId = spFindUnitCmdDesc(unitID, cmd.id)
        if not cmdDescId then
            spInsertUnitCmdDesc(unitID, insertID, cmd)
        else
            spEditUnitCmdDesc(unitID, cmdDescId, cmd)
        end
        if options then
            editCommand (unitID, cmd.id, options)
        end
    end

    --local function EditButton (unitID, CMDID, disabled, prereq)
    --    local cmdDescID = spFindUnitCmdDesc(unitID, CMDID)
    --    spEditUnitCmdDesc(unitID, cmdDescID, { disabled=disabled })
    --end

    function gadget:UnitCreated(unitID, unitDefID, unitTeam)
        if ADVCOMMANDER[unitDefID] then
            return end
        --Spring.Echo("created: "..unitID)
        if UnitDefs[spGetUnitDefID(unitID)].customParams.iscommander then
            --AddButton (unitID, CMD_UPG_DGUN, UpgradeBtnDesc, false, true)

            --spInsertUnitCmdDesc(unitID, CMD_UPG_DGUN, UpgradeBtnDesc ) --, { disabled=false } )
            --- TODO: If it's commander2, 3 or 4, don't add the upgrade button and don't disable the manualfire button

            addUpdateCommand(unitID, CMD_UPG_DGUN, UpgradeCmdDesc, { req="Tech1", defCmdDesc=UpgradeCmdDesc})
            --TODO: Fix 'options' not working properly

            editCommand(unitID, CMD_MANUALFIRE, {disabled=true, req="perunit", defCmdDesc=UpgradeCmdDesc})

            ---TODO: options = { req = "tech1" | "perunit", => "perunit" checks for upgradedUnits[unitID]
            ---                  defCmdDesc = UpgradeCmdDesc,
            ---                  tooltip = "Does this and that",
            ---                  missingPrereqTooltip = "req this",
            ---                  disabled = true | false,
            ---                  hidden = true | false }


            --for debug purposes, so /unitrules reload works fine
            spSetUnitRulesParam(unitID, unitRulesParamName, nil)
        end
    end

    local function finishUpgrade(idx, unitID)
        editCommand (unitID, CMD_UPG_DGUN, {disabled=true}) --TODO: Remove?

        -- Enable action & remove "Requires" red alert at bottom
        editCommand (unitID, CMD_MANUALFIRE, {disabled=false, req="", defCmdDesc = UpgradeCmdDesc})

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
        --Spring.Echo("New frame: "..frame)
        oldFrame = frame
        if not upgradingUnits or #upgradingUnits == 0 then    -- If table empty, return
            return end

        --Spring.Echo("Count: "..#upgradingUnits)

         --{ unitID = unitID, progress = 0 }
        for idx,data in ipairs(upgradingUnits) do
            local unitID = data.unitID
            local progress = data.progress
            --Spring.Echo("Unit: "..unitID.." progress: "..progress.." m req: "..metalCost/upgradeTime.." e req: "..energyCost/upgradeTime )
            if spUseUnitResource(unitID, { ["m"] = metalCost/upgradeTime, ["e"] = energyCost/upgradeTime }) then
                local progress = progress + 1 / upgradeTime -- TODO: Add "Morph speedup" bonus maybe?
                --Spring.Echo("Progress: "..progress)
                upgradingUnits[idx] = { unitID = unitID, progress = progress }
                spSetUnitRulesParam(unitID,unitRulesParamName, progress)
                if progress >= 1.0 then
                    finishUpgrade(idx, unitID)
                end
            end
        end
    end
--------------------------------------------------------------------------------
--region  UNSYNCED
--------------------------------------------------------------------------------
else

    --local CMD_MANUALFIRE = CMD.MANUALFIRE
    --
    --local startFrame
    --local metalCost = 200
    --local energyCost = 1200
    --local upgradeTime = 5 * 30 --5 seconds, in frames
    --local upgradingUnits = {}
    --
    --local SYNCED = SYNCED
    --local spairs = spairs
    --local oldFrame = 0        --// used to save bandwidth between unsynced->LuaUI
    --
    --
    --local spGetUnitDefID = Spring.GetUnitDefID
    --local spFindUnitCmdDesc = Spring.FindUnitCmdDesc
    --local spInsertUnitCmdDesc = Spring.InsertUnitCmdDesc
    --local spEditUnitCmdDesc = Spring.EditUnitCmdDesc
    --local spSetUnitRulesParam = Spring.SetUnitRulesParam
    --local spGetGameFrame      = Spring.GetGameFrame
    --
    --local UpgDgunDesc = {
    --    id      = CMD_UPG_DGUN,
    --    type    = CMDTYPE.ICON,
    --    name    = 'Upg D-Gun',
    --    cursor = 'Morph',
    --    action  = 'dgunupgrade',
    --    tooltip = 'Enables D-gun ability / command',
    --}

end