//STRIKE TEAMS
//Thanks to Kilakk for the admin-button portion of this code.

var/global/send_emergency_team = 0 // Used for automagic response teams
								   // 'admin_emergency_team' for admin-spawned response teams
var/ert_base_chance = 10 // Default base chance. Will be incremented by increment ERT chance.
var/can_call_ert

/client/proc/response_team()
	set name = "Richiedi una Task Force d'Emergenza"
	set category = "Special Verbs"
	set desc = "Invia una Task Force d'Emergenza"

	if(!holder)
		to_chat(usr, "<span class='danger'>Questo comando può essere usato solo da amministratori.</span>")
		return
	if(GAME_STATE < RUNLEVEL_GAME)
		to_chat(usr, "<span class='danger'>La partita non è ancora cominciata!</span>")
		return
	if(send_emergency_team)
		to_chat(usr, "<span class='danger'>[GLOB.using_map.boss_name] ha già chiamato una Task Force d'Emergenza!</span>")
		return
	if(alert("Vuoi veramente richiedere una Task Force d'Emergenza?",,"Si","No") != "Si")
		return

	var/decl/security_state/security_state = decls_repository.get_decl(GLOB.using_map.security_state)
	if(security_state.current_security_level_is_lower_than(security_state.high_security_level)) // Allow admins to reconsider if the alert level is below High
		switch(alert("L'attuale livello d'emergenza è minore di [security_state.high_security_level.name]. Vuoi ancora richiedere la Task Force?",,"Si","No"))
			if("No")
				return
	if(send_emergency_team)
		to_chat(usr, "<span class='danger'>Sembra che qualcuno ti abbia sconfitto sul tempo!</span>")
		return

	message_admins("[key_name_admin(usr)] sta chiamando una Task Force d'Emergenza.", 1)
	log_admin("[key_name(usr)] ha usato: Richiedi una Task Force d'Emergenza.")
	trigger_armed_response_team(1)

client/verb/JoinResponseTeam()

	set name = "Unisciti alla Task Force d'Emergenza"
	set category = "IC"

	if(!MayRespawn(1))
		to_chat(usr, "<span class='warning'>Al momento non puoi unirti al team d'emergenza.</span>")
		return

	if(isghost(usr) || isnewplayer(usr))
		if(!send_emergency_team)
			to_chat(usr, "Al momento nessuna Task Force d'Emergenza è attiva.")
			return
		if(jobban_isbanned(usr, MODE_ERT) || jobban_isbanned(usr, "Security Officer"))
			to_chat(usr, "<span class='danger'>A te non è permesso unirti alla TFE!</span>")
			return
		if(GLOB.ert.current_antagonists.len >= GLOB.ert.hard_cap)
			to_chat(usr, "La Task Force d'Emergenza è già piena!")
			return
		GLOB.ert.create_default(usr)
	else
		to_chat(usr, "Devi essere un osservatore o un nuovo player per unirti.")

// returns a number of dead players in %
proc/percentage_dead()
	var/total = 0
	var/deadcount = 0
	for(var/mob/living/carbon/human/H in SSmobs.mob_list)
		if(H.client) // Monkeys and mice don't have a client, amirite?
			if(H.stat == 2) deadcount++
			total++

	if(total == 0) return 0
	else return round(100 * deadcount / total)

// counts the number of antagonists in %
proc/percentage_antagonists()
	var/total = 0
	var/antagonists = 0
	for(var/mob/living/carbon/human/H in SSmobs.mob_list)
		if(is_special_character(H) >= 1)
			antagonists++
		total++

	if(total == 0) return 0
	else return round(100 * antagonists / total)

// Increments the ERT chance automatically, so that the later it is in the round,
// the more likely an ERT is to be able to be called.
proc/increment_ert_chance()
	while(send_emergency_team == 0) // There is no ERT at the time.
		var/decl/security_state/security_state = decls_repository.get_decl(GLOB.using_map.security_state)
		var/index = security_state.all_security_levels.Find(security_state.current_security_level)
		ert_base_chance += 2**index
		sleep(600 * 3) // Minute * Number of Minutes


proc/trigger_armed_response_team(var/force = 0)
	if(!can_call_ert && !force)
		return
	if(send_emergency_team)
		return

	var/send_team_chance = ert_base_chance // Is incremented by increment_ert_chance.
	send_team_chance += 2*percentage_dead() // the more people are dead, the higher the chance
	send_team_chance += percentage_antagonists() // the more antagonists, the higher the chance
	send_team_chance = min(send_team_chance, 100)

	if(force) send_team_chance = 100

	// there's only a certain chance a team will be sent
	if(!prob(send_team_chance))
		command_announcement.Announce("Pare che i nostri sistemi abbiano rilevato una richiesta per l'attivazione di una Task Force d'Emergenza dalla [station_name()]. Sfortunatamente non siamo nelle condizioni di inviarne una al momento.", "[GLOB.using_map.boss_name]")
		can_call_ert = 0 // Only one call per round, ladies.
		return

	command_announcement.Announce("Pare che i nostri sistemi abbiano rilevato una richiesta per l'attivazione di una Task Force d'Emergenza dalla [station_name()]. Ne prepareremo e invieremo una quanto più presto possibile.", "[GLOB.using_map.boss_name]")
	evacuation_controller.add_can_call_predicate(new/datum/evacuation_predicate/ert())

	can_call_ert = 0 // Only one call per round, gentleman.
	send_emergency_team = 1

	sleep(600 * 5)
	send_emergency_team = 0 // Can no longer join the ERT.

/datum/evacuation_predicate/ert
	var/prevent_until

/datum/evacuation_predicate/ert/New()
	..()
	prevent_until = world.time + 30 MINUTES

/datum/evacuation_predicate/ert/is_valid()
	return world.time < prevent_until

/datum/evacuation_predicate/ert/can_call(var/user)
	if(world.time >= prevent_until)
		return TRUE
	to_chat(user, "<span class='warning'>Una Task Force d'Emergenza è stata inviata. Le richieste di Evacuazione saranno rifiutate fino a [duration2stationtime(prevent_until - world.time)].</span>")
	return FALSE
