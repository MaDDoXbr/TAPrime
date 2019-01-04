return {
	chickend1 = {
		acceleration = 0.01,
		activatewhenbuilt = true,
		autoheal = 1,
		bmcode = "0",
		brakerate = 0.01,
		buildcostenergy = 3000,
		buildcostmetal = 120,
		builddistance = 200,
		builder = true,
		buildpic = "chickens/chickend1.dds",
		buildtime = 1800,
		canattack = true,
		canreclaim = true,
		canrestore = false,
		canstop = "1",
		category = "KBOT MOBILE WEAPON ALL NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE CHICKEN",
		collisionvolumeoffsets = "0 15 0",
		collisionvolumescales = "14 50 14",
		collisionvolumetype = "box",
		corpse = "chicken_egg",
		description = "Defense",
		energystorage = 500,
		explodeas = "custom:blood_explode",
		extractsmetal = 0.001,
		footprintx = 1,
		footprintz = 1,
		idleautoheal = 15,
		idletime = 300,
		levelground = false,
		mass = 700,
		maxdamage = 1125,
		maxslope = 255,
		maxvelocity = 0,
		maxwaterdepth = 0,
		movementclass = "CHICKENNANO",
		name = "Chicken Tube",
		noautofire = false,
		nochasecategory = "MOBILE",
		objectname = "ChickenDefenseModels/tube.s3o",
		reclaimspeed = 200,
		repairspeed = 125,
		script = "ChickenDefenseScripts/chickend1.cob",
		seismicsignature = 0,
		selfdestructas = "custom:blood_explode",
		side = "THUNDERBIRDS",
		sightdistance = 370,
		smoothanim = true,
		tedclass = "METAL",
		turnrate = 1600,
		unitname = "chickend1",
		upright = false,
		waterline = 1,
		workertime = 125,
		customparams = {
			subfolder = "other/chickens/",
		},
		featuredefs = {
			dead = {},
			heap = {},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:blood_spray",
				[2] = "custom:blood_explode",
				[3] = "custom:dirt",
			},
		},
		weapondefs = {
			weapon = {
				areaofeffect = 32,
				avoidfriendly = false,
				collidefriendly = false,
				craterboost = 0,
				cratermult = 0,
				dance = 20,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:chickenspike-large-sparks-burn",
				firestarter = 0,
				flighttime = 5,
				groundbounce = 1,
				heightmod = 0.5,
				impulseboost = 0,
				impulsefactor = 0.4,
				interceptedbyshieldtype = 4,
				metalpershot = 0,
				model = "ChickenDefenseModels/AgamAutoBurst.s3o",
				name = "Missiles",
				noselfdamage = true,
				range = 420,
				reloadtime = 2.2,
				smoketrail = true,
				startvelocity = 100,
				texture1 = "",
				texture2 = "sporetrail",
				tolerance = 10000,
				tracks = true,
				trajectoryheight = 2,
				turnrate = 24000,
				turret = true,
				waterweapon = true,
				weaponacceleration = 100,
				weapontype = "MissileLauncher",
				weaponvelocity = 500,
				wobble = 32000,
				damage = {
					default = 400,
					hvyboats = 400,
				},
			},
		},
		weapons = {
			[1] = {
				def = "WEAPON",
			},
		},
	},
}