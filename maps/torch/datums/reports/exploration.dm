/datum/computer_file/report/recipient/exp
	logo = "\[eclogo\]"

/datum/computer_file/report/recipient/exp/fauna
	form_name = "SCG-EXP-19f"
	title = "Rapporto Fauna Aliena"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/exp/fauna/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "Spedizioni della SEV Torcia")
	add_field(/datum/report_field/text_label/instruction, "Ciò che segue è un rapporto che dovrebbe venir compilato dai membri di un Team Esplorativo dopo la scoperta e lo studio di una forma di vita aliena.")

	add_field(/datum/report_field/date, "Data")
	add_field(/datum/report_field/people/list_from_manifest, "Personale Coinvolto")
	add_field(/datum/report_field/pencode_text, "Anatomia/Fattezze")
	add_field(/datum/report_field/pencode_text, "Locomozione")
	add_field(/datum/report_field/pencode_text, "Dieta")
	add_field(/datum/report_field/pencode_text, "Habitat")
	add_field(/datum/report_field/simple_text, "Pianeta di origine")
	add_field(/datum/report_field/pencode_text, "Comportamento")
	add_field(/datum/report_field/pencode_text, "Defesa/Offesa")
	add_field(/datum/report_field/pencode_text, "Caratteristica/e speciale/i")
	add_field(/datum/report_field/pencode_text, "Classificazione")

	add_field(/datum/report_field/text_label/instruction, "Dopo il completamento e approvazione di questo report, l'Ufficiale Scientifico Capo dovrebbe inviarlo sotto forma di fax sia al Rappresentante Sindacale che all'Ufficiale Comandante, oltre a tenerne una copia nel suo ufficio assieme ad altri rapporti spedizionari.")

/datum/computer_file/report/recipient/exp/planet
	form_name = "SCG-EXP-17"
	title = "Rapporto Esopianeta"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/exp/planet/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "Spedizioni della SEV Torcia")
	add_field(/datum/report_field/text_label/instruction, "Ciò che segue deve essere compilato da membri di un Team di Esplorazione dopo una Spedizione su di un Esopianeta non esplorato.")

	add_field(/datum/report_field/date, "Data")
	add_field(/datum/report_field/simple_text, "Nome del Pianeta")
	add_field(/datum/report_field/people/list_from_manifest, "Personale Coinvolto")
	add_field(/datum/report_field/pencode_text, "Informazioni Geografiche")
	add_field(/datum/report_field/simple_text, "Habitabilità")
	add_field(/datum/report_field/pencode_text, "Resoconto Fauna")
	add_field(/datum/report_field/pencode_text, "Resoconto Flora")
	add_field(/datum/report_field/pencode_text, "Punti di Interesse")
	add_field(/datum/report_field/pencode_text, "Osservazioni")

	add_field(/datum/report_field/text_label/instruction, "Dopo il completamento e approvazione di questo report, l'Ufficiale Scientifico Capo dovrebbe inviarlo sotto forma di fax sia al Rappresentante Sindacale che all'Ufficiale Comandante, oltre a tenerne una copia nel suo ufficio assieme ad altri rapporti spedizionari.")

/datum/computer_file/report/recipient/shuttle/post_flight
	logo = "\[eclogo\]"
	form_name = "SCG-EXP-3"