/datum/map/torch
	name = "Torch"
	full_name = "SEV Torch"
	path = "torch"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK

	admin_levels = list(7,8)
	empty_levels = list(9)
	accessible_z_levels = list("1"=1,"2"=3,"3"=1,"4"=1,"5"=1,"6"=1,"9"=30)
	overmap_size = 35
	overmap_event_areas = 34
	usable_email_tlds = list("torch.ec.scg", "torch.fleet.mil", "freemail.net", "torch.scg")

	allowed_spawns = list("Cryogenic Storage", "Cyborg Storage")
	default_spawn = "Cryogenic Storage"

	station_name  = "SEV Torcia"
	station_short = "Torcia"
	dock_name     = "TBD"
	boss_name     = "Comando Spedizionario"
	boss_short    = "Comando"
	company_name  = "Governo Centrale del Sistema Solare"
	company_short = "SolGov"

	map_admin_faxes = list("Corporate Central Office")

	//These should probably be moved into the evac controller...
	shuttle_docked_message = "Attenzione, equipaggio: Preparazione al salto all'iperspazio completata. Il bluespace drive si sta scaldando, tutte le stazioni, prepararsi al salto. Tempo al salto: approssimatamente %ETD%."
	shuttle_leaving_dock = "Attenzione, equipaggio: INGRESSO NELL'IPERSPAZIO, salto completato in: %ETA%."
	shuttle_called_message = "Attenzione, equipaggio: Sequenza di salto nell'iperspazio avviata. Le procedure di transito sono in corso. Salto in %ETA%."
	shuttle_recall_message = "Attenzione, equipaggio: Sequenza di salto nell'iperspazio abortita, ritornare alle normali procedure di bordo."

	evac_controller_type = /datum/evacuation_controller/starship

	default_law_type = /datum/ai_laws/solgov
	use_overmap = 1
	num_exoplanets = 1

	away_site_budget = 3
	id_hud_icons = 'maps/torch/icons/assignment_hud.dmi'
