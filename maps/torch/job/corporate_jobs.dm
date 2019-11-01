/datum/job/liaison
	title = "Rappresentante Sindacalista"
	department = "Support"
	department_flag = SPT
	total_positions = 1
	spawn_positions = 1
	supervisors = "Regolamenti Aziendali, Costituzione Sindaqcalista, e l'Organizzazione dei Corpi Spedizionari"
	selection_color = "#2f2f7f"
	economic_power = 15
	minimal_player_age = 0
	alt_titles = list(
		"Rappresentante Aziendale",
		"Segretario del Sindacato dei Lavoratori" = /decl/hierarchy/outfit/job/torch/passenger/workplace_liaison/union_rep,
		"Rappresentante della Corporazione",
		"Agente Esecutivo Aziendale"
		)
	outfit_type = /decl/hierarchy/outfit/job/torch/passenger/workplace_liaison
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/contractor)
	min_skill = list(   SKILL_BUREAUCRACY	= SKILL_EXPERT,
	                    SKILL_FINANCE		= SKILL_BASIC)
	skill_points = 20
	access = list(access_liaison, access_security, access_medical,
						access_engine, access_research, access_bridge,
						access_cargo, access_solgov_crew, access_hangar,
						access_nanotrasen, access_commissary, access_petrov)
	software_on_spawn = list(/datum/computer_file/program/reports)

/datum/job/liaison/get_description_blurb()
	return "Sei il rappresentante sindacalista. Sei un impiegato civile di EXO, dei Corpi Spedizionari, il conglomerato aziendale statale che finanzia la Torcia. Sei a bordo della nave per promuovere gli interessi aziendali e proteggere i diritti degli impiegati come il loro Sindacalista. Non fai parte degli Affari Interni. Fornisci consulenza in materia di questioni societarie e sindacali e appaltatori sui loro diritti e doveri. Massimizza il profitto. Sii lo shady shill aziendale losco che hai sempre desiderato essere."

/datum/job/liaison/post_equip_rank(var/mob/person, var/alt_title)
	var/my_title = "\a ["\improper [(person.mind ? (person.mind.role_alt_title ? person.mind.role_alt_title : person.mind.assigned_role) : "Loss Prevention Associate")]"]"
	for(var/mob/M in GLOB.player_list)
		if(M.client && M.mind)
			if(M.mind.assigned_role == "Agente Prevenzione Perdite")
				to_chat(M, SPAN_NOTICE("<b>Uno dei tuoi datori di lavoro, [my_title] chiamato [person.real_name], è presente sulla [GLOB.using_map.full_name].</b>"))
	..()

/datum/job/bodyguard
	title = "Agente Previsione Perdite"
	department = "Support"
	department_flag = SPT
	total_positions = 1
	spawn_positions = 1
	supervisors = "il Rappresentante Sindacalista"
	selection_color = "#3d3d7f"
	economic_power = 12
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/torch/passenger/corporate_bodyguard
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/contractor)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_ADEPT,
	                    SKILL_FORENSICS   = SKILL_BASIC)
	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)
	alt_titles = list(
		"Agente Sindacale" = /decl/hierarchy/outfit/job/torch/passenger/corporate_bodyguard/union,
		"Assistente Esecutivo",
		"Agente Protezione Asset"
	)
	skill_points = 20
	access = list(access_liaison, access_security, access_medical,
						access_engine, access_research, access_bridge,
						access_cargo, access_solgov_crew, access_hangar,
						access_nanotrasen, access_commissary, access_petrov,
						access_sec_guard)
	defer_roundstart_spawn = TRUE

/datum/job/bodyguard/is_position_available()
	if(..())
		for(var/mob/M in GLOB.player_list)
			if(M.client && M.mind && M.mind.assigned_role == "Rappresentante Sindacalista")
				return TRUE
	return FALSE

/datum/job/bodyguard/get_description_blurb()
	return "Tu sei l'agente prevenzione perdite. Sei un impiegato di una delle corporazioni che finanziano il Corpo Spedizionario, e il tuo lavoro è proteggere la vita del Rappresentante Sindacale, anche a spese della tua. Buona fortuna."

/datum/job/bodyguard/post_equip_rank(var/mob/person, var/alt_title)
	var/my_title = "\a ["\improper [(person.mind ? (person.mind.role_alt_title ? person.mind.role_alt_title : person.mind.assigned_role) : "Loss Prevention Associate")]"]"
	for(var/mob/M in GLOB.player_list)
		if(M.client && M.mind)
			if(M.mind.assigned_role == "Rappresentante Sindacale")
				to_chat(M, SPAN_NOTICE("<b>La tua guardia del corpo, [my_title] chiamata [person.real_name], è presente sulla [GLOB.using_map.full_name].</b>"))
	..()
