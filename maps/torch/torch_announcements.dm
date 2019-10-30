/datum/map/torch
	emergency_shuttle_docked_message = "Attenzione a tutto il personale: gli escape pod sono stati armati. Avete %ETD% per abbordare gli escape pod."
	emergency_shuttle_leaving_dock = "Attenzione a tutto il personale: gli escape pod sono stati lanciati, arriveranno a destinazione in %ETA%."

	emergency_shuttle_called_message = "Attenzione a tutto il personale: le procedure di evacuazione sono in vigore. Gli escape pod si sbloccheranno in %ETA%"
	emergency_shuttle_called_sound = sound('sound/AI/torch/abandonship.ogg', volume = 45)

	emergency_shuttle_recall_message = "Attenzione a tutto il personale: protocollo di evacuazione annullato. Riprendere le normali attivit�."

	command_report_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45)

	grid_check_message = "Attivit� anormale rilevata nella rete elettrica di %STATION_NAME%. Come precauzione, interromperemo la fornitura elettrica a %STATION_NAME% per una durata indefinita."
	grid_check_sound = sound('sound/AI/torch/poweroff.ogg', volume = 45)

	grid_restored_message = "Stiamo ripristinando la rete elettrica di %STATION_NAME%."
	grid_restored_sound = sound('sound/AI/torch/poweron.ogg', volume = 45)

	meteor_detected_sound = sound('sound/AI/torch/meteors.ogg', volume = 45)

	radiation_detected_message = "Livelli critici di radiazioni individuati nelle prossimit� di %STATION_NAME%. Perfavore, evacuate nei tunnel di manutenzione schermati."
	radiation_detected_sound = sound('sound/AI/torch/radiation.ogg', volume = 45)

	space_time_anomaly_sound = sound('sound/AI/torch/spanomalies.ogg', volume = 45)

	unknown_biological_entities_message = "Entit� biologiche sconosciute individuate all'esterno di %STATION_NAME%, per favore, attendete aggiornamenti."

	unidentified_lifesigns_message = "Segni di vita non identificati individuati. Bloccare tutti i punti di accesso all'esterno."
	unidentified_lifesigns_sound = sound('sound/AI/torch/aliens.ogg', volume = 45)

	lifesign_spawn_sound = sound('sound/AI/torch/aliens.ogg', volume = 45)

	electrical_storm_moderate_sound = sound('sound/AI/torch/electricalstormmoderate.ogg', volume = 45)
	electrical_storm_major_sound = sound('sound/AI/torch/electricalstormmajor.ogg', volume = 45)

/datum/map/torch/level_x_biohazard_sound(var/bio_level)
	switch(bio_level)
		if(7)
			return sound('sound/AI/torch/outbreak7.ogg', volume = 45)
		else
			return sound('sound/AI/torch/outbreak5.ogg', volume = 45)
