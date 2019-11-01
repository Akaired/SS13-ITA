/datum/job/captain
	title = "Ufficiale Comandante"
	supervisors = "il Governo Centrale del Sistema Solare e il Codice di Giustizia Militare del Sistema Solare"
	minimal_player_age = 7
	economic_power = 15
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/CO
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps
	)
	allowed_ranks = list(
		/datum/mil_rank/ec/o6
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_ADEPT,
	                    SKILL_PILOT       = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/captain/get_description_blurb()
	return "Tu sei l'Ufficiale Comandante. Sei il maschio alpha del branco. Sei un ufficiale professionista con esperienza nel controllo di un'intera nave e alla fine responsabile di tutto cio che accade a bordo. Il tuo compito e assicurarti che la [GLOB.using_map.full_name] compie la sua missione di esplorazione dello spazio. Delegare al proprio Ufficiale Esecutivo, ai Capi-dipartimento e al proprio Consigliere Anziano per gestire efficacemente la nave, ascoltare e fidarsi della propria esperienza."

/datum/job/captain/post_equip_rank(var/mob/person, var/alt_title)
	var/sound/announce_sound = (GAME_STATE <= RUNLEVEL_SETUP)? null : sound('sound/misc/boatswain.ogg', volume=20)
	captain_announcement.Announce("Equipaggio della nave, [alt_title || title] [person.real_name] sul ponte! Saluto!", new_sound = announce_sound)
	..()

/datum/job/hop
	title = "Ufficiale Esecutivo"
	supervisors = "l'Ufficiale Comandante"
	department = "Command"
	department_flag = COM
	minimal_player_age = 7
	economic_power = 10
	ideal_character_age = 45
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/XO
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/torch/crew/command/XO/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/ec/o5,
		/datum/mil_rank/fleet/o4,
		/datum/mil_rank/fleet/o5
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

	access = list(access_security, access_brig, access_armory, access_forensics_lockers, access_heads, access_medical, access_morgue, access_tox, access_tox_storage,
					access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage, access_change_ids,
					access_ai_upload, access_teleporter, access_eva, access_bridge, access_all_personal_lockers, access_chapel_office, access_tech_storage,
					access_atmospherics, access_bar, access_janitor, access_crematorium, access_kitchen, access_robotics, access_cargo, access_construction,
					access_chemistry, access_cargo_bot, access_hydroponics, access_manufacturing, access_library, access_lawyer, access_virology, access_cmo,
					access_qm, access_network, access_surgery, access_research, access_mining, access_mining_office, access_mailsorting, access_heads_vault,
					access_mining_station, access_xenobiology, access_ce, access_hop, access_hos, access_RC_announce, access_keycard_auth, access_tcomsat,
					access_gateway, access_sec_doors, access_psychiatrist, access_xenoarch, access_medical_equip, access_heads, access_hangar, access_guppy_helm,
					access_expedition_shuttle_helm, access_aquila, access_aquila_helm, access_solgov_crew, access_nanotrasen, access_robotics_engineering,
					access_emergency_armory, access_sec_guard, access_gun, access_expedition_shuttle, access_guppy, access_seneng, access_senmed, access_senadv,
					access_explorer, access_pathfinder, access_pilot, access_commissary, access_petrov, access_petrov_helm, access_petrov_analysis, access_petrov_phoron,
					access_petrov_toxins, access_petrov_chemistry, access_petrov_security, access_petrov_maint, access_rd, access_petrov_rd)
	minimal_access = list(access_security, access_brig, access_armory, access_forensics_lockers, access_heads, access_medical, access_morgue, access_tox, access_tox_storage,
						access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage, access_change_ids,
						access_ai_upload, access_teleporter, access_eva, access_bridge, access_all_personal_lockers, access_chapel_office, access_tech_storage,
						access_atmospherics, access_bar, access_janitor, access_crematorium, access_kitchen, access_robotics, access_cargo, access_construction,
						access_chemistry, access_cargo_bot, access_hydroponics, access_manufacturing, access_library, access_lawyer, access_virology, access_cmo,
						access_qm, access_network, access_surgery, access_research, access_mining, access_mining_office, access_mailsorting, access_heads_vault,
						access_mining_station, access_xenobiology, access_ce, access_hop, access_hos, access_RC_announce, access_keycard_auth, access_tcomsat,
						access_gateway, access_sec_doors, access_psychiatrist, access_xenoarch, access_medical_equip, access_heads, access_hangar, access_guppy_helm,
						access_expedition_shuttle_helm, access_aquila, access_aquila_helm, access_solgov_crew, access_nanotrasen, access_robotics_engineering,
						access_emergency_armory, access_sec_guard, access_gun, access_expedition_shuttle, access_guppy, access_seneng, access_senmed, access_senadv,
						access_explorer, access_pathfinder, access_pilot, access_commissary, access_petrov, access_petrov_helm, access_petrov_analysis, access_petrov_phoron,
						access_petrov_toxins, access_petrov_chemistry, access_petrov_security, access_petrov_maint, access_rd, access_petrov_rd)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/hop/get_description_blurb()
	return "Tu sei l'Ufficiale Esecutivo. Sei un ufficiale anziano con esperienza, secondo al comando della nave e sei responsabile del buon funzionamento della nave sotto il tuo Ufficiale Comandate. In sua assenza, dovresti prendere il suo posto. Il tuo compito principale è la gestione diretta dei Capi-dipartimento e di tutti coloro che non fanno parte di un dipartimento. Sei anche responsabile per i mercenari appaltati e i passeggeri a bordo della nave. Considera gli strumenti del Consigliere Militare Anziano e i Guardiamarina di Ponte a tua disposizione."

/datum/job/rd
	title = "Ufficiale Scientifico Capo"
	supervisors = "l'Ufficiale Comandante"
	economic_power = 20
	minimal_player_age = 7
	ideal_character_age = 60
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/research/cso
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps
	)
	allowed_ranks = list(
		/datum/mil_rank/ec/o3
	)

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_FINANCE     = SKILL_ADEPT,
	                    SKILL_BOTANY      = SKILL_BASIC,
	                    SKILL_ANATOMY     = SKILL_BASIC,
	                    SKILL_DEVICES     = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_ADEPT)

	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

	access = list(
		access_tox, access_tox_storage, access_emergency_storage, access_teleporter, access_bridge, access_rd,
		access_research, access_mining, access_mining_office, access_mining_station, access_xenobiology,
		access_RC_announce, access_keycard_auth, access_xenoarch, access_nanotrasen, access_sec_guard, access_heads,
		access_expedition_shuttle, access_guppy, access_hangar, access_petrov, access_petrov_helm, access_guppy_helm,
		access_petrov_analysis, access_petrov_phoron, access_petrov_toxins, access_petrov_chemistry, access_petrov_rd,
		access_petrov_security, access_petrov_maint, access_pathfinder, access_explorer, access_eva, access_solgov_crew,
		access_expedition_shuttle, access_expedition_shuttle_helm
	)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/aidiag,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/rd/get_description_blurb()
	return "Sei l'Ufficiale Scientifico Capo. Sei responsabile del dipartimento di ricerca. Gestisci gli aspetti scientifici del progetto e interagisci con gli interessi aziendali dell'Organizzazione del Corpo Spedizionario. Assicurati che la ricerca sia fatta, fanne un po' da te e porta i tuoi scienziati in missione per trovare cose a beneficio del progetto. Consiglia il UC sulle questioni scientifiche."

/datum/job/cmo
	title = "Ufficiale Medico Capo"
	supervisors = "l'Ufficiale Comandante e l'Ufficiale Esecutivo"
	economic_power = 10
	minimal_player_age = 7
	ideal_character_age = 48
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/cmo
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/torch/crew/command/cmo/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/fleet/o4,
		/datum/mil_rank/ec/o3
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_MEDICAL     = SKILL_ADEPT,
	                    SKILL_ANATOMY     = SKILL_EXPERT,
	                    SKILL_CHEMISTRY   = SKILL_BASIC,
	                    SKILL_VIROLOGY    = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX,
	                    SKILL_VIROLOGY    = SKILL_MAX)
	skill_points = 32

	access = list(access_medical, access_morgue, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_teleporter, access_eva, access_bridge, access_heads,
			            access_chapel_office, access_crematorium, access_chemistry, access_virology,
			            access_cmo, access_surgery, access_RC_announce, access_keycard_auth, access_psychiatrist,
			            access_medical_equip, access_solgov_crew, access_senmed, access_hangar)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/cmo/get_description_blurb()
	return "Sei l'Ufficiale Medico Capo. Gestisci il dipartimento medico. Assicurati che tutti i membri del personale medico siano qualificati, conoscano i loro incarichi e che gestiscano i loro compiti. Assicurati che i tuoi medici stiano organizzando la tua infermeria e che il tuo medico / paramedico sia pronto per la risposta. Agisci come secondo chirurgo o chimico di riserva in assenza di uno dei due. Ci si aspetta che tu conosca molto bene la medicina, insieme alle norme generali di bordo."

/datum/job/chief_engineer
	title = "Capo Ingegnere"
	supervisors = "l'Ufficiale Comandante e l'Ufficiale Esecutivo"
	economic_power = 9
	ideal_character_age = 40
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/chief_engineer
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/torch/crew/command/chief_engineer/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/ec/o3,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3
	)
	min_skill = list(   SKILL_BUREAUCRACY  = SKILL_BASIC,
	                    SKILL_COMPUTER     = SKILL_ADEPT,
	                    SKILL_EVA          = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_ADEPT,
	                    SKILL_ATMOS        = SKILL_ADEPT,
	                    SKILL_ENGINES      = SKILL_EXPERT)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)
	skill_points = 30

	access = list(access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_ai_upload, access_teleporter, access_eva, access_bridge, access_heads,
			            access_tech_storage, access_robotics, access_atmospherics, access_janitor, access_construction,
			            access_network, access_ce, access_RC_announce, access_keycard_auth, access_tcomsat,
			            access_solgov_crew, access_robotics_engineering, access_seneng, access_hangar, access_robotics)
	minimal_access = list(access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_ai_upload, access_teleporter, access_eva, access_bridge, access_heads,
			            access_tech_storage, access_atmospherics, access_janitor, access_construction,
			            access_network, access_ce, access_RC_announce, access_keycard_auth, access_tcomsat,
			            access_solgov_crew, access_robotics_engineering, access_seneng, access_hangar, access_robotics)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/ntnetmonitor,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor,
							 /datum/computer_file/program/reports)

/datum/job/chief_engineer/get_description_blurb()
	return "Sei l'Ingegnere Capo. Gestisci il dipartimento di ingegneria. Sei responsabile dell'ingegnere anziano, che è la tua mano destra e (dovrebbe essere) un ingegnere esperto e qualificato. Delegalo e ascoltalo. Gestisci i tuoi ingegneri, assicurati che la nave rimanga accesa, che le brecce dello scafo vengano riparate e che i problemi siano risolti. Consiglia l'UC in materia di ingegneria. Sei anche responsabile della manutenzione e del controllo di tutti i robot della nave. Sei un ingegnere esperto con una ricchezza di conoscenze teoriche. Dovresti anche conoscere i regolamenti della nave ad un livello ragionevole."

/datum/job/hos
	title = "Capo della Sicurezza"
	supervisors = "l'Ufficiale Comandante e l'Ufficiale Esecutivo"
	economic_power = 8
	minimal_player_age = 7
	ideal_character_age = 35
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/cos
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/torch/crew/command/cos/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/ec/o3,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_ADEPT,
	                    SKILL_FORENSICS   = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)
	skill_points = 28

	access = list(access_security, access_brig, access_armory, access_forensics_lockers,
			            access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_teleporter, access_eva, access_bridge, access_heads,
			            access_hos, access_RC_announce, access_keycard_auth, access_sec_doors,
			            access_solgov_crew, access_gun, access_emergency_armory, access_hangar)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/hos/get_description_blurb()
	return "Sei il Capo della Sicurezza. Gestisci la sicurezza della nave. gli agenti di sicurezza, nonché il guardiano delle celle e il tecnico forense. Mantieni la nave al sicuro. Gestisci le questioni di sicurezza sia interne che esterne. Tu sei la legge. Sei subordinato all'UC e all'UE. Ci si aspetta che tu conosca il Codice di Giustizia Militare del Sistema Solare e le leggi del Governo Centrale del Sistema Solare, oltre alla procedura di allarme in maniera molto precisa insieme alle norme generali del vascello."

/datum/job/representative
	title = "Rappresentante SolGov"
	department = "Support"
	department_flag = SPT
	total_positions = 1
	spawn_positions = 1
	supervisors = "il Governo Centrale del Sistema Solare e la Costituzione Solariana"
	selection_color = "#2f2f7f"
	economic_power = 15
	minimal_player_age = 0
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/representative
	allowed_branches = list(/datum/mil_branch/solgov)
	allowed_ranks = list(/datum/mil_rank/sol/gov)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_EXPERT,
	                    SKILL_FINANCE     = SKILL_BASIC)
	skill_points = 20

	access = list(access_representative, access_security, access_medical,
			            access_bridge, access_cargo, access_solgov_crew, access_hangar)

	software_on_spawn = list(/datum/computer_file/program/reports)

/datum/job/representative/get_description_blurb()
	return "Sei il Rappresentante di SolGov. Sei un civile assegnato sia come collegamento diplomatico per il primo contatto che per le situazioni di affari esteri a bordo. Sei in oltre responsabile del monitoraggio di eventuali gravi errori di giustizia, legge solariana o altre questioni etiche o legali a bordo e hai un ruolo di informazione e consulenza al comandante. Sei un burocrate di medio livello. Fai da ponte di contatto tra l'equipaggio e gli interessi aziendali a bordo. Invia fax al Sistema Solare sui progressi della missione e su eventi importanti degni di nota."

/datum/job/sea
	title = "Consigliere Militare Anziano"
	department = "Support"
	department_flag = SPT
	total_positions = 1
	spawn_positions = 1
	supervisors = "l'Ufficiale Comandante e l'Ufficiale Esecutivo"
	selection_color = "#2f2f7f"
	minimal_player_age = 7
	economic_power = 8
	ideal_character_age = 45
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/sea/fleet
	allowed_branches = list(
		/datum/mil_branch/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/e8,
		/datum/mil_rank/fleet/e9_alt1,
		/datum/mil_rank/fleet/e9
	)
	min_skill = list(   SKILL_EVA        = SKILL_BASIC,
	                    SKILL_COMBAT     = SKILL_BASIC,
	                    SKILL_WEAPONS    = SKILL_ADEPT)

	max_skill = list(   SKILL_COMBAT       = SKILL_MAX,
	                    SKILL_WEAPONS      = SKILL_MAX,
	                    SKILL_PILOT        = SKILL_MAX,
	                    SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX)
	skill_points = 24


	access = list(access_security, access_medical, access_engine, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
			            access_teleporter, access_eva, access_bridge, access_all_personal_lockers, access_janitor,
			            access_kitchen, access_cargo, access_RC_announce, access_keycard_auth, access_guppy_helm,
			            access_solgov_crew, access_gun, access_expedition_shuttle, access_guppy, access_senadv, access_hangar, access_emergency_armory)

	software_on_spawn = list(/datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/sea/get_description_blurb()
	return "Sei il Consigliere Militare Anziano. Sei la persona più alta arruolata sulla nave. Sei direttamente subordinato all'UC. Lo consigli su questioni militari e offri esperienza e consulenza agli ufficiali. Sei responsabile di garantire disciplina e buona condotta tra gli arruolati, nonché di informare i funzionari di eventuali problemi e di "consigliarli" sugli errori che commettono. Gestisci inoltre vari compiti per conto dell'UC e dell'UE. Sei una persona arruolata con esperienza, molto probabilmente uguale solo per esperienza a UC ed UE. Conosci i regolamenti meglio di chiunque altro."

/datum/job/bridgeofficer
	title = "Guardiamarina di Ponte"
	department = "Support"
	department_flag = SPT
	total_positions = 3
	spawn_positions = 3
	supervisors = "l'Ufficiale Comandante e i Capo-dipartimento"
	selection_color = "#2f2f7f"
	minimal_player_age = 0
	economic_power = 7
	ideal_character_age = 24
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/command/bridgeofficer
	allowed_branches = list(
		/datum/mil_branch/expeditionary_corps,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/torch/crew/command/bridgeofficer/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/ec/o1,
		/datum/mil_rank/fleet/o1
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)
	skill_points = 20


	access = list(access_security, access_medical, access_engine, access_maint_tunnels, access_emergency_storage,
			            access_bridge, access_janitor, access_kitchen, access_cargo, access_mailsorting, access_RC_announce, access_keycard_auth,
			            access_solgov_crew, access_aquila, access_aquila_helm, access_guppy, access_guppy_helm, access_external_airlocks,
			            access_eva, access_hangar, access_cent_creed, access_explorer, access_expedition_shuttle, access_expedition_shuttle_helm)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor,
							 /datum/computer_file/program/reports,
							 /datum/computer_file/program/deck_management)

/datum/job/bridgeofficer/get_description_blurb()
	return "Sei un Guardiamarina di Ponte. Sei un ufficiale molto giovane. Non dai ordini per conto tuo. Sei subordinato a tutti i membri del Comando. Gestisci le le apparecchiature del Ponte di Comando e riferisci direttamente ad UC e UE. Prendi la cloche della Torcia e piloti l'Aquila, se necessario. Monitora i computer e le comunicazioni del Ponte di Comando e comunica le informazioni pertinenti al Comando e ai Capo-dipartimento."
