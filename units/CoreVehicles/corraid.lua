return {
	corraid = {
		acceleration = 0.021,
		brakerate = 0.09,
		buildcostenergy = 2400,
		buildcostmetal = 230,
		buildpic = "CORRAID.DDS",
		buildtime = 3312,
		canmove = true,
		category = "ALL TANK MOBILE WEAPON NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE",
		collisionvolumeoffsets = "0 -1 0",
		collisionvolumescales = "32 16 32",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		description = "Medium Assault Tank",
		energymake = 0.6,
		energyuse = 0.6,
		explodeas = "smallexplosiongeneric",
		footprintx = 2,
		footprintz = 2,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		maxdamage = 1769,
		maxslope = 10,
		maxvelocity = 2.38,
		maxwaterdepth = 12,
		movementclass = "TANK2",
		name = "Raider",
		nochasecategory = "VTOL",
		objectname = "CORRAID",
		seismicsignature = 0,
		selfdestructas = "smallExplosionGenericSelfd",
		sightdistance = 325,
		trackoffset = 6,
		trackstrength = 5,
		tracktype = "StdTank",
		trackwidth = 30,
		turninplace = true,
		turninplaceanglelimit = 110,
		turninplacespeedlimit = 1.873,
		turnrate = 408,
		script = "BASICTANKSCRIPT.LUA",
		customparams = {
			bar_trackoffset = 6,
			bar_trackstrength = 5,
			bar_trackwidth = 28,
			bar_tracktype = "corwidetracks",
			description_long = "The Raider a medium assault tank. It has a relatively high hp so it should always be kept in the first line to sink in all damage. Useful for taking down light defenses with its sheer force. If not microed well, Raiders can be easily DGuned, so try to keep enemy Commanders at a distance. Combine with Slashers or artillery for a great frontline push or use large packs for raiding enemy bases. Don't forget to bring some constructors with your assault for repairing and reclaiming wrecks.",
			--ANIMATION DATA
				--PIECENAMES HERE
					basename = "base",
					turretname = "turret",
					sleevename = "sleeve",
					cannon1name = "barrel",
					flare1name = "flare",
					cannon2name = nil, --optional (replace with nil)
					flare2name = nil, --optional (replace with nil)
				--SFXs HERE
					firingceg = "barrelshot-tiny",
					driftratio = "0.1", --How likely will the unit drift when performing turns?
					rockstrength = "5", --Howmuch will its weapon make it rock ?
					rockspeed = "80", -- More datas about rock(honestly you can keep 2 and 1 as default here)
					rockrestorespeed = "20", -- More datas about rock(honestly you can keep 2 and 1 as default here)
					cobkickbackrestorespeed = "3", --How fast will the cannon come back in position?
					kickback = "-2.4", --How much will the cannon kickback
				--AIMING HERE
					cobturretyspeed = "80", --turretSpeed as seen in COB script
					cobturretxspeed = "45", --turretSpeed as seen in COB script
					restoretime = "3000", --restore delay as seen in COB script
			},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "1.73252868652 -0.81482236084 -0.546882629395",
				collisionvolumescales = "37.1564331055 16.4705352783 33.7862091064",
				collisionvolumetype = "Box",
				damage = 975,
				description = "Raider Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				hitdensity = 100,
				metal = 167,
				object = "CORRAID_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 488,
				description = "Raider Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 67,
				object = "2X2E",
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
				"deathceg2",
				"deathceg3",
				"deathceg4",
			},
			explosiongenerators = {
				[1] = "custom:barrelshot-small",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
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
				[1] = "tcormove",
			},
			select = {
				[1] = "tcorsel",
			},
		},
		weapondefs = {
			arm_lightcannon = {
				areaofeffect = 48,
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				explosiongenerator = "custom:genericshellexplosion-small",
				firestarter = 100,
				gravityaffected = "true",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "LightCannon",
				noselfdamage = true,
				range = 350,
				reloadtime = 1.19,
				soundhit = "xplosml3",
				soundhitwet = "splshbig",
				soundhitwetvolume = 0.5,
				soundstart = "canlite3",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 225,
				damage = {
					bombers = 18,
					default = 97,
					fighters = 18,
					subs = 5,
					vtol = 18,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "ARM_LIGHTCANNON",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
