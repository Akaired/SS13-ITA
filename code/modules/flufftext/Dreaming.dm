
var/list/dreams = list(
	"una tessera ID","una bottiglia","una faccia familiare","un membro dell'equipaggio","una cassetta degli attrezzi","un agente di sicurezza","il capitano",
	"voci da ogni parte","lo spazio profondo","un dottore","il reattore","un traditore","un alleato","il buio",
	"luce","uno scienziato","una scimmia","una catastrofe","una persona che ami","una pistola","calore","freddo","il sole",
	"a hat","a ruined station","a planet","phoron","air","the medical bay","the bridge","blinking lights",
	"una luce blu","un laboratorio abbandonato","La Compagnia", "pirati", "mercenari","sangue","guarigione","potere","rispetto",
	"riches","space","a crash","happiness","pride","a fall","water","flames","ice","melons","flying","the eggs","money",
	"il capo ingegnere","il capo scienziato","il dottore capo",
	"un ignegnere","lo spazzino","il tecnico atmosferico",
	"un tecnico cargo","il botanico","un minatore spaziale","lo psicologo","il chimico",
	"il virologo","il tecnico meccatronico","lo chef","il barista","un cappellano","un libraio","un topo",
	"una spiaggia","l'holodeck","una stanza affumata","una voce","il freddo","un mouse","un tavolo operatorio","la pioggia","un alieno",
	"un gatto","l'IA","un beaker pieno di liquidi strani","la supermateria", "una creatura fatta completamente di carne rubata",
	"Un gas", "Un robot", "un insetto", "un essere di Pura Luce", "Il Comandante", "Il Vice-Comandante", "Il Capo della Sicurezza", "il Rappresentante della Compagnia",
	"il rappresentante", "il consigliere", "il Guardiamarina", "l'ingegnere esperto", "il paramedico", "il fante", "il confessore",
	"il mercenario medico", "il mercenario della sicurezza", "Il Portoghese", "un amico di lunga data", "il geologo", "il pilota", "il passeggero", "il capo della sicurezza",
	"il secondino", "il tecnico forense", "Guardiano della Prigione", "la torre", "L'Uomo Senza Faccia", "un campo fiorito", "una vecchia dimora", "il mercenario",
	"la tavola operatoria", "una siringa", "una lama", "un oceano", "alle tue spalle", "sopra di te", "qualcuno vicino a te", "un luogo dimenticato", "l'esodo",
	)

mob/living/carbon/proc/dream()
	dreaming = 1

	spawn(0)
		for(var/i = rand(1,4),i > 0, i--)
			to_chat(src, "<span class='notice'><i>... [pick(dreams)] ...</i></span>")
			sleep(rand(40,70))
			if(paralysis <= 0)
				dreaming = 0
				return 0
		dreaming = 0
		return 1

mob/living/carbon/proc/handle_dreams()
	if(client && !dreaming && prob(5))
		dream()

mob/living/carbon/var/dreaming = 0
