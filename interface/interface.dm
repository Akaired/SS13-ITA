//Please use mob or src (not usr) in these procs. This way they can be called in the same fashion as procs.
/client/verb/wiki()
	set name = "Wiki"
	set desc = "Vista la wiki."
	set hidden = 1
	if( config.wikiurl )
		if(alert("Questa decisione aprirà la wiki sul tuo browser. Confermi?",,"Si","No")=="No")
			return
		send_link(src, config.wikiurl)
	else
		to_chat(src, "<span class='warning'>L'URL della wiki non è stato identificato nei config del server.</span>")
	return

/client/verb/github()
	set name = "GitHub"
	set desc = "Visita la Repository GitHub."
	set hidden = 1
	if( config.githuburl )
		if(alert("Questa decisione aprirà la Repository GitHub sul tuo browser. Confermi?",,"Si","No")=="No")
			return
		send_link(src, config.githuburl)
	else
		to_chat(src, "<span class='warning'>L'URL github non è stato identificato nei config del server.</span>")
	return

/client/verb/bugreport()
	set name = "Segnalazione Bug"
	set desc = "Visita la Repository GitHub per segnalare un bug o errore."
	set hidden = 1
	if( config.issuereporturl )
		if(alert("Questa decisione aprirà la Repository GitHub sul tuo browser. Confermi?",,"Si","No")=="No")
			return
		send_link(src, config.issuereporturl)
	else
		to_chat(src, "<span class='warning'>L'URL github non è stato identificato nei config del server.</span>")
	return

/client/verb/forum()
	set name = "Forum"
	set desc = "Visita il forum."
	set hidden = 1
	if( config.forumurl )
		if(alert("Questa decisione aprirà il Forum sul tuo browser. Confermi?",,"Si","No")=="No")
			return
		send_link(src, config.forumurl)
	else
		to_chat(src, "<span class='warning'>L'URL del forum non è stato identificato nei config del server.</span>")
	return

#define RULES_FILE "config/rules.html"
/client/verb/rules()
	set name = "Regole"
	set desc = "Mostra le regole del server."
	set hidden = 1
	show_browser(src, file(RULES_FILE), "window=rules;size=480x320")
#undef RULES_FILE

#define LORE_FILE "config/lore.html"
/client/verb/lore_splash()
	set name = "Lore"
	set desc = "Ti porta alla Lore."
	set hidden = 1
	show_browser(src, file(LORE_FILE), "window=lore;size=480x320")
#undef LORE_FILE

/client/verb/hotkeys_help()
	set name = "Hotkeys Help"
	set category = "OOC"

	var/admin = {"<font color='purple'>
Admin:
\tF5 = Aghost (admin-ghost)
\tF6 = player-panel-new
\tF7 = admin-pm
\tF8 = Invisimin
</font>"}

	var/hotkey_mode = {"<font color='purple'>
Hotkey-Mode: (hotkey-mode must be on)
\tTAB = toggle hotkey-mode
\ta = left
\ts = down
\td = right
\tw = up
\t, = move-upwards
\t. = move-down
\tq = drop
\te = equip
\tr = throw
\tt = say
\t5 = emote
\tx = swap-hand
\tz = activate held object (or y)
\tj = toggle-aiming-mode
\tf = cycle-intents-left
\tg = cycle-intents-right
\t1 = help-intent
\t2 = disarm-intent
\t3 = grab-intent
\t4 = harm-intent
</font>"}

	var/other = {"<font color='purple'>
Any-Mode: (hotkey doesn't need to be on)
\tCtrl+a = left
\tCtrl+s = down
\tCtrl+d = right
\tCtrl+w = up
\tCtrl+q = drop
\tCtrl+e = equip
\tCtrl+r = throw
\tCtrl+x or Middle Mouse = swap-hand
\tCtrl+z = activate held object (or Ctrl+y)
\tCtrl+f = cycle-intents-left
\tCtrl+g = cycle-intents-right
\tCtrl+1 = help-intent
\tCtrl+2 = disarm-intent
\tCtrl+3 = grab-intent
\tCtrl+4 = harm-intent
\tF1 = adminhelp
\tF2 = ooc
\tF3 = say
\tF4 = emote
\tDEL = pull
\tINS = cycle-intents-right
\tHOME = drop
\tPGUP or Middle Mouse = swap-hand
\tPGDN = activate held object
\tEND = throw
\tCtrl + Click = drag
\tShift + Click = examine
\tAlt + Click = show entities on turf
\tCtrl + Alt + Click = interact with certain items
</font>"}

	var/robot_hotkey_mode = {"<font color='purple'>
Hotkey-Mode: (hotkey-mode must be on)
\tTAB = toggle hotkey-mode
\ta = left
\ts = down
\td = right
\tw = up
\tq = unequip active module
\tt = say
\tx = cycle active modules
\tz = activate held object (or y)
\tf = cycle-intents-left
\tg = cycle-intents-right
\t1 = activate module 1
\t2 = activate module 2
\t3 = activate module 3
\t4 = toggle intents
\t5 = emote
</font>"}

	var/robot_other = {"<font color='purple'>
Any-Mode: (hotkey doesn't need to be on)
\tCtrl+a = left
\tCtrl+s = down
\tCtrl+d = right
\tCtrl+w = up
\tCtrl+q = unequip active module
\tCtrl+x = cycle active modules
\tCtrl+z = activate held object (or Ctrl+y)
\tCtrl+f = cycle-intents-left
\tCtrl+g = cycle-intents-right
\tCtrl+1 = activate module 1
\tCtrl+2 = activate module 2
\tCtrl+3 = activate module 3
\tCtrl+4 = toggle intents
\tF1 = adminhelp
\tF2 = ooc
\tF3 = say
\tF4 = emote
\tDEL = pull
\tINS = toggle intents
\tPGUP = cycle active modules
\tPGDN = activate held object
\tCtrl + Click = drag or bolt doors
\tShift + Click = examine or open doors
\tAlt + Click = show entities on turf
\tCtrl + Alt + Click = electrify doors
</font>"}

	if(isrobot(src.mob))
		to_chat(src, robot_hotkey_mode)
		to_chat(src, robot_other)
	else
		to_chat(src, hotkey_mode)
		to_chat(src, other)
	if(holder)
		to_chat(src, admin)
