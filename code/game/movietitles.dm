#define CREDIT_ROLL_SPEED 185
#define CREDIT_SPAWN_SPEED 20
#define CREDIT_ANIMATE_HEIGHT (14 * world.icon_size)
#define CREDIT_EASE_DURATION 22

GLOBAL_LIST(end_titles)

client
	var/list/credits

/client/proc/RollCredits()
	set waitfor = FALSE

	if(get_preference_value(/datum/client_preference/show_credits) != GLOB.PREF_YES)
		return

	if(!GLOB.end_titles)
		GLOB.end_titles = generate_titles()

	LAZYINITLIST(credits)

	if(mob)
		mob.overlay_fullscreen("fishbed",/obj/screen/fullscreen/fishbed)
		mob.overlay_fullscreen("fadeout",/obj/screen/fullscreen/fadeout)

		if(mob.get_preference_value(/datum/client_preference/play_lobby_music) == GLOB.PREF_YES)
			sound_to(mob, sound(null, channel = GLOB.lobby_sound_channel))
			if(GLOB.end_credits_song == null)
				var/title_song = pick('sound/music/THUNDERDOME.ogg', 'sound/music/europa/Chronox_-_03_-_In_Orbit.ogg', 'sound/music/europa/asfarasitgets.ogg')
				sound_to(mob, sound(title_song, wait = 0, volume = 40, channel = GLOB.lobby_sound_channel))
			else if(get_preference_value(/datum/client_preference/play_admin_midis) == GLOB.PREF_YES)
				sound_to(mob, sound(GLOB.end_credits_song, wait = 0, volume = 40, channel = GLOB.lobby_sound_channel))
	sleep(50)
	var/list/_credits = credits
	verbs += /client/proc/ClearCredits
	for(var/I in GLOB.end_titles)
		if(!credits)
			return
		var/obj/screen/credit/T = new(null, I, src)
		_credits += T
		T.rollem()
		sleep(CREDIT_SPAWN_SPEED)
	sleep(CREDIT_ROLL_SPEED - CREDIT_SPAWN_SPEED)

	ClearCredits()
	verbs -= /client/proc/ClearCredits

/client/proc/ClearCredits()
	set name = "Stop End Titles"
	set category = "OOC"
	verbs -= /client/proc/ClearCredits
	QDEL_NULL_LIST(credits)
	mob.clear_fullscreen("fishbed")
	mob.clear_fullscreen("fadeout")
	sound_to(mob, sound(null, channel = GLOB.lobby_sound_channel))

/obj/screen/credit
	icon_state = "blank"
	mouse_opacity = 0
	alpha = 0
	screen_loc = "1,1"
	plane = HUD_PLANE
	layer = HUD_ABOVE_ITEM_LAYER
	var/client/parent
	var/matrix/target

/obj/screen/credit/Initialize(mapload, credited, client/P)
	. = ..()
	parent = P
	maptext = {"<div style="font:'Small Fonts'">[credited]</div>"}
	maptext_height = world.icon_size * 2
	maptext_width = world.icon_size * 14

/obj/screen/credit/proc/rollem()
	var/matrix/M = matrix(transform)
	M.Translate(0, CREDIT_ANIMATE_HEIGHT)
	animate(src, transform = M, time = CREDIT_ROLL_SPEED)
	target = M
	animate(src, alpha = 255, time = CREDIT_EASE_DURATION, flags = ANIMATION_PARALLEL)
	spawn(CREDIT_ROLL_SPEED - CREDIT_EASE_DURATION)
		if(!QDELETED(src))
			animate(src, alpha = 0, transform = target, time = CREDIT_EASE_DURATION)
			sleep(CREDIT_EASE_DURATION)
			qdel(src)
	parent.screen += src

/obj/screen/credit/Destroy()
	var/client/P = parent
	if(parent)
		P.screen -= src
	LAZYREMOVE(P.credits, src)
	parent = null
	return ..()

/proc/generate_titles()
	var/list/titles = list()
	var/list/cast = list()
	var/list/chunk = list()
	var/list/possible_titles = list()
	var/chunksize = 0
	if(!GLOB.end_credits_title)
		/* Establish a big-ass list of potential titles for the "episode". */
		possible_titles += "LA [pick("CADUTA DI", "NASCITA DI", "SCONFITTA CON", "BATTAGLIA FINALE DI", "FACCIA OSCURA DI", "DESOLAZIONE DI", "DISTRUZIONE DI", "CRISI DI")]\
							 [pick("ASTRONAUTI", "ESSERI UMANI", "ONORE", "PAURA", "SCIMMIONI", "PIANETI INESPLORATI", "GIGANTI CORAZZATI", "SPAZZINI GALATTICI",\
							"URANIO IMPOVERITO", "MEDICINAL", "INGEGNERIA", "SICUREZZA", "RICERCA", "PERSONALE DI SERVIZIO", "COMANDO", "ESPLORATORI", "CAPO BRANCO",\
							"[uppertext(GLOB.using_map.station_name)]")]"
		possible_titles += "L'EQUIPAGGIO DIVIENE: [pick("RAZZISTA", "OMOSESSUALE", "INFETTO", "PIZZA", "PULITO", "DISOCCUPATO", "DROGATO", "NON IN VITA", "ANORESSICO", "STRONCATO DALLA GUERRA CIVILE", "IN UN BRUTTO HANGOVER", "SERIAMENTE INTERESSATO A [pick("ABUSARE DROGHE", "CRIMINE", "LAVORO DURO", "RUBARE DAGLI ARMADIETTI", "SPACEBALL", "DECOMPRESSIONE ATMOSFERICA")]")]"
		possible_titles += "L'EQUIPAGGIO SCOPRE: [pick("AMORE", "DROGHE", "I PERICOLI DEL DENARO SPORCO", "SENZAZIONI PERIANALI", "FRODI ASSICURATIVE", "ABUSI DI KELOTANO", "PROTEZIONE DALLE RADIAZIONI", "GEOMETRIA SACRA", "TEORIA DELLE STRINGHE", "MATEMATICA ASTRATTA", "RITUALI DI ACCOPPIAMENTO [pick("AFRICANI", "EUROPEI", "ARABI", "CINESI", "ASIATICI", "AMERICANI")]", "ANTICA MEDICINA CINESE")]"
		possible_titles += "A VERY [pick("CORPORATE", "NANOTRASEN", "FLEET", "HAPHAESTUS", "DAIS", "XENOLIFE", "EXPEDITIONARY", "DIONA", "PHORON", "MARTIAN", "SERPENTID")] [pick("CHRISTMAS", "EASTER", "HOLIDAY", "WEEKEND", "THURSDAY", "VACATION")]"
		possible_titles += "[pick("ARMI, ARMI OVUNQUE", "LE RAGAZZE DELLO SPOGLIATOIO DEL PONTE 4", "COSA ACCADE QUANDO UNISCI MONOSSIDO DI CARBONIO E TROPPO ALCOOL", "ATTACCO! ATTACCO! ATTACCO!", "SEX BOMB", "LA [pick("GUERRA","TREGUA","VITTORIA","SCONFITTA","BATTAGLIA","FESTA","CELEBRAZIONE")] PARTE [pick("I","II","III","IV","V","VI","VII","VIII","IX", "X", "C","M","L")]")]"
		possible_titles += "[pick("SPACE", "SEXY", "DRAGON", "WARLOCK", "LAUNDRY", "GUN", "ADVERTISING", "DOG", "CARBON MONOXIDE", "NINJA", "WIZARD", "SOCRATIC", "JUVENILE DELIQUENCY", "POLITICALLY MOTIVATED", "RADTACULAR SICKNASTY")] [pick("QUEST", "FORCE", "ADVENTURE")]"
		possible_titles += "[pick("THE DAY [uppertext(GLOB.using_map.station_short)] STOOD STILL", "HUNT FOR THE GREEN WEENIE", "ALIEN VS VENDOMAT", "SPACE TRACK")]"
		titles += "<center><h1>EPISODIO [rand(1,1000)]<br>[pick(possible_titles)]<h1></h1></h1></center>"
	else
		titles += "<center><h1>EPISODIO [rand(1,1000)]<br>[GLOB.end_credits_title]<h1></h1></h1></center>"

	for(var/mob/living/carbon/human/H in GLOB.living_mob_list_|GLOB.dead_mob_list_)
		if(findtext(H.real_name,"(mannequin)"))
			continue
		if(H.isMonkey() && findtext(H.real_name,"[lowertext(H.species.name)]")) //no monki
			continue
		if(H.timeofdeath && H.timeofdeath < 5 MINUTES) //don't mention these losers (prespawned corpses mostly)
			continue
		if(!cast.len && !chunksize)
			chunk += "CAST:"
		var/job = ""
		if(GetAssignment(H) != "Unassigned")
			job = ", [uppertext(GetAssignment(H))]"
		var/used_name = H.real_name
		var/datum/computer_file/report/crew_record/R = get_crewmember_record(H.real_name)
		if(R && R.get_rank())
			var/datum/mil_rank/rank = mil_branches.get_rank(R.get_branch(), R.get_rank())
			if(rank.name_short)
				used_name = "[rank.name_short] [used_name]"
		var/showckey = 0
		if(H.ckey && H.client)
			if(H.client.get_preference_value(/datum/client_preference/show_ckey_credits) == GLOB.PREF_SHOW)
				showckey = 1
		var/decl/cultural_info/actor_culture = SSculture.get_culture(H.get_cultural_value(TAG_CULTURE))
		if(!actor_culture || !(H.species.spawn_flags & SPECIES_CAN_JOIN) || prob(10))
			actor_culture = SSculture.get_culture(CULTURE_HUMAN)
		if(!showckey)
			if(prob(90))
				chunk += "[actor_culture.get_random_name(H.gender)]\t \t \t \t[uppertext(used_name)][job]"
			else
				var/datum/gender/G = gender_datums[H.gender]
				chunk += "[used_name]\t \t \t \t[uppertext(G.him)]SELF"
		else
			chunk += "[uppertext(actor_culture.get_random_name(H.gender))] CONOSCIUTO ANCHE COME '[uppertext(H.ckey)]'\t \t \t \t[uppertext(used_name)][job]"
		chunksize++
		if(chunksize > 2)
			cast += "<center>[jointext(chunk,"<br>")]</center>"
			chunk.Cut()
			chunksize = 0
	if(chunk.len)
		cast += "<center>[jointext(chunk,"<br>")]</center>"

	titles += cast

	var/list/corpses = list()
	var/list/monkies = list()
	for(var/mob/living/carbon/human/H in GLOB.dead_mob_list_)
		if(H.timeofdeath < 5 MINUTES) //no prespawned corpses
			continue
		if(H.isMonkey() && findtext(H.real_name,"[lowertext(H.species.name)]"))
			monkies[H.species.name] += 1
		else if(H.real_name)
			corpses += H.real_name
	for(var/spec in monkies)
		var/datum/species/S = all_species[spec]
		corpses += "[monkies[spec]] [lowertext(monkies[spec] > 1 ? S.name_plural : S.name)]"
	if(corpses.len)
		titles += "<center>BASATO SU FATTI REALI<br>In memoria di: [english_list(corpses)].</center>"

	var/list/staff = list("STAFF DI PRODUZIONE:")
	var/list/staffjobs = list("Davide Akaired Maiorana", "Davideh", "Akaired", "DAVIDE IL CONQUISTATORE", "VLADMIR PUTIN", "SUA ECCELLENZA SILVIO BERLUSCONI", "MATTEO SLAVINI", "MATTEO SHISH RENZIE", "UN IMMIKRATO KLANDESTINO")
	var/list/goodboys = list()
	for(var/client/C)
		if(!C.holder)
			continue
		if(C.holder.rights & (R_DEBUG|R_ADMIN))
			var/decl/cultural_info/cult = SSculture.cultural_info_by_name[pick(SSculture.cultural_info_by_name)]
			staff += "[uppertext(pick(staffjobs))] - [cult.get_random_name(pick(MALE, FEMALE))] a.k.a. '[C.key]'"
		else if(C.holder.rights & R_MOD)
			goodboys += "[C.key]"

	titles += "<center>[jointext(staff,"<br>")]</center>"
	if(goodboys.len)
		titles += "<center>I GOOD BOI DELLO STAFF:<br>[english_list(goodboys)]</center><br>"

	var/disclaimer = "<br>Sponsored by [GLOB.using_map.company_name].<br>Tutti i diritti riservati.<br>\
					 Questa motion picture è protetta sotto le leggi del copyright del Governo Centrale del Sistema Solare<br> e da altre nazioni per tutta la galassia.<br>\
					 Colonia di Prima Pubblicazione: [pick("Marte", "Luna", "Terra", "Venere", "Phobos", "Ceres", "Tiamat", "Ceti Epsilon", "Eos", "Plutone", "Ouere",\
					 "Lordania", "Kingston", "Cinu", "Yuklid V", "Lorriman", "Tersten", "Gaia")].<br>"
	disclaimer += pick("Uso parodistico proibito. PROIBITO.",
					   "Tutti gli stunts sono stati performati da stagisti non pagati. NON provare a casa.",
					   "[GLOB.using_map.company_name] Non promuove il comportamento rappresentato. Imita a tuo rischio.",
					   "Qualsiasi esibizione, distribuzione o copia non autorizzata di questo film o di ciascuna sua parte (soundtrack inclusa)<br>\
						potrebbe risultare in un TEAM ERT inviato al tuo domicilio per il recupero con la forza (anche letale) degli asset rubati.",
						"La storia, tutti i nomi, personaggi, e incidenti rappresentati in questa produzione sono una finzione Nessuna identificazione con<br>\
						persone reali (in vita o decedute), luoghi, edifici, e prodotti è intenzionale o dovrebbe essere considerata tale.<br>\
						Questo film è basato su una storia vera e tutti gli individi rappresentati sono basati su persone reali, nonostante tutto ciò che abbiamo dichiarato sopra.",
						"Nessuna persona o entità associata con questo film ha ricevuto un pagamento o qualsiasi oggetto di valore o ha stretto qualsiasi forma di accordo, in connessione<br>\
						con la rappresentazione di prodotti di tabacco, nonostante il gran numero di scene di fumo rappresentate.<br>\
						(Questo disclaimer offerto da Carcinoma - I Carcinogeni sono il nostro Business!(TM)).",
						"Nessun animale e stato ferito nella realizzazione di questo film, tranne quelli elencati precedentemente come morti. Non provarlo a casa.")
	titles += "<hr>"
	titles += "<center><span style='font-size:6pt;'>[JOINTEXT(disclaimer)]</span></center>"

	return titles