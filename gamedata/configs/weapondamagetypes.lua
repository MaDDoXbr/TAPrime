--
-- Created by IntelliJ IDEA.
-- User: MaDDoX
-- Date: 14/05/17
-- Time: 04:16

-- Main damage type definition table. Keys are the unit name, value is a record table - weaponName,damageType
-- PS.: This table content was auto-generated with PrintWeaponDamageTypes() (@weapondefs_post.lua)

--- PS/2.: This only applies to Weapons defined *within* the unitDefs. For 'standalone' or 'shared' weapons (those
--- in the /weapons folder, the damageType is defined within its customParams entry. When used in the unit's .lua
--- UnitDef, that entry also *overrides* whatever's in here, so use it with discretion.

local weaponDamageTypes = {
	
--	armflash = { emgx = "bullet" },
--	armroy = { arm_roy = "cannon", depthcharge = "omni"},
	
	corsnap = { ["MediumPlasmaCannon"] = "cannon", },
	corsktl = { ["RailWeapon"]="rail"}, --{ ["Mine Detonator"] = "omni", ["Crawlingbomb Dummy Weapon"] = "omni", ["RailWeapon"] = "rail" },
	cormort = { ["PlasmaCannon"] = "siege", },
	armcroc = { ["PlasmaCannon"] = "cannon", },
	cormart = { ["PlasmaCannon"] = "siege", },
	corah = { ["Missiles"] = "rocket", },
	armmercury = { ["ADVSAM"] = "siege", },
	armthund = { ["Bombs"] = "explosive", },
	corcrw = { ["HighEnergyLaser"] = "neutron", ["PlasmaBeam"] = "plasma", },
	--armflea = { ["Laser"] = "laser", },
	armfig = { ["GuidedMissiles"] = "rocket", ["GuidedMissilesA2G"] = "homing",},
	armllt = { ["LightLaser"] = "hflaser", },
	corfgate = { ["NavalPlasmaRepulsor"] = "none", },
	corssub = { ["advTorpedo"] = "rocket", },
	corhurc = { ["AdvancedBombs"] = "explosive", },
	coraak = { ["Missiles"] = "rocket", ["MissilesAA"] = "homing", },
	armmship = { ["Rocket"] = "rocket", ["Missiles"] = "rocket", },
	corcom = { ["Disintegrator"] = "omni", ["J7Laser"] = "omni", ["J7NSLaser"] = "omni", },
	corcom2 = { ["Disintegrator"] = "omni", ["J7Laser"] = "omni", ["J7NSLaser"] = "omni", },
	corcom3 = { ["Disintegrator"] = "omni", ["J7Laser"] = "omni", ["J7NSLaser"] = "omni", ["CommanderShield"] = "omni"},
	corcom4 = { ["Disintegrator"] = "omni", ["J7Laser"] = "omni", ["J7NSLaser"] = "omni", ["CommanderShield"] = "omni" },
	corpun = { ["PlasmaCannon"] = "plasma", },
	armbats = { ["BattleshipCannon"] = "plasma", },
	corfrt = { ["Missiles"] = "homing", ["MissilesAA"] = "homing", },
	armgate = { ["PlasmaRepulsor"] = "none", },
	corkarg = { ["ShoulderRockets"] = "plasma", ["HeadRockets"] = "plasma", ["KarganethMissiles"] = "plasma", },
	armroy = { ["HeavyCannon"] = "cannon", ["DepthCharge"] = "homing", },
	corfmd = { ["Rocket"] = "omni", },
	corsh = { ["Laser"] = "homing", },
	corllt = { ["LightLaser"] = "hflaser", },
	armlun = { ["Guided Rockets"] = "cannon", ["DepthCharge"] = "homing", },
	armrock = { ["Rockets"] = "rocket", ["AARockets"] = "rocket",},
	armmav = { ["GaussCannon"] = "flak", },
	corsub = { ["Torpedo"] = "rocket", },
    armbeamer = { ["BeamLaser"] = "thermo", },
	armamex = { ["BeamLaser"] = "thermo", },
	corhllt = { ["LightLaser"] = "hflaser", },
	armyork = { ["FlakCannon"] = "flak", ["FlakAACannon"] = "flak", },
	armdeva = { ["FlakCannon"] = "flak", ["FlakAACannon"] = "flak", },
	corshred = { ["FlakCannon"] = "flak", ["FlakAACannon"] = "flak", },
	armhlt = { ["HighEnergyLaser"] = "hflaser", },
	armfido = { ["GaussCannon"] = "siege", ["BallisticCannon"] = "siege", },
	armpw = { ["peewee"] = "bullet", ["grenade"] = "hflaser",},
	armmart = { ["PlasmaCannon"] = "siege", },
	coramph = { ["HighEnergyLaser"] = "laser", ["Torpedo"] = "rocket", },
	armcom = { ["Disintegrator"] = "omni", ["J7Laser"] = "omni", ["J7NSLaser"] = "omni", },
	armcom2 = { ["Disintegrator"] = "omni", ["J7Laser"] = "omni", ["J7NSLaser"] = "omni", },
	armcom3 = { ["Disintegrator"] = "omni", ["J7Laser"] = "omni", ["J7NSLaser"] = "omni", ["CommanderShield"] = "omni"},
	armcom4 = { ["Disintegrator"] = "omni", ["J7Laser"] = "omni", ["J7NSLaser"] = "omni", ["CommanderShield"] = "omni"},
	armah = { ["Missiles"] = "rocket", },
	shiva = { ["HeavyRockets"] = "siege", ["HeavyCannon"] = "siege", },
	armorco = { ["FlakCannon"] = "homing", ["SuperEMG"] = "homing", ["RiotRockets"] = "homing", },
	corfhlt = { ["HighEnergyLaser"] = "neutron", },
	corsb = { ["CoreSeaAdvancedBombs"] = "rocket", },
	corscreamer = { ["ADVSAM"] = "siege", },
	armpincer = { ["PincerCannon"] = "cannon", },
	armpb = { ["GaussCannon"] = "rocket", },
	corfav = { ["Laser"] = "laser", },
	armsfig = { ["GuidedMissiles"] = "homing", },
	armham = { ["PlasmaCannon"] = "plasma", },
	armsub = { ["Torpedo"] = "rocket", },
	armsubk = { ["AdvancedTorpedo"] = "rocket", },
	corban = { ["Banisher"] = "plasma", },
	tawf009 = { ["AdvTorpedo"] = "rocket", },
	corcarry = { ["Rocket"] = "omni", },
	armptl = { ["Level1TorpedoLauncher"] = "homing", },
	armbull = { ["PlasmaCannon"] = "cannon", },
	armbrtha = { ["BerthaCannon"] = "siege", },
	corvipe = { ["Sabot"] = "rocket", },
	armsh = { ["Laser"] = "homing", },
	armtl = { ["Level1TorpedoLauncher"] = "homing", },
	cormabm = { ["Rocket"] = "omni", },
	armsnipe = { ["SniperWeapon"] = "rail", },
	corbhmth = { ["PlasmaBattery"] = "plasma", },
	armsaber = { ["LightningBolt"] = "bullet", },
	corenaa = { ["FlakCannon"] = "cannon", },
	corsent = { ["FlakCannon"] = "flak", ["FlakCannonAA"] = "flak", },
	armkam = { ["E.M.G."] = "bullet", },
	corvamp = { ["GuidedMissiles"] = "homing", ["GuidedMissilesA2G"] = "homing", },
	meteor = { ["Asteroid"] = "siege", },
	corcan = { ["HighEnergyLaser"] = "neutron", },
	corlevlr = { ["RiotCannon"] = "explosive", },
	armwar = { ["MediumLaser"] = "laser", },
	corshark = { ["AdvancedTorpedo"] = "homing", },
	armdecom = { ["Disintegrator"] = "omni", ["J7Laser"] = "omni", },
	corbuzz = { ["RapidfireLRPC"] = "plasma", },
	corrl = { ["Missiles"] = "homing", ["AAMissiles"] = "homing", },
	corblackhy = { ["HighEnergyLaser"] = "plasma", ["BattleshipCannon"] = "plasma", ["RapidSamMissile"] = "plasma", },
	corgate = { ["PlasmaRepulsor"] = "none", },
	corhlt = { ["HighEnergyLaser"] = "hflaser", },
	armblade = { ["Sabotrocket"] = "rocket", },
	armguard = { ["PlasmaCannon"] = "plasma", },
	cormh = { ["Rocket"] = "rocket", },
	tawf013 = { ["LightArtillery"] = "siege", },
	cormship = { ["Rocket"] = "rocket", ["Missiles"] = "rocket", },
	armaak = { ["Missiles"] = "rocket", ["MissilesAA"] = "homing", },
    armpship = { ["Missiles"] = "rocket", ["MissilesAA"] = "homing", },
    corpship = { ["Missiles"] = "rocket", ["MissilesAA"] = "homing", },
	armvulc = { ["RapidfireLRPC"] = "plasma", },
	corstorm = { ["Rockets"] = "rocket", ["AARockets"] = "rocket", },
	armamb = { ["PopupCannon"] = "plasma", },
	armmh = { ["RocketArtillery"] = "rocket", },
	armaas = { ["FlakCannon"] = "rocket", ["AA2Missile"] = "rocket", },
	armrl = { ["Missiles"] = "homing", ["AAMissiles"] = "homing", },
	armamd = { ["Rocket"] = "omni", },
	marauder = { ["Missiles"] = "homing", ["MechPlasmaCannon"] = "homing", },
	armshock = { ["ShockerHeavyCannon"] = "omni", },
	armjuno = { ["AntiSignal"] = "omni", },
	armatl = { ["LongRangeTorpedo"] = "homing", },
	corape = { ["RiotRocket"] = "rocket", },
	corparrow = { ["PoisonArrowCannon"] = "cannon", },
	corroy = { ["DepthCharge"] = "homing", ["HeavyCannon"] = "cannon", },
	armfav = { ["HeavyRocket"] = "explosive", },
	cjuno = { ["AntiSignal"] = "omni", },
	armmerl = { ["Rocket"] = "explosive", },
	madsam = { ["AA2Missile"] = "homing", ["AA2AAMissile"] = "rocket",},
	armflash = { ["flash"] = "bullet", ["flashaa"] = "bullet", },
	corbw = { ["laser"] = "bullet", ["Paralyzer"] = "emp", },
	corbats = { ["BattleshipCannon"] = "plasma", ["HighEnergyLaser"] = "plasma", },
	armfrt = { ["Missiles"] = "homing", ["MissilesAA"] = "homing", },
	armfhlt = { ["HighEnergyLaser"] = "neutron", },
	armseap = { ["TorpedoLauncher"] = "homing", },
	corshad = { ["Bombs"] = "explosive", },
	armsam = { ["Missiles"] = "rocket", ["AAMissiles"] = "rocket", ["firerain"] = "thermo", },
	armcir = { ["ExplosiveRockets"] = "homing", ["ExplosiveRocketsAA"] = "homing", },
	corhrk = { ["HeavyFlak"] = "flak", },
	armfast = { ["ThermoBurst"] = "thermo", },
	armdecade = { ["flash"] = "homing", },
	armliche = { ["PlasmaImplosionDumpRocket"] = "nuke", },
	armjanus = { ["HeavyRocket"] = "laser", },
	corbow = { ["FlakCannon"] = "rocket", ["AA2Missile"] = "rocket", ["Missiles"] = "thermo", },
	corgol = { ["HeavyCannon"] = "cannon", },
	armpnix = { ["AdvancedBombs"] = "explosive", },
	armlance = { ["TorpedoLauncher"] = "homing", },
	armsb = { ["SeaAdvancedBombs"] = "rocket", },
	armfboy = { ["HeavyPlasma"] = "plasma", },
	armstump = { ["LightCannon"] = "cannon", },
	armsilo = { ["NuclearMissile"] = "nuke", },
	cormando = { ["CommandoBlaster"] = "thermo", ["CommandoMineLayer"] = "omni", },
	armzeus = { ["LightningGun"] = "thermo", },
	cormaw = { ["FlameThrower"] = "thermo", },
	corwolv = { ["LightArtillery"] = "siege", },
	corcut = { ["RiotCannon"] = "bullet", },
	packo = { ["AA2Missile"] = "rocket", },
	armbrawl = { ["Machinegun"] = "thermo", },
	corexp = { ["LightLaser"] = "hflaser", },
	cortl = { ["Level1TorpedoLauncher"] = "homing", },
	armanac = { ["MediumPlasmaCannon"] = "cannon", },
	armflak = { ["FlakCannon"] = "cannon", },
	armlatnk = { ["Missiles"] = "homing", ["LightningGun"] = "thermo", },
	corerad = { ["ExplosiveRockets"] = "homing", ["ExplosiveRocketsAA"] = "homing", },
	armraz = { ["MechRapidLaser"] = "plasma", },
	armepoch = { ["FlakCannon"] = "flak", ["BattleshipCannon"] = "plasma", ["BattleShipCannon"] = "plasma", },
	armanni = { ["ATA"] = "neutron", },
	armcrus = { ["CruiserCannon"] = "cannon", ["L2DeckLaser"] = "laser", ["CruiserDepthCharge"] = "homing", },
	corsok = { ["Disruptor Phaser"] = "cannon", ["Torpedo"] = "homing", },
	nsaclash = { ["HighEnergyLaser"] = "homing", },
	armspid = { ["Paralyzer"] = "emp", },
	armpt = { ["Laser"] = "laser", ["Missiles"] = "homing", },
	coratl = { ["LongRangeTorpedo"] = "homing", },
	armcarry = { ["Rocket"] = "omni", },
	armjeth = { ["Missiles"] = "rocket", },
	corkrog = { ["KrogCrush"] = "omni", ["HeavyRockets"] = "rocket", ["GaussCannon"] = "plasma", ["KrogHeatRay"] = "thermo", },
	corgator = { ["Laser"] = "laser", },
	corint = { ["IntimidatorCannon"] = "siege", },
	armbanth = { ["HeavyRockets"] = "rocket", ["ImpulsionBlaster"] = "plasma", ["DEEEEEEWWWMMM"] = "neutron", },
	corcat = { ["RavenCatapultRockets"] = "rocket", },
	corflak = { ["FlakCannon"] = "cannon", },
	corptl = { ["Level1TorpedoLauncher"] = "homing", },
	corsumo = { ["HighEnergyLaser"] = "neutron", },
	krogtaar = { ["KrogTaarBlaster"] = "plasma", },
	armfflak = { ["FlakCannon"] = "cannon", },
	cortitan = { ["TorpedoLauncher"] = "homing", },
	corpyro = { ["FlameThrower"] = "thermo", },
	corsilo = { ["CoreNuclearMissile"] = "nuke", },
	corraid = { ["LightCannon"] = "cannon", },
	correap = { ["PlasmaCannon"] = "cannon", },
	cormexp = { ["HighEnergyLaser"] = "laser", ["RocketBattery"] = "rocket", },
	cormine4 = { ["MineDetonator"] = "flak", },
	armemp = { ["EMPMissile"] = "bullet", },
	corpt = { ["Laser"] = "laser", ["Missiles"] = "homing", },
	corcrus = { ["HighEnergyLaser"] = "cannon", ["L2DeckLaser"] = "laser", ["CruiserDepthCharge"] = "homing", },
	cortrem = { ["RapidArtillery"] = "plasma", },
	cordoom = { ["HighEnergyLaser"] = "neutron", ["PlasmaBeam"] = "plasma", ["ATAD"] = "neutron", },
	armhawk = { ["HawkBeamer"] = "thermo", ["HawkBeamerA2G"] = "homing", },
	corsfig = { ["GuidedMissiles"] = "homing", },
	corthud = { ["PlasmaCannon"] = "plasma", },
    cordefiler = { ["PlasmaCannon"] = "plasma", },
	armscab = { ["Rocket"] = "omni", },
	cortron = { ["TacticalNuke"] = "nuke", },
	corcrash = { ["Missiles"] = "rocket", },
	corak = { ["Laser"] = "laser", },
	cordecom = { ["Disintegrator"] = "omni", ["J7Laser"] = "omni", },
	corgarp = { ["PincerCannon"] = "cannon", },
	cortermite = { ["FlameThrower"] = "thermo", },
	corseal = { ["PlasmaCannon"] = "cannon", },
    armstil = { ["EMPbomb"] = "bullet", },
	armsptk = { ["HeavyRocket"] = "rocket", },
	armst = { ["Gauss"] = "cannon", },
	cortoast = { ["PopupCannon"] = "plasma", },
	coresupp = { ["LightLaser"] = "homing", },
	cormist = { ["Missiles"] = "rocket", ["AAMissiles"] = "plasma", },
	armfgate = { ["NavalPlasmaRepulsor"] = "plasma", },
	--armclaw = { ["LightningGun"] = "rocket", },
	cordl = { ["DepthCharge"] = "homing", },
	corseap = { ["TorpedoLauncher"] = "homing", },
	corveng = { ["Machinegun"] = "bullet", ["MachinegunA2G"] = "bullet", },
	armmanni = { ["ATAM"] = "neutron", },
	armdfly = { ["Paralyzer"] = "emp", },
	corvroc = { ["Rocket"] = "siege", },
	corjugg = { ["GaussCannon"] = "omni", ["LightLaser"] = "omni", },
	
	["else"] = {},
}



return weaponDamageTypes




