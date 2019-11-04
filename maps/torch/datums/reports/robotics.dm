/datum/computer_file/report/recipient/borging
	form_name = "CC-SGF-09"
	title = "Contratto di Cyborgificazione"
	logo = "\[solcrest\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/borging/generate_fields()
	..()
	var/list/xo_fields = list()
	add_field(/datum/report_field/text_label/header, "SEV Torcia - Ufficio dell'Ufficiale Esecutivo")
	add_field(/datum/report_field/people/from_manifest, "Nome (UE)")
	add_field(/datum/report_field/people/from_manifest, "Name (soggetto)", required = 1)
	add_field(/datum/report_field/date, "Data")
	add_field(/datum/report_field/time, "Ora")
	add_field(/datum/report_field/text_label/instruction, "Io, qui indicato, dichiaro in questa sede di attraversare volontariamente una procedura di Regolare Lobotomizzazione con intenzione di Cyborgificazione o Assimilazione nella Matrice. Sono consapevole di tutte le conseguenze di tale atto. Comprendo inoltre che questa operazione potrebbe essere irreversibile, e che il mio contratto di impiego sarà terminato. Qui rinuncio a tutti i miei diritti umani, cedendo ogni responsabilità e controllo al mio Cyborgificatore, e chi per suo conto..")
	add_field(/datum/report_field/signature, "Firma del soggetto")
	xo_fields += add_field(/datum/report_field/signature, "Firma dell'Ufficiale Esecutivo")
	xo_fields += add_field(/datum/report_field/options/yes_no, "Approvato")
	for(var/datum/report_field/field in xo_fields)
		field.set_access(access_edit = access_hop)