MANTIDIFY(/obj/machinery/power/apc/hyper, "mantid power node", "power controller")
MANTIDIFY(/obj/machinery/atmospherics/unary/vent_pump/on, "mantid atmosphere outlet", "vent")
MANTIDIFY(/obj/machinery/atmospherics/unary/vent_scrubber/on, "mantid atmosphere intake", "scrubber")
MANTIDIFY(/obj/machinery/hologram/holopad/longrange, "mantid holopad", "holopad")
MANTIDIFY(/obj/machinery/optable, "mantid operating table", "operating table")
MANTIDIFY(/obj/machinery/door/airlock/external/bolted, "mantid airlock", "door")

/obj/machinery/optable/ascent
	construct_state = /decl/machine_construction/default/no_deconstruct
	base_type = /obj/machinery/optable

/obj/machinery/portable_atmospherics/hydroponics/ascent
	name = "vasca di alghe mantidi"
	desc = "Una strana tecnologia idroponica aliena."
	icon = 'icons/obj/machines/mantid_hydroponics.dmi'
	closed_system = TRUE
	construct_state = /decl/machine_construction/default/no_deconstruct
	base_type = /obj/machinery/portable_atmospherics/hydroponics

// No maintenance needed.
/obj/machinery/portable_atmospherics/hydroponics/ascent/Process()
	if(dead)
		seed = null
		update_icon()
	if(!seed)
		seed = SSplants.seeds["algae"]
		update_icon()
	waterlevel = 100
	nutrilevel = 10
	pestlevel = 0
	weedlevel = 0
	mutation_level = 0
	health = 100
	sampled = 0
	. = ..()

/obj/machinery/atmospherics/unary/vent_scrubber/on/ascent/Initialize()
	. = ..()
	scrubbing_gas -= "methyl_bromide"

/obj/machinery/recharge_station/ascent
	name = "dock di ricarica mantide"
	desc = "Una strana apertura organica piena di cavi e tubi elettronici."
	icon = 'icons/obj/machines/mantid_charger.dmi'
	overlay_icon = 'icons/obj/machines/mantid_charger.dmi'
	construct_state = /decl/machine_construction/default/no_deconstruct
	base_type = /obj/machinery/recharge_station

/obj/machinery/body_scanconsole/ascent
	name = "console scanner mantide"
	desc = "Una strana console aliena."
	req_access = list(access_ascent)
	icon = 'icons/obj/ascent_sleepers.dmi'
	construct_state = /decl/machine_construction/default/no_deconstruct
	base_type = /obj/machinery/body_scanconsole

/obj/machinery/bodyscanner/ascent
	name = "body scanner mantide"
	desc = "Uno strano scanner medico alieno."
	icon = 'icons/obj/ascent_sleepers.dmi'
	construct_state = /decl/machine_construction/default/no_deconstruct
	base_type = /obj/machinery/bodyscanner

/obj/machinery/sleeper/ascent
	name = "addormentatore mantide"
	desc = "Uno strano addormentatore mantide con supporto alle dialisi."
	icon = 'icons/obj/ascent_sleepers.dmi'
	base_type = /obj/machinery/sleeper
	construct_state = /decl/machine_construction/default/no_deconstruct

/obj/machinery/autolathe/ascent
	name = "\improper nanofabricatore Ascent"
	desc = "Un contenuto e complicato sistema di fabricazione circondato da uno strano polimero viola."
	icon = 'icons/obj/nanofabricator.dmi'
	req_access = list(access_ascent)
	base_type = /obj/machinery/autolathe
	construct_state = /decl/machine_construction/default/no_deconstruct

/obj/machinery/power/apc/hyper/ascent
	req_access = list(access_ascent)
	base_type = /obj/machinery/power/apc

/obj/machinery/hologram/holopad/longrange/ascent
	req_access = list(access_ascent)

/obj/effect/catwalk_plated/ascent
	color = COLOR_GRAY40

/obj/machinery/door/airlock/ascent
	desc = "Una strana porta aliena."
	icon =                'icons/obj/doors/ascent/base.dmi'
	bolts_file =          'icons/obj/doors/ascent/lights_bolts.dmi'
	deny_file =           'icons/obj/doors/ascent/lights_deny.dmi'
	lights_file =         'icons/obj/doors/ascent/lights_green.dmi'
	panel_file =          'icons/obj/doors/ascent/panel.dmi'
	sparks_damaged_file = 'icons/obj/doors/ascent/sparks_damaged.dmi'
	sparks_broken_file =  'icons/obj/doors/ascent/sparks_broken.dmi'
	welded_file =         'icons/obj/doors/ascent/welded.dmi'
	emag_file =           'icons/obj/doors/ascent/emag.dmi'

/obj/machinery/door/airlock/ascent/set_airlock_overlays(state)
	return

/obj/machinery/door/airlock/external/bolted/ascent
	door_color = COLOR_PURPLE
	stripe_color = COLOR_GRAY40

/obj/machinery/power/apc/hyper/ascent/north
	name = "north bump"
	pixel_x = 0
	pixel_y = 24
	dir = NORTH

/obj/machinery/power/apc/hyper/ascent/south
	name = "south bump"
	pixel_x = 0
	pixel_y = -24
	dir = SOUTH

/obj/machinery/power/apc/hyper/ascent/east
	name = "east bump"
	pixel_x = 24
	pixel_y = 0
	dir = EAST

/obj/machinery/power/apc/hyper/ascent/west
	name = "west bump"
	pixel_x = -24
	pixel_y = 0
	dir = WEST

/obj/machinery/light/ascent
	name = "luce mantide"
	light_type = /obj/item/weapon/light/tube/ascent
	desc = "Strana tecnologia di illuminazione aliena."

/obj/machinery/computer/ship/helm/ascent
	icon_state = "ascent"
	icon_keyboard = "ascent_key"
	icon_screen = "ascent_screen"
	req_access = list(access_ascent)
	construct_state = /decl/machine_construction/default/panel_closed/computer/no_deconstruct
	base_type = /obj/machinery/computer/ship/helm

/obj/machinery/computer/ship/engines/ascent
	icon_state = "ascent"
	icon_keyboard = "ascent_key"
	icon_screen = "ascent_screen"
	req_access = list(access_ascent)
	construct_state = /decl/machine_construction/default/panel_closed/computer/no_deconstruct
	base_type = /obj/machinery/computer/ship/engines

/obj/machinery/computer/ship/navigation/ascent
	icon_state = "ascent"
	icon_keyboard = "ascent_key"
	icon_screen = "ascent_screen"
	req_access = list(access_ascent)
	construct_state = /decl/machine_construction/default/panel_closed/computer/no_deconstruct
	base_type = /obj/machinery/computer/ship/navigation

/obj/machinery/computer/ship/sensors/ascent
	icon_state = "ascent"
	icon_keyboard = "ascent_key"
	icon_screen = "ascent_screen"
	req_access = list(access_ascent)
	construct_state = /decl/machine_construction/default/panel_closed/computer/no_deconstruct
	base_type = /obj/machinery/computer/ship/sensors

// This is an absolutely stupid machine. Basically the same as the debug one with some alterations.
// It is a placeholder for a proper reactor setup (probably a RUST descendant)
/obj/machinery/power/ascent_reactor
	name = "stack di fusione mantide"
	desc = "Un assemblaggio alto e scintillante di macchinari alieni avanzati. Ronza e scoppietta con picchi energetici variabili."
	icon = 'icons/obj/machines/power/fusion_core.dmi'
	icon_state = "core1"
	color = COLOR_PURPLE
	var/on = TRUE
	var/output_power = 9000 KILOWATTS
	var/image/field_image

/obj/machinery/power/ascent_reactor/attack_hand(mob/user)
	. = ..()

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.species.name != SPECIES_MANTID_GYNE && H.species.name != SPECIES_MONARCH_QUEEN)
			to_chat(H, SPAN_WARNING("Non hai idea di come usare \the [src]."))
			return
	else if(!istype(user, /mob/living/silicon/robot/flying/ascent))
		to_chat(user, SPAN_WARNING("Non hai idea di come interfacciarti a \the [src]."))
		return

	user.visible_message(SPAN_NOTICE("\The [user] accende \the [src] [on ? "off" : "on"]."))
	on = !on
	update_icon()

/obj/machinery/power/ascent_reactor/on_update_icon()
	. = ..()

	if(!field_image)
		field_image = image(icon = 'icons/obj/machines/power/fusion.dmi', icon_state = "emfield_s1")
		field_image.color = COLOR_CYAN
		field_image.alpha = 50
		field_image.layer = SINGULARITY_LAYER
		field_image.plane = EFFECTS_BELOW_LIGHTING_PLANE
		field_image.appearance_flags |= RESET_COLOR

		var/matrix/M = matrix()
		M.Scale(3)
		field_image.transform = M

	if(on)
		overlays |= field_image
		set_light(0.8, 1, 6, l_color = COLOR_CYAN)
		icon_state = "core1"
	else
		overlays -= field_image
		set_light(0)
		icon_state = "core0"

/obj/machinery/power/ascent_reactor/Initialize()
	. = ..()
	update_icon()

/obj/machinery/power/ascent_reactor/Process()
	if(on)
		add_avail(output_power)

/obj/machinery/power/smes/buildable/power_shuttle/ascent
	name = "batteria mantide"
	desc = "Una strana batteria aliena."
	icon = 'icons/obj/machines/power/mantid_smes.dmi'
	overlay_icon = 'icons/obj/machines/power/mantid_smes.dmi'
	construct_state = /decl/machine_construction/default/no_deconstruct
