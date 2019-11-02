/obj/item/weapon/wrench
	name = "chiave inglese"
	desc = "Una chiave combinata buona e durevole, con meccanismi universali auto-regolanti a estremita aperta e ad anello per adattarsi a un'ampia varieta di dadi e bulloni."
	icon = 'icons/obj/tools.dmi'
	icon_state = "wrench"
	item_state = "wrench"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	force = 7
	throwforce = 7.0
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_MATERIAL = 1, TECH_ENGINEERING = 1)
	matter = list(MATERIAL_STEEL = 150)
	center_of_mass = "x=17;y=16"
	attack_verb = list("spaccato", "colpito", "sbattuto", "brutalizzato")

/obj/item/weapon/wrench/Initialize()
	icon_state = "wrench[pick("","_red","_black","_green","_blue")]"
	. = ..()