/obj/item/weapon/wirecutters
	name = "tagliafili"
	desc = "Una speciale coppia di pinze con taglienti. Diverse staffe e manipolatori integrati nell'impugnatura consentono di riparare cavi interrotti."
	icon = 'icons/obj/tools.dmi'
	icon_state = "cutters_preview"
	item_state = "cutters"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	force = 3.0
	throw_speed = 2
	throw_range = 9
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_MATERIAL = 1, TECH_ENGINEERING = 1)
	matter = list(MATERIAL_STEEL = 80)
	center_of_mass = "x=18;y=10"
	attack_verb = list("tagliato", "reciso")
	sharp = 1
	edge = 1

	var/build_from_parts = TRUE
	var/handle_icon = "cutters_handle"
	var/hardware_icon = "cutters_hardware"
	var/valid_colours = list(COLOR_RED, PIPE_COLOR_YELLOW, COLOR_BLUE_GRAY, COLOR_MAROON, COLOR_SEDONA, COLOR_BABY_BLUE, COLOR_VIOLET, COLOR_GRAY80, COLOR_GRAY20)

/obj/item/weapon/wirecutters/Initialize()
	if(build_from_parts)
		icon_state = "cutters_handle"
		color = pick(valid_colours)
		overlays += overlay_image(icon, "[hardware_icon]", flags=RESET_COLOR)
	. = ..()

/obj/item/weapon/wirecutters/attack(mob/living/carbon/C as mob, mob/user as mob)
	if(istype(C) && user.a_intent == I_HELP && (C.handcuffed) && (istype(C.handcuffed, /obj/item/weapon/handcuffs/cable)))
		usr.visible_message("\The [usr] taglia le manette di [C] con \the [src]!",\
		"Tagli le manette di [C] con \the [src]!",\
		"Senti qualcuno che taglia dei cavi.")
		C.handcuffed = null
		if(C.buckled && C.buckled.buckle_require_restraints)
			C.buckled.unbuckle_mob()
		C.update_inv_handcuffed()
		return
	else
		..()