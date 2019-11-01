/decl/hierarchy/outfit/job/ascent
	name = "Ascent - Gyna"
	uniform =  /obj/item/clothing/under/ascent
	id_type =  /obj/item/weapon/card/id/ascent
	shoes =    /obj/item/clothing/shoes/magboots/ascent
	l_ear =    null
	pda_type = null
	pda_slot = 0
	flags =    0

/decl/hierarchy/outfit/job/ascent/tech
	name = "Ascent - Tecnico"
	suit = /obj/item/clothing/suit/storage/ascent

/obj/item/clothing/shoes/magboots/ascent
	name = "artigli magnetici mantidi"
	desc = "Un set di potenti artigli magnetici."
	icon_state = "ascent_boots0"
	icon_base = "ascent_boots"
	species_restricted = list(SPECIES_MANTID_ALATE, SPECIES_MANTID_GYNE)
	sprite_sheets = list(
		SPECIES_MANTID_GYNE =  'icons/mob/species/mantid/onmob_shoes_gyne.dmi',
		SPECIES_MANTID_ALATE = 'icons/mob/species/mantid/onmob_shoes_alate.dmi'
	)

/obj/item/clothing/under/ascent
	name = "sottotuta mantide"
	desc = "Una tuta a coste e spugnosa di qualche tipo. Ha una manica grande per una coda, quindi probabilmente non e per gli umani."
	species_restricted = ALL_ASCENT_SPECIES
	icon_state = "ascent"
	worn_state = "ascent"
	color = COLOR_DARK_GUNMETAL

/obj/item/clothing/suit/storage/ascent
	name = "imbracatura mantide"
	desc = "Un groviglio complesso di cavi e cinghie articolati."
	species_restricted = ALL_ASCENT_SPECIES
	icon_state = "ascent_harness"
	body_parts_covered = 0

/obj/item/clothing/suit/storage/ascent/Initialize()
	. = ..()
	for(var/tool in list(
		/obj/item/weapon/gun/energy/particle/small,
		/obj/item/device/multitool/mantid,
		/obj/item/clustertool,
		/obj/item/clustertool,
		/obj/item/weapon/weldingtool/electric/mantid,
		/obj/item/stack/medical/resin
	))
		new tool(pockets)
	pockets.make_exact_fit()
	pockets.can_hold |= /obj/item/weapon/reagent_containers/food/drinks/cans/waterbottle/ascent
