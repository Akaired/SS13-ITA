/decl/webhook/roundstart
	id = WEBHOOK_ROUNDSTART

// Data expects a "url" field pointing to the current hosted server and port to connect on.
/decl/webhook/roundstart/get_message(var/list/data)
	. = ..()
	var/desc = "Un nuovo round sta cominciando"
	if(data && data["url"])
		desc += " su [data["url"]]"
	desc += "."

	.["embeds"] = list(list(
		"title" = "Il round sta cominciando.",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
