// Rigs and gear themselves.
/obj/item/weapon/rig/mantid
	name = "esotuta alata di supporto"
	desc = "Un potente supporto di supporto con alimentatore integrato, armi e atmosfera. E piu vicino a un mech che a un rig."
	icon_state = "kexosuit"
	item_state = null
	suit_type = "support exosuit"
	armor = list(melee = 65, bullet = 65, laser = 65, energy = 55, bomb = 75, bio = 100, rad = 100)
	online_slowdown = 0
	offline_slowdown = 1
	equipment_overlay_icon = null
	air_type =   /obj/item/weapon/tank/mantid
	cell_type =  /obj/item/weapon/cell/mantid
	chest_type = /obj/item/clothing/suit/space/rig/mantid
	helm_type =  /obj/item/clothing/head/helmet/space/rig/mantid
	boot_type =  /obj/item/clothing/shoes/magboots/rig/mantid
	glove_type = /obj/item/clothing/gloves/rig/mantid
	update_visible_name = TRUE
	icon_override = 'icons/mob/species/mantid/onmob_back_alate.dmi'
	sprite_sheets = list(
		SPECIES_MANTID_GYNE =  'icons/mob/species/mantid/onmob_back_gyne.dmi',
		SPECIES_MANTID_ALATE = 'icons/mob/species/mantid/onmob_back_alate.dmi',
		SPECIES_NABBER =       'icons/mob/species/nabber/onmob_back_gas.dmi'
		)
	initial_modules = list(
		/obj/item/rig_module/vision/thermal,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/chem_dispenser/mantid,
		/obj/item/rig_module/device/multitool,
		/obj/item/rig_module/device/cable_coil,
		/obj/item/rig_module/device/welder,
		/obj/item/rig_module/device/clustertool,
		/obj/item/rig_module/mounted/plasmacutter,
		/obj/item/rig_module/maneuvering_jets
		)
	req_access = list(access_ascent)
	var/mantid_caste = SPECIES_MANTID_ALATE

// Renamed blade.
/obj/item/rig_module/mounted/energy_blade/mantid
	name = "proiettore a nanolame"
	desc = "Un nanofabricatore a lame alimentato a fusione con design Ascent."
	interface_name = "nanoblade projector"
	interface_desc = "Un nanofabricatore a lame alimentato a fusione con design Ascent."
	icon = 'icons/obj/ascent.dmi'
	icon_state = "blade"
	interface_name = "nanoblade"
	usable = FALSE
	gun = null

/obj/item/rig_module/mounted/flechette_rifle
	name = "fucile flechette"
	desc = "Un nanofabricatore flechette con un sistema di lancio di design Ascent."
	interface_name = "flechette rifle"
	interface_desc = "Un nanofabricatore flechette con un sistema di lancio di design Ascent."
	icon = 'icons/obj/ascent.dmi'
	icon_state = "rifle"
	gun = /obj/item/weapon/gun/magnetic/railgun/flechette/ascent

/obj/item/rig_module/mounted/particle_rifle
	name = "fucile a particelle"
	desc = "Un fucile a particelle montato con design Ascent."
	interface_name = "particle rifle"
	interface_desc = "Un fucile a particelle montato con design Ascent."
	icon = 'icons/obj/ascent.dmi'
	icon_state = "rifle"
	gun = /obj/item/weapon/gun/energy/particle

/obj/item/rig_module/device/multitool
	name = "multitool integrato mantide"
	desc = "Un multitool integrato a sensibilita limitata in grado di interfacciarsi con qualsiasi numero di sistemi."
	interface_name = "multitool"
	interface_desc = "Un multitool integrato a sensibilita limitata in grado di interfacciarsi con qualsiasi numero di sistemi."
	device = /obj/item/device/multitool/mantid
	icon = 'icons/obj/ascent.dmi'
	icon_state = "multitool"
	usable = FALSE
	selectable = TRUE

/obj/item/rig_module/device/cable_coil
	name = "estrusore di cavi mantide"
	desc = "Un nanofabricatore di cavi con design Ascent."
	interface_name = "cable fabricator"
	interface_desc = "Un nanofabricatore di cavi con design Ascent."
	device = /obj/item/stack/cable_coil/fabricator
	icon = 'icons/obj/ascent.dmi'
	icon_state = "cablecoil"
	usable = FALSE
	selectable = TRUE

/obj/item/rig_module/device/welder
	name = "braccio saldatore mantide"
	desc = "Una torcia elettrica da taglio di design Ascent."
	interface_name = "welding arm"
	interface_desc = "Una torcia elettrica da taglio di design Ascent."
	icon = 'icons/obj/ascent.dmi'
	icon_state = "welder1"
	engage_string = "Toggle Welder"
	device = /obj/item/weapon/weldingtool/electric/mantid
	usable = TRUE
	selectable = TRUE

/obj/item/rig_module/device/clustertool
	name = "clustertool mantide"
	desc = "Un complesso complesso di teste modulari autoguidanti in grado di eseguire la maggior parte delle attivita manuali."
	interface_name = "modular clustertool"
	interface_desc = "Un complesso complesso di teste modulari autoguidanti in grado di eseguire la maggior parte delle attivita manuali."
	icon = 'icons/obj/ascent.dmi'
	icon_state = "clustertool"
	engage_string = "Select Mode"
	device = /obj/item/clustertool
	usable = TRUE
	selectable = TRUE

// Atmosphere/jetpack filler.
/obj/item/weapon/tank/mantid
	name = "reattore di gas mantide"
	desc = "Un impianto di trattamento del gas mantide che sintetizza continuamente atmosfera 'respirabile'. Forse non per gli umani."
	icon_state = "bromomethane"
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD
	volume = 180

	var/charge_cost = 12
	var/refill_gas_type = "methyl_bromide"
	var/gas_regen_amount = 0.05
	var/gas_regen_cap = 50

/obj/item/weapon/tank/mantid/Initialize()
	starting_pressure = list("[refill_gas_type]" = 6 * ONE_ATMOSPHERE)
	. = ..()

/obj/item/weapon/tank/mantid/oxygen
	name = "reattore a gas serpentide"
	refill_gas_type = "oxygen"
	distribute_pressure = 31

/obj/item/weapon/tank/mantid/Process()
	..()
	var/obj/item/weapon/rig/holder = loc
	if(air_contents.total_moles < gas_regen_cap && istype(holder) && holder.cell && holder.cell.use(charge_cost))
		air_contents.adjust_gas(refill_gas_type, gas_regen_amount)

// Chem dispenser.
/obj/item/rig_module/chem_dispenser/mantid
	name = "iniettore chimico mantide"
	desc = "Un distributore chimico compatto dal design mantide."
	interface_name = "mantid chemical injector"
	interface_desc = "Un distributore chimico compatto dal design mantide."
	icon = 'icons/obj/ascent.dmi'
	icon_state = "injector"
	charges = list(
		list("bromide",             "bromide",             /datum/reagent/toxin/bromide, 80),
		list("crystallizing agent", "crystallizing agent", /datum/reagent/crystal,       80),
		list("spaceacillin",        "spaceacillin",        /datum/reagent/spaceacillin,  80),
		list("tramadol",            "tramadol",            /datum/reagent/tramadol,      80)
	)

// Rig definitions.
/obj/item/weapon/rig/mantid/gyne
	name = "esotuta di supporto gina"
	armor = list(melee = 80, bullet = 80, laser = 70, energy = 45, bomb = 75, bio = 100, rad = 100)
	icon_override = 'icons/mob/species/mantid/onmob_back_gyne.dmi'
	mantid_caste = SPECIES_MANTID_GYNE
	initial_modules = list(
		/obj/item/rig_module/vision/thermal,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/chem_dispenser/mantid,
		/obj/item/rig_module/mounted/energy_blade/mantid,
		/obj/item/rig_module/mounted/flechette_rifle,
		/obj/item/rig_module/mounted/particle_rifle,
		/obj/item/rig_module/device/multitool,
		/obj/item/rig_module/device/cable_coil,
		/obj/item/rig_module/device/welder,
		/obj/item/rig_module/device/clustertool,
		/obj/item/rig_module/mounted/plasmacutter,
		/obj/item/rig_module/maneuvering_jets
	)

/obj/item/weapon/rig/mantid/nabber
	name = "esotuta di supporto serpentide"
	icon_override = 'icons/mob/species/nabber/onmob_back_gas.dmi'
	mantid_caste = SPECIES_NABBER
	air_type =   /obj/item/weapon/tank/mantid/oxygen
	chest_type = /obj/item/clothing/suit/space/rig/mantid/serpentid
	boot_type =  null

/obj/item/clothing/suit/space/rig/mantid/serpentid
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET

/obj/item/weapon/rig/mantid/nabber/queen
	name = "esotuta di supporto piccola"
	mantid_caste = SPECIES_MONARCH_QUEEN
	initial_modules = list(
		/obj/item/rig_module/vision/thermal,
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/electrowarfare_suite,
		/obj/item/rig_module/chem_dispenser/mantid,
		/obj/item/rig_module/mounted/energy_blade/mantid,
		/obj/item/rig_module/mounted/flechette_rifle,
		/obj/item/rig_module/mounted/particle_rifle,
		/obj/item/rig_module/device/multitool,
		/obj/item/rig_module/device/cable_coil,
		/obj/item/rig_module/device/welder,
		/obj/item/rig_module/device/clustertool,
		/obj/item/rig_module/mounted/plasmacutter,
		/obj/item/rig_module/maneuvering_jets
	)

/obj/item/weapon/rig/mantid/mob_can_equip(var/mob/M, var/slot)
	. = ..()
	if(. && slot == slot_back)
		var/mob/living/carbon/human/H = M
		if(!istype(H) || H.species.get_bodytype(H) != mantid_caste)
			to_chat(H, "<span class='danger'>La tua razza non può indossare \the [src].</span>")
			. = 0

/obj/item/clothing/head/helmet/space/rig/mantid
	light_color = "#00ffff"
	desc = "Piu un involucro di siluro che un elmetto."
	species_restricted = list(SPECIES_MANTID_GYNE, SPECIES_MANTID_ALATE, SPECIES_NABBER)
	sprite_sheets = list(
		SPECIES_MANTID_GYNE =  'icons/mob/species/mantid/onmob_head_gyne.dmi',
		SPECIES_MANTID_ALATE = 'icons/mob/species/mantid/onmob_head_alate.dmi',
		SPECIES_NABBER =       'icons/mob/species/nabber/onmob_head_gas.dmi'
		)

/obj/item/clothing/suit/space/rig/mantid
	desc = "E piu vicino a un mech che a una tuta."
	species_restricted = list(SPECIES_MANTID_GYNE, SPECIES_MANTID_ALATE, SPECIES_NABBER)
	sprite_sheets = list(
		SPECIES_MANTID_GYNE =  'icons/mob/species/mantid/onmob_suit_gyne.dmi',
		SPECIES_MANTID_ALATE = 'icons/mob/species/mantid/onmob_suit_alate.dmi',
		SPECIES_NABBER =       'icons/mob/species/nabber/onmob_suit_gas.dmi'
		)
	allowed = list(
		/obj/item/clustertool,
		/obj/item/weapon/gun/energy/particle/small,
		/obj/item/weapon/weldingtool/electric/mantid,
		/obj/item/device/multitool/mantid,
		/obj/item/stack/medical/resin,
		/obj/item/weapon/reagent_containers/food/drinks/cans/waterbottle/ascent
	)

/obj/item/clothing/shoes/magboots/rig/mantid
	desc = "E come un carrello elevatore altamente avanzato."
	species_restricted = list(SPECIES_MANTID_GYNE, SPECIES_MANTID_ALATE)
	sprite_sheets = list(
		SPECIES_MANTID_GYNE =  'icons/mob/species/mantid/onmob_shoes_gyne.dmi',
		SPECIES_MANTID_ALATE = 'icons/mob/species/mantid/onmob_shoes_alate.dmi'
		)

/obj/item/clothing/gloves/rig/mantid
	desc = "Sembrano un incrocio tra un apriscatole e un coltellino svizzero delle dimensioni di una scatola da scarpe."
	species_restricted = list(SPECIES_MANTID_GYNE, SPECIES_MANTID_ALATE, SPECIES_NABBER)
	sprite_sheets = list(
		SPECIES_MANTID_GYNE =  'icons/mob/species/mantid/onmob_gloves_gyne.dmi',
		SPECIES_MANTID_ALATE = 'icons/mob/species/mantid/onmob_gloves_alate.dmi',
		SPECIES_NABBER =       'icons/mob/species/nabber/onmob_hands_gas.dmi'
		)
