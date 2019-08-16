// This system defines news that will be displayed in the course of a round.
// Uses BYOND's type system to put everything into a nice format

/datum/news_announcement
	var
		round_time // time of the round at which this should be announced, in seconds
		message // body of the message
		author = "Editoriale Nanotrasen"
		channel_name = "Nyx Daily"
		can_be_redacted = 0
		message_type = "Storia"

	revolution_inciting_event

		paycuts_suspicion
			round_time = 60*10
			message = {"I rapporti hanno fatto trapelare indizi su come NanoTrasen sta pianificando di
			            diminuire i pagamenti a su molte delle sue stazioni di ricerca a Tau Ceti.
			            Apparentemente queste stazioni di ricerca non sono state in grado di produrre le
			            entrate previste e quindi delle rettifiche devono essere fatte."}
			author = "Non autorizzato"

		paycuts_confirmation
			round_time = 60*40
			message = {"Le voci precedenti in merito ai tagli agli stipendi nelle stazioni di ricerca di
						Tau Ceti sono state confermate. A sorpresa, comunque, i tagli sono rivolti solamente
						al personale di bassa lega. I Capi Dipartimento, secondo le nostre fonti, non saranno
						coinvolti da nessun taglio."}
			author = "Non autorizzato"

		human_experiments
			round_time = 60*90
			message = {"Incredibili rapporti circa sperimentazione umana hanno attirato la nostra attenzione.
			 			Secondo un rifugiato da una delle stazioni di ricerca di Tau Ceti, le loro stazioni,
			 			in modo da aumentare i guadagni, hanno ricommissionato i loro laboratori in modo da
			 			svolgere esperimenti su umani vivi, includendo la ricerca virologica, geetica e anche
			 			\"darli da mangiare agli slime per vedere che succede\". Allo stesso modo, queste cavie
			 			non erano scimmie umanizzate, o neanche volontari, ma piuttosto personale non qualificato
			 			a cui erano stati forzati gli esperimenti, e che sono stati dichiarati morti a causa di
			 			un \"infortunio sul lavoro\" da parte di NanoTrasen. Più informazioni a venire."}
			author = "Non autorizzato"

	bluespace_research

		announcement
			round_time = 60*20
			message = {"Un nuovo campo della ricerca che sta cercando di spiegare innumerevoli buchi nello
						spaziotempo, noto anche come \"Bluespace Research\", ha raggiunto nuove vette. Delle
						innumerevoli stazioni spaziali in orbita su Tau Ceti, solo quindici sono state scelte
						per l'assegnazione di speciale equipaggiamento che permetterà di ricercare con la
						\"Bluespace Research\". Ci sono voci circa le quali alcune di queste riceveranno dei
						veri e propri \"travel gates\" che gli permetteranno di viaggiare in realtà alternate."}

	random_junk

		cheesy_honkers
			author = "Assistant Editor Carl Ritz"
			channel_name = "The Gibson Gazette"
			message = {"Do cheesy honkers increase risk of having a miscarriage? Several health administrations
						say so!"}
			round_time = 60 * 15

		net_block
			author = "Assistant Editor Carl Ritz"
			channel_name = "The Gibson Gazette"
			message = {"Several corporations banding together to block access to 'wetskrell.net', site administrators
			claiming violation of net laws."}
			round_time = 60 * 50

		found_ssd
			channel_name = "Nyx Daily"
			author = "Doctor Eric Hanfield"

			message = {"Several people have been found unconscious at their terminals. It is thought that it was due
						to a lack of sleep or of simply migraines from staring at the screen too long. Camera footage
						reveals that many of them were playing games instead of working and their pay has been docked
						accordingly."}
			round_time = 60 * 90

	lotus_tree

		explosions
			channel_name = "Nyx Daily"
			author = "Reporter Leland H. Howards"

			message = {"The newly-christened civillian transport Lotus Tree suffered two very large explosions near the
						bridge today, and there are unconfirmed reports that the death toll has passed 50. The cause of
						the explosions remain unknown, but there is speculation that it might have something to do with
						the recent change of regulation in the Moore-Lee Corporation, a major funder of the ship, when M-L
						announced that they were officially acknowledging inter-species marriage and providing couples
						with marriage tax-benefits."}
			round_time = 60 * 30

	food_riots

		breaking_news
			channel_name = "Nyx Daily"
			author = "Reporter Ro'kii Ar-Raqis"

			message = {"Breaking news: Food riots have broken out throughout the Refuge asteroid colony in the Tenebrae
						Lupus system. This comes only hours after NanoTrasen officials announced they will no longer trade with the
						colony, citing the increased presence of \"hostile factions\" on the colony has made trade too dangerous to
						continue. NanoTrasen officials have not given any details about said factions. More on that at the top of
						the hour."}
			round_time = 60 * 10

		more
			channel_name = "Nyx Daily"
			author = "Reporter Ro'kii Ar-Raqis"

			message = {"More on the Refuge food riots: The Refuge Council has condemned NanoTrasen's withdrawal from
			the colony, claiming \"there has been no increase in anti-NanoTrasen activity\", and \"\[the only] reason
			NanoTrasen withdrew was because the \[Tenebrae Lupus] system's Phoron deposits have been completely mined out.
			We have little to trade with them now\". NanoTrasen officials have denied these allegations, calling them
			\"further proof\" of the colony's anti-NanoTrasen stance. Meanwhile, Refuge Security has been unable to quell
			the riots. More on this at 6."}
			round_time = 60 * 60


var/global/list/newscaster_standard_feeds = list(/datum/news_announcement/bluespace_research, /datum/news_announcement/lotus_tree, /datum/news_announcement/random_junk,  /datum/news_announcement/food_riots)

proc/process_newscaster()
	check_for_newscaster_updates(SSticker.mode.newscaster_announcements)

var/global/tmp/announced_news_types = list()
proc/check_for_newscaster_updates(type)
	for(var/subtype in typesof(type)-type)
		var/datum/news_announcement/news = new subtype()
		if(news.round_time * 10 <= world.time && !(subtype in announced_news_types))
			announced_news_types += subtype
			announce_newscaster_news(news)

proc/announce_newscaster_news(datum/news_announcement/news)
	var/datum/feed_channel/sendto
	for(var/datum/feed_channel/FC in news_network.network_channels)
		if(FC.channel_name == news.channel_name)
			sendto = FC
			break

	if(!sendto)
		sendto = new /datum/feed_channel
		sendto.channel_name = news.channel_name
		sendto.author = news.author
		sendto.locked = 1
		sendto.is_admin_channel = 1
		news_network.network_channels += sendto

	var/author = news.author ? news.author : sendto.author
	news_network.SubmitArticle(news.message, author, news.channel_name, null, !news.can_be_redacted, news.message_type)
