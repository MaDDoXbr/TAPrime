local wreck_metal = 2500
if (Spring.GetModOptions) then
    wreck_metal = Spring.GetModOptions().comm_wreck_metal or 2500
end

function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

--Stats Tables:
--Weapon: Laser
Range = {300,350,375,400,430,475,530,575,630,700,750}
AOE = {12,12,12,16,16,16,24,24,24,32,32}
ReloadTime = {0.4,0.4,0.4,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2}
Damages = {75,75,125,125,125,150,150,200,200,250,250}
--Weapon:SeaLaser
Range2 = {300,350,375,400,430,475,530,575,630,700,750}
AOE2 = {12,12,12,16,16,16,24,24,24,32,32}
ReloadTime2 = {1,1,1,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5}
Damages21 = {75*2,75*2,125*2,125*2,125*2,150*2,150*2,200*2,200*2,250*2,250*2}
Damages22 = {0.5,0.5,0.5,0.75,0.75,0.75,1,1,1,1,1}
--Weapon:Dgun
ReloadTime3 = {0.9,0.9,0.8,0.8,0.7,0.7,0.6,0.6,0.6,0.5,0.4}
--Speeds
BuildSpeed = {300,325,350,400,450,500,550,600,700,800,900}
MoveSpeed = {1.25,1.275,1.3,1.35,1.40,1.45,1.5,1.5,1.5,1.5,1.5}
--Armor/hp
ShieldPower = {1000,1250,1500,2000,2500,3000,4000,4000,4000,4000,4000}
ShieldRadius = {30,30,30,35,35,35,40,40,40,45,45}
HealOnLevelUp = {0,250,250,500,500,750,750,1000,1000,1000,1000}
DamageMultiplierNoDgun = {1,1,1,1,1,1,0.95,0.9,0.85,0.8,0.75}
--Vision
LOS = {450,500,550,600,625,650,675,700,725,750,800}
Sonar = {450,450,500,500,550,550,600,600,650,650,700}
Radar = {700,700,800,1000,1200,1400,1600,2000,2400,2800,3200}


tablearmcom = {
		acceleration = 0.18,
		activatewhenbuilt = true,
		autoheal = 5,
		brakerate = 1.125,
		buildcostenergy = 26700,
		buildcostmetal = 2670,
		builddistance = 130,
		builder = true,
		shownanospray = false,
		buildpic = "ARMCOM.DDS",
		buildtime = 75000,
		cancapture = true,
		canmanualfire = true,
		canmove = true,
		capturespeed = 1800,
		category = "ALL WEAPON NOTSUB COMMANDER NOTSHIP NOTAIR NOTHOVER SURFACE CANBEUW",
		cloakcost = 100,
		cloakcostmoving = 1000,
		collisionvolumeoffsets = "0 -1 0",
		collisionvolumescales = "27 39 27",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		description = "Commander",
		energymake = 25,
		explodeas = "commanderExplosion",
		footprintx = 2,
		footprintz = 2,
		hidedamage = true,
		icontype = "armcommander",
		idleautoheal = 5,
		idletime = 1800,
		losemitheight = 40,
		mass = 5000,
		maxdamage = 3000,
		maxslope = 20,
		maxvelocity = 1.25,
		maxwaterdepth = 35,
		metalmake = 1.5,
		mincloakdistance = 50,
		movementclass = "AKBOT2",
		name = "Commander",
		nochasecategory = "ALL",
		objectname = "ARMCOM",
		pushresistant = true,
		radardistance = 700,
		radaremitheight = 40,
		reclaimable = false,
		seismicsignature = 0,
		selfdestructas = "commanderexplosion",
		selfdestructcountdown = 5,
		showplayername = true,
		sightdistance = 450,
		sonardistance = 450,
		terraformspeed = 1500,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0.825,
		turnrate = 1148,
		upright = true,
		workertime = 300,
		buildoptions = {
			[1] = "armsolar",
			[2] = "armwin",
			[3] = "armmstor",
			[4] = "armestor",
			[5] = "armmex",
			[6] = "armmakr",
			[7] = "armlab",
			[8] = "armvp",
			[9] = "armap",
			[10] = "armeyes",
			[11] = "armrad",
			[12] = "armdrag",
			[13] = "armllt",
			[14] = "armrl",
			[15] = "armdl",
			[16] = "armtide",
			[17] = "armuwms",
			[18] = "armuwes",
			[19] = "armomex",
			[20] = "armfmkr",
			[21] = "armsy",
			-- [22] = "armsonar",
			[22] = "armfdrag",
			[23] = "armtl",
			-- [24] = "armgplat",
			[24] = "armfrt",
			[25] = "armfrad",
			-- [28] = "seaplatform",
		},
		customparams = {
			--death_sounds = "commander",
			area_mex_def = "armmex",
			iscommander = true,
			paralyzemultiplier = 0.025,
		},
		featuredefs = {
			dead = {
				blocking = true,
				collisionvolumeoffsets = "0 0 0",
				collisionvolumescales = "47 10 47",
				collisionvolumetype = "CylY",
				damage = 10000,
				description = "Commander Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				hitdensity = 100,
				metal = wreck_metal,
				object = "ARMCOM_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 5000,
				description = "Commander Debris",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 1250,
				object = "2X2F",
                collisionvolumescales = "35.0 4.0 6.0",
                collisionvolumetype = "cylY",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = { 
 			 pieceExplosionGenerators = { 
 				"deathceg3",
 				"deathceg4",
 			}, 
			explosiongenerators = {
				[1] = "custom:com_sea_laser_bubbles",
				[2] = "custom:barrelshot-medium",
			},
		},
		sounds = {
			build = "nanlath1",
			canceldestruct = "cancel2",
			capture = "capture1",
			cloak = "kloak1",
			repair = "repair1",
			uncloak = "kloak1un",
			underattack = "warning2",
			unitcomplete = "kcarmmov",
			working = "reclaim1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "kcarmmov",
			},
			select = {
				[1] = "kcarmsel",
			},
		},
		weapondefs = {
			disintegrator = {
				areaofeffect = 36,
				avoidfeature = false,
				avoidfriendly = false,
				avoidground = false,
				commandfire = true,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				--waterbounce = true, -- weapon will stick to the surface
				groundbounce = true,
				bounceRebound = 0, --stick the explosion to ground with 0 vertical component
				waterweapon = true, --dgun can pass trough water
				firesubmersed = false, -- but not _fire_ underwater
				energypershot = 500,
                cegTag = "dgunprojectile",
				explosiongenerator = "custom:expldgun",
				firestarter = 100,
				impulseboost = 0,
				impulsefactor = 0,
				name = "Disintegrator",
				noexplode = true,
				noselfdamage = true,
				range = 250,
				reloadtime = 0.9,
				soundhit = "xplomas2",
				soundhitwet = "sizzle",
				soundhitwetvolume = 0.5,
				soundstart = "disigun1",
				soundtrigger = true,
				tolerance = 10000,
				turret = true,
				weapontimer = 4.2,
				weapontype = "DGun",
				weaponvelocity = 300,
				damage = {
					default = 99999,
				},
			},
			armcomlaser = {
				areaofeffect = 12,
				avoidfeature = false,
				beamtime = 0.1,
				corethickness = 0.1,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 0.99,
				explosiongenerator = "custom:laserhit-small-red",
				firestarter = 70,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 7,
				name = "J7Laser",
				noselfdamage = true,
				range = 300,
				reloadtime = 0.4,
				rgbcolor = "1 0 0",
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundhitwetvolume = 0.5,
				soundstart = "lasrfir1",
				soundtrigger = 1,
				targetmoveerror = 0.05,
				thickness = 2,
				tolerance = 10000,
				turret = true,
				weapontype = "BeamLaser",
				weaponvelocity = 900,
				damage = {
					bombers = 180,
					default = 75,
					fighters = 110,
					subs = 5,
				},
			},
			armcomsealaser = {
				areaofeffect = 12,
				avoidfeature = false,
				beamtime = 0.3,
				corethickness = 0.4,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 1,
				explosiongenerator = "custom:laserhit-small-blue",
				firestarter = 35,
				firesubmersed = true,
				impactonly = 1,
				impulseboost = 0,
				impulsefactor = 0,
				intensity = 0.3,
				laserflaresize = 7,
				name = "J7NSLaser",
				noselfdamage = true,
				range = 260,
				reloadtime = 1,
				rgbcolor = "0.2 0.2 0.6",
				rgbcolor2 = "0.2 0.2 0.2",
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundhitwetvolume = 0.5,
				soundstart = "uwlasrfir1",
				soundtrigger = 1,
				targetmoveerror = 0.05,
				thickness = 5,
				tolerance = 10000,
				turret = true,
				waterweapon = true,
				weapontype = "BeamLaser",
				weaponvelocity = 900,
				damage = {
					default = 150,
					subs = 75,
				},
			},
			repulsor1 = {
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				name = "PlasmaRepulsor",
				range = 50,
				soundhitwet = "sizzle",
				soundhitwetvolume = 0.5,
				weapontype = "Shield",
				damage = {
					default = 100,
				},
				shield = {
					alpha = 0.25,
					energyuse = 0,
					force = 2.5,
					intercepttype = 511,
					power = 1000,
					powerregen = 20,
					powerregenenergy = 0,
					radius = 30,
					repulser = false,
					smart = true,
					startingpower = 1000,
					visible = true,
					visiblehitframes = 70,
					badcolor = {
						[1] = 1,
						[2] = 0.2,
						[3] = 0.2,
						[4] = 0.25,
					},
					goodcolor = {
						[1] = 0.2,
						[2] = 1,
						[3] = 0.2,
						[4] = 0.2,
					},
				},
			},
		},
		weapons = {
			[1] = {
				def = "ARMCOMLASER",
				onlytargetcategory = "NOTSUB",
			},
			[2] = {
				badtargetcategory = "VTOL",
				def = "ARMCOMSEALASER",
			},
			[3] = {
				def = "DISINTEGRATOR",
				onlytargetcategory = "NOTSUB",
			},
		},
	}
if (Spring.GetModOptions) and Spring.GetModOptions().mo_unba and Spring.GetModOptions().mo_unba == "enabled" then
	tablearmcom.autoheal = 2
	tablearmcom.weapondefs.armcomlaser.weapontype = "LaserCannon"
	tablearmcom.weapons = {}
	tablearmcom.script = "ARMCOM_LUS.LUA"
	tablearmcom.objectname = "UNBAARMCOM.3DO"
	--Weapon: Laser
	tablearmcom.weapondefs.armcomlaser2 = deepcopy(tablearmcom.weapondefs.armcomlaser)
	tablearmcom.weapondefs.armcomlaser.weapontype = "BeamLaser"
	tablearmcom.weapondefs.armcomlaser2.damage.default = Damages[2]
	tablearmcom.weapondefs.armcomlaser2.range = Range[2]
	tablearmcom.weapondefs.armcomlaser2.areaofeffect = AOE[2]
	tablearmcom.weapondefs.armcomlaser2.reloadtime = ReloadTime[2]
for i = 3,11 do
	I = tostring(i)
	H = tostring(i-1)
	tablearmcom.weapondefs["armcomlaser"..I] = deepcopy(tablearmcom.weapondefs["armcomlaser"..H])
	tablearmcom.weapondefs["armcomlaser"..I].damage.default = Damages[i]
	tablearmcom.weapondefs["armcomlaser"..I].range = Range[i]
	tablearmcom.weapondefs["armcomlaser"..I].areaofeffect = AOE[i]
	tablearmcom.weapondefs["armcomlaser"..I].reloadtime = ReloadTime[i]
	if i == 3 then
		tablearmcom.weapondefs.armcomlaser3.rgbcolor = "0.75 0.25 0"
	elseif i == 6 then
		tablearmcom.weapondefs.armcomlaser6.rgbcolor = "0.5 0.5 0"
	elseif i == 8 then
		tablearmcom.weapondefs.armcomlaser8.rgbcolor = "0.25 0.75 0"
	elseif i == 10 then
		tablearmcom.weapondefs.armcomlaser10.rgbcolor = "0 1 0"
	end
end

for i = 1,11 do
	if i == 1 then
		tablearmcom.weapons[1] = {
				def = "ARMCOMLASER",
				onlytargetcategory = "NOTSUB",
				}
	else
		tablearmcom.weapons[i] = {
				def = "ARMCOMLASER"..tostring(i),
				onlytargetcategory = "NOTSUB",
				}
	end
end
	--Weapon: SeaLaser
tablearmcom.weapondefs.armcomsealaser2 = deepcopy(tablearmcom.weapondefs.armcomsealaser)
	tablearmcom.weapondefs["armcomsealaser2"].damage.default = Damages21[2]
	tablearmcom.weapondefs["armcomsealaser2"].damage.subs = Damages22[2]*Damages21[2]
	tablearmcom.weapondefs["armcomsealaser2"].range = Range2[2]
	tablearmcom.weapondefs["armcomsealaser2"].areaofeffect = AOE2[2]
	tablearmcom.weapondefs["armcomsealaser2"].reloadtime = ReloadTime2[2]
for i = 3,11 do
	I = tostring(i)
	H = tostring(i-1)
	tablearmcom.weapondefs["armcomsealaser"..I] = deepcopy(tablearmcom.weapondefs["armcomsealaser"..H])
	tablearmcom.weapondefs["armcomsealaser"..I].damage.default = Damages21[i]
	tablearmcom.weapondefs["armcomsealaser"..I].damage.subs = Damages22[i] * Damages21[i]
	tablearmcom.weapondefs["armcomsealaser"..I].range = Range2[i]
	tablearmcom.weapondefs["armcomsealaser"..I].areaofeffect = AOE2[i]
	tablearmcom.weapondefs["armcomsealaser"..I].reloadtime = ReloadTime2[i]
	if i == 3 then
		tablearmcom.weapondefs.armcomsealaser3.rgbcolor = "0.75 0.25 0"
	elseif i == 6 then
		tablearmcom.weapondefs.armcomsealaser6.rgbcolor = "0.5 0.5 0"
	elseif i == 8 then
		tablearmcom.weapondefs.armcomsealaser8.rgbcolor = "0.25 0.75 0"
	elseif i == 10 then
		tablearmcom.weapondefs.armcomsealaser10.rgbcolor = "0 1 0"
	end
end

for i = 12,22 do
	if i - 11 == 1 then
		tablearmcom.weapons[12] = {
				def = "ARMCOMSEALASER",
				badtargetcategory = "VTOL",
				}
	else
		tablearmcom.weapons[i] = {
				def = "ARMCOMSEALASER"..tostring(i-11),
				badtargetcategory = "VTOL",
				}
	end
end

	--Weapon: Shield

for i = 2,7 do
	I = tostring(i)
	H = tostring(i-1)
	tablearmcom.weapondefs["repulsor"..I] = deepcopy(tablearmcom.weapondefs["repulsor"..H])
	tablearmcom.weapondefs["repulsor"..I].shield.power = ShieldPower[i]
	tablearmcom.weapondefs["repulsor"..I].shield.radius = ShieldRadius[i]
end

for i = 23,29 do
	tablearmcom.weapons[i] = {
			def = "REPULSOR"..tostring(i-22),
			}
end
	
tablearmcom.weapons[30] ={
				def = "DISINTEGRATOR",
				onlytargetcategory = "NOTSUB",
			}

end
return { armcom = deepcopy(tablearmcom) }



