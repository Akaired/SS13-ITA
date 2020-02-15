/decl/webhook/roundend
	id = WEBHOOK_ROUNDEND

// Data expects three numerical fields: "survivors", "escaped", "ghosts"
/decl/webhook/roundend/get_message(var/list/data)
	. = ..()
	var/desc = "Un round di **[SSticker.mode ? SSticker.mode.name : "Unknown"]** è appena terminato.\n"
	if(data)

		if(data["survivors"] > 0)

			var/s_was =      "era"
			var/s_survivor = "sopravvissuto"
			var/s_escaped =  "fuggito"

			if(data["survivors"] != 1)
				s_was = "erano"
				s_survivor = "sopravvissuti"

			if(!evacuation_controller.emergency_evacuation)
				s_escaped = "transferred"

			desc += "C'era [s_was] **[data["survivors"]] [s_survivor]** (**[data["escaped"]] [s_escaped])** e **[data["ghosts"]] fantasmi**."
		else
			desc += "Non c'è stato **nessun sopravvissuto** ([data["ghosts"]] fantasmi)."

	.["embeds"] = list(list(
		"title" = "Il Round [game_id] sta terminando.",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
