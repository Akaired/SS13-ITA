/datum/map/torch/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45))

/datum/map/torch/get_map_info()
	. = list()
	. +=  "Sei a bordo della <b>[station_name]</b>, una nave stellare del Corpo Spedizionario. La sua missione primaria è la ricerca di vita aliena senziente, e la generale esplorazione della galassia."
	. +=  "La nave è occupata da un mix di personale del Governo Centrale del Sistema Solare e di mercenari privati."
	. +=  "Questa zona dello spazio non è mappata, è lontana dalla zona di influenza del GCSS. Potresti incontrare remoti avamposti o rottami vaganti, ma nessun governo riconosciuto reclama questo settore."
	return jointext(., "<br>")

/datum/map/torch/send_welcome()
	var/welcome_text = "<center><img src = sollogo.png /><br /><font size = 3><b>SEV Torch</b> Lettura Sensori:</font><br>"
	welcome_text += "Report generato su [stationdate2text()] alle [stationtime2text()]</center><br /><br />"
	welcome_text += "<hr>Sistema Attuale:<br /><b>[system_name()]</b><br /><br>"
	welcome_text += "Prossimo Sistema bersaglio di Salto:<br /><b>[generate_system_name()]</b><br /><br>"
	welcome_text += "Tempo di viaggo per Sistema Solare:<br /><b>[rand(15,45)] days</b><br /><br>"
	welcome_text += "Tempo dall'ultima visita ad uno spazioporto:<br /><b>[rand(60,180)] days</b><br /><hr>"
	welcome_text += "Le scansioni rilevano i seguenti punti di interesse:<br />"
	var/list/space_things = list()
	var/obj/effect/overmap/torch = map_sectors["1"]
	for(var/zlevel in map_sectors)
		var/obj/effect/overmap/O = map_sectors[zlevel]
		if(O.name == torch.name)
			continue
		if(istype(O, /obj/effect/overmap/ship/landable)) //Don't show shuttles
			continue
		space_things |= O

	var/list/distress_calls
	for(var/obj/effect/overmap/O in space_things)
		var/location_desc = " alle presenti coordinate."
		if(O.loc != torch.loc)
			var/bearing = round(90 - Atan2(O.x - torch.x, O.y - torch.y),5) //fucking triangles how do they work
			if(bearing < 0)
				bearing += 360
			location_desc = ", bearing [bearing]."
		if(O.has_distress_beacon)
			LAZYADD(distress_calls, "[O.has_distress_beacon][location_desc]")
		welcome_text += "<li>\A <b>[O.name]</b>[location_desc]</li>"

	if(LAZYLEN(distress_calls))
		welcome_text += "<br><b>Richiesta di soccorso individuata:</b><br>[jointext(distress_calls, "<br>")]<br>"
	else
		welcome_text += "<br>Nessuna richiesta di soccorso individuata.<br />"
	welcome_text += "<hr>"

	post_comm_message("SEV Torch Sensor Readings", welcome_text)
	minor_announcement.Announce(message = "New [GLOB.using_map.company_name] Update available at all communication consoles.")
