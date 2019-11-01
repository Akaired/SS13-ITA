/datum/job/pathfinder
	title = "Capo Esploratore"
	department = "Exploration"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	supervisors = "l'Ufficiale Scientifico Capo"
	selection_color = "#68099e"
	minimal_player_age = 1
	economic_power = 7
	ideal_character_age = 35
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/exploration/pathfinder
	allowed_branches = list(/datum/mil_branch/expeditionary_corps)
	allowed_ranks = list(
		/datum/mil_rank/ec/o1
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_ADEPT,
	                    SKILL_SCIENCE     = SKILL_ADEPT,
	                    SKILL_PILOT       = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_EXPERT,
	                    SKILL_WEAPONS     = SKILL_EXPERT)
	skill_points = 22

	access = list(
		access_pathfinder, access_explorer, access_eva, access_maint_tunnels, access_bridge, access_emergency_storage,
		access_guppy_helm, access_solgov_crew, access_expedition_shuttle, access_expedition_shuttle_helm,
		access_guppy, access_hangar, access_petrov, access_petrov_helm, access_petrov_analysis, access_petrov_phoron,
		access_petrov_toxins, access_petrov_chemistry, access_petrov_maint, access_tox, access_tox_storage, access_research,
		access_xenobiology, access_xenoarch
	)

	software_on_spawn = list(/datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/pathfinder/get_description_blurb()
	return "Tu sei il Pathfinder. Il tuo compito e organizzare e condurre le spedizioni verso i siti lontani, svolgendo la missione primaria della CE. Tu comandi gli esploratori. Ti assicuri che la spedizione abbia le forniture e il personale di cui ha bisogno. Puoi pilotare Charon se nessun altro fornisce un pilota. Una volta in missione, il tuo compito e quello di garantire che qualsiasi cosa di interesse scientifico sia riportata sulla nave e passata al laboratorio di ricerca competente.

"

/datum/job/nt_pilot
	title = "Pilota di Shuttle"
	supervisors = "il Capo Esploratore"
	department = "Exploration"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	selection_color = "#68099e"
	economic_power = 10
	minimal_player_age = 0
	ideal_character_age = 25
	outfit_type = /decl/hierarchy/outfit/job/torch/passenger/pilot
	allowed_branches = list(
		/datum/mil_branch/civilian,
		/datum/mil_branch/expeditionary_corps = /decl/hierarchy/outfit/job/torch/crew/exploration/pilot,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/torch/crew/exploration/pilot/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/contractor = /decl/hierarchy/outfit/job/torch/passenger/research/nt_pilot,
		/datum/mil_rank/ec/e7,
		/datum/mil_rank/fleet/e6,
		/datum/mil_rank/fleet/e7
	)

	access = list(
		access_mining_office, access_petrov, access_petrov_helm, access_petrov_analysis, access_petrov_phoron,
		access_petrov_toxins, access_petrov_chemistry, access_petrov_maint, access_mining_station, access_expedition_shuttle,
		access_expedition_shuttle_helm, access_guppy, access_hangar, access_guppy_helm, access_mining, access_pilot,
		access_solgov_crew, access_eva, access_explorer, access_tox, access_tox_storage, access_research, access_xenobiology,
		access_xenoarch
	)
	min_skill = list(	SKILL_EVA   = SKILL_BASIC,
						SKILL_PILOT = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)

/datum/job/explorer
	title = "Exploratore"
	department = "Exploration"
	department_flag = EXP
	total_positions = 5
	spawn_positions = 5
	supervisors = "l'Ufficiale Comandante, l'Ufficiale Esecutivo e l'Esploratore Capo"
	selection_color = "#68099e"
	ideal_character_age = 20
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/exploration/explorer
	allowed_branches = list(/datum/mil_branch/expeditionary_corps)

	allowed_ranks = list(
		/datum/mil_rank/ec/e3,
		/datum/mil_rank/ec/e5
	)
	min_skill = list(   SKILL_EVA = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_EXPERT,
	                    SKILL_WEAPONS     = SKILL_EXPERT)

	access = list(access_explorer, access_maint_tunnels, access_eva, access_emergency_storage,
		access_guppy_helm, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar,
		access_petrov, access_petrov_analysis, access_petrov_phoron, access_petrov_toxins,
		access_petrov_chemistry, access_petrov_maint, access_tox, access_tox_storage, access_research,
		access_xenobiology, access_xenoarch
	)

	software_on_spawn = list(/datum/computer_file/program/deck_management)

/datum/job/explorer/get_description_blurb()
	return "Sei un esploratore. Il tuo dovere e di andare in spedizioni verso i siti fuori casa. Pathfinder e il leader del tuo team. Devi cercare qualcosa di interesse economico o scientifico per la SCG - depositi minerali, flora / fauna aliena, artefatti. Probabilmente incontrerai anche ambienti pericolosi, animali selvatici aggressivi o sistemi di difesa malfunzionanti, quindi cammina con attenzione."
