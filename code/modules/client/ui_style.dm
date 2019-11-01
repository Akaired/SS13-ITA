

/var/all_ui_styles = list(
	"Midnight"     = 'icons/mob/screen/midnight.dmi',
	"Orange"       = 'icons/mob/screen/orange.dmi',
	"old"          = 'icons/mob/screen/old.dmi',
	"White"        = 'icons/mob/screen/white.dmi',
	"old-noborder" = 'icons/mob/screen/old-noborder.dmi',
	"minimalist"   = 'icons/mob/screen/minimalist.dmi'
	)

/proc/ui_style2icon(ui_style)
	if(ui_style in all_ui_styles)
		return all_ui_styles[ui_style]
	return all_ui_styles["White"]


/client/verb/change_ui()
	set name = "Modifica l'UI"
	set category = "OOC"
	set desc = "Configura la tua interfaccia utente"

	if(!ishuman(usr))
		to_chat(usr, "<span class='warning'>Devi essere umano per utilizzare questo verb.</span>")
		return

	var/UI_style_new = input(usr, "Scegli uno stile. Ti consigliamo il bianco per maggior customizzazione.") as null|anything in all_ui_styles
	if(!UI_style_new) return

	var/UI_style_alpha_new = input(usr, "Scegli un nuovo parametro alpha (transparenza) per la tua UI, tra 50 e 255") as null|num
	if(!UI_style_alpha_new | !(UI_style_alpha_new <= 255 && UI_style_alpha_new >= 50)) return

	var/UI_style_color_new = input(usr, "Scegli un colore per la tua UI. I colori scuri sono sconsigliati!") as color|null
	if(!UI_style_color_new) return

	//update UI
	var/list/icons = usr.hud_used.adding + usr.hud_used.other + usr.hud_used.hotkeybuttons
	icons.Add(usr.zone_sel)
	icons.Add(usr.gun_setting_icon)
	icons.Add(usr.item_use_icon)
	icons.Add(usr.gun_move_icon)
	icons.Add(usr.radio_use_icon)

	var/icon/ic = all_ui_styles[UI_style_new]

	for(var/obj/screen/I in icons)
		if(I.name in list(I_HELP, I_HURT, I_DISARM, I_GRAB)) continue
		I.icon = ic
		I.color = UI_style_color_new
		I.alpha = UI_style_alpha_new


	if(alert("Ti piace? Vuoi salvare i cambiamenti?",,"Si", "No") == "Si")
		prefs.UI_style = UI_style_new
		prefs.UI_style_alpha = UI_style_alpha_new
		prefs.UI_style_color = UI_style_color_new
		SScharacter_setup.queue_preferences_save(prefs)
		to_chat(usr, "L'UI è stata salvata")
