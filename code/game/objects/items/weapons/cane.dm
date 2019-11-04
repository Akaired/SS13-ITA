/obj/item/weapon/cane
	name = "Bastone"
	desc = "Un Bastone usato da anziani e disabili. O da un vero galantuomo."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "cane"
	item_state = "stick"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	force = 5.0
	throwforce = 7.0
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_ALUMINIUM = 50)
	attack_verb = list("colpito", "bastonato", "disciplinato", "battuto")
	base_parry_chance = 30

/obj/item/weapon/cane/concealed
	var/concealed_blade

/obj/item/weapon/cane/concealed/New()
	..()
	var/obj/item/weapon/material/knife/folding/combat/switchblade/temp_blade = new(src)
	concealed_blade = temp_blade

/obj/item/weapon/cane/concealed/attack_self(var/mob/user)
	if(concealed_blade)
		user.visible_message("<span class='warning'>[user] ha sguainato \a [concealed_blade] da [src]!</span>", "Tu sguaini \the [concealed_blade] da [src].")
		// Calling drop/put in hands to properly call item drop/pickup procs
		playsound(user.loc, 'sound/weapons/flipblade.ogg', 50, 1)
		user.drop_from_inventory(src)
		user.put_in_hands(concealed_blade)
		user.put_in_hands(src)
		concealed_blade = null
		update_icon()
		user.update_inv_l_hand()
		user.update_inv_r_hand()
	else
		..()

/obj/item/weapon/cane/concealed/attackby(var/obj/item/weapon/material/knife/folding/W, var/mob/user)
	if(!src.concealed_blade && istype(W) && user.unEquip(W, src))
		user.visible_message("<span class='warning'>[user] ha sguaina \a [W] dentro [src]!</span>", "Tu sguaina \the [W] dentro [src].")
		src.concealed_blade = W
		update_icon()
		user.update_inv_l_hand()
		user.update_inv_r_hand()
	else
		..()

/obj/item/weapon/cane/concealed/on_update_icon()
	if(concealed_blade)
		SetName(initial(name))
		icon_state = initial(icon_state)
		item_state = initial(item_state)
	else
		SetName("Guaina del bastone")
		icon_state = "cane_noknife"
		item_state = "foldcane"