// Quick and deliberate movements are not necessarily mutually exclusive
#define MOVE_INTENT_DELIBERATE 0x0001
#define MOVE_INTENT_EXERTIVE   0x0002
#define MOVE_INTENT_QUICK      0x0004

/decl/move_intent
	var/name
	var/flags = 0
	var/move_delay = 1
	var/hud_icon_state

/decl/move_intent/proc/can_be_used_by(var/mob/user)
	if(flags & MOVE_INTENT_QUICK)
		return user.can_sprint()
	return TRUE

/decl/move_intent/creep
	name = "Movimento stealth"
	flags = MOVE_INTENT_DELIBERATE
	hud_icon_state = "furtivo"

/decl/move_intent/creep/Initialize()
	. = ..()
	move_delay = config.creep_delay

/decl/move_intent/walk
	name = "Cammina"
	flags = MOVE_INTENT_DELIBERATE
	hud_icon_state = "camminando"

/decl/move_intent/walk/Initialize()
	. = ..()
	move_delay = config.walk_delay

/decl/move_intent/run
	name = "Corri"
	flags = MOVE_INTENT_EXERTIVE | MOVE_INTENT_QUICK
	hud_icon_state = "correndo"

/decl/move_intent/run/Initialize()
	. = ..()
	move_delay = config.run_delay
