/datum/trader/pizzaria
	name = "Pizza Shop Employee"
	name_language = TRADER_DEFAULT_NAME
	origin = "Pizzeria"
	possible_origins = list("Papa Joe's", "Pizza Ship", "Dominator Pizza", "Little Kaezars", "Pizza Planet", "Cheese Louise", "Little Taste o' Neo-Italy", "Pizza Gestapo")
	trade_flags = TRADER_MONEY
	possible_wanted_items = list() //They are a pizza shop, not a bargainer.
	possible_trading_items = list(/obj/item/weapon/reagent_containers/food/snacks/sliceable/pizza   = TRADER_SUBTYPES_ONLY)

	speech = list("hail_generic"    = "Hello! Welcome to ORIGIN, may I take your order?",
				"hail_deny"         = "Beeeep... I'm sorry, your connection has been severed.",

				"trade_complete"    = "Grazie per aver scelto ORIGIN!",
				"trade_no_goods"    = "Sono spiacente, ma noi accettiamo solo contanti",
				"trade_blacklisted" = "Signore questo è...altamente illegale",
				"trade_not_enough"  = "Ehm...quelli non bastano per pagare una pizza",
				"how_much"          = "That pizza will cost you VALUE thalers.",

				"compliment_deny"   = "That's a bit forward, don't you think?",
				"compliment_accept" = "Grazie signore! Lei è veramente gentile.",
				"insult_good"       = "Per favore, la smetta.",
				"insult_bad"        = "Signore, solo perché sono obbligato da contratto a tenerla in linea per qualche minuto, non significa che devo tenerlo.",

				"bribe_refusal"     = "Uh, grazie per i soldi, signore. Finche lei rimarrà in zona, noi saremo qua.",
				)

/datum/trader/pizzaria/trade(var/list/offers, var/num, var/turf/location)
	. = ..()
	if(.)
		var/atom/movable/M = .
		var/obj/item/pizzabox/box = new(location)
		M.forceMove(box)
		box.pizza = M
		box.boxtag = "Ordine speciale da [origin]"

/datum/trader/ship/chinese
	name = "Ristorante Cinese"
	name_language = TRADER_DEFAULT_NAME
	origin = "Captain Panda Bistro"
	possible_origins = list("888 Shanghai Kitchen", "Mr. Lee's Greater Hong Kong", "The House of the Venerable and Inscrutable Colonel", "Lucky Dragon")
	trade_flags = TRADER_MONEY
	possible_wanted_items = list()
	possible_trading_items = list(/obj/item/weapon/reagent_containers/food/snacks/meatkabob    	       = TRADER_THIS_TYPE,
							/obj/item/weapon/reagent_containers/food/snacks/monkeysdelight             = TRADER_THIS_TYPE,
							/obj/item/weapon/reagent_containers/food/snacks/ricepudding                = TRADER_THIS_TYPE,
							/obj/item/weapon/reagent_containers/food/snacks/slice/xenomeatbread/filled = TRADER_THIS_TYPE,
							/obj/item/weapon/reagent_containers/food/snacks/soydope                    = TRADER_THIS_TYPE,
							/obj/item/weapon/reagent_containers/food/snacks/stewedsoymeat              = TRADER_THIS_TYPE,
							/obj/item/weapon/reagent_containers/food/snacks/wingfangchu                = TRADER_THIS_TYPE,
							/obj/item/weapon/reagent_containers/food/drinks/dry_ramen                  = TRADER_THIS_TYPE
							)

	var/list/fortunes = list("Oggi tocca a te creare la tranquillità che desideri.",
							"If you refuse to accept anything but the best, you very often get it.",
							"Il sorriso è il pasaporto per entrare nei cuori altrui.",
							"Il duro lavoro ripaga in futuro, la pigrizia paga subito.",
							"Il cambiamento può far male, ma spesso conduce al miglioramento.",
							"Hidden in a valley beside an open stream- This will be the type of place where you will find your dream.",
							"Never give up. You're not a failure if you don't give up.",
							"L'amore può durare per sempre, se vuoi.",
							"The love of your life is stepping into your planet this summer.",
							"Your ability for accomplishment will follow with success.",
							"Per favore, aiutami. Sono intrappolato in una fabbrica di biscotti della fortuna!")

	speech = list("hail_generic"     = "There are two things constant in life, death and Chinese food. How may I help you?",
				"hail_deny"          = "We do not take orders from rude customers.",

				"trade_complete"     = "Thank you, sir, for your patronage.",
				"trade_blacklist"    = "No, that is very odd. Why would you trade that away?",
				"trade_no_goods"     = "I only accept money transfers.",
				"trade_not_enough"   = "No, I am sorry, that is not possible. I need to make a living.",
				"how_much"           = "I give you ITEM, for VALUE thalers. No more, no less.",

				"compliment_deny"    = "That was an odd thing to say. You are very odd.",
				"compliment_accept"  = "Good philosophy, see good in bad, I like.",
				"insult_good"        = "As a man said long ago, \"When anger rises, think of the consequences.\" Think on that.",
				"insult_bad"         = "I do not need to take this from you.",

				"bribe_refusal"     = "Hm... I'll think about it.",
				"bribe_accept"      = "Oh yes! I think I'll stay a few more minutes, then.",
				)

/datum/trader/ship/chinese/trade(var/list/offers, var/num, var/turf/location)
	. = ..()
	if(.)
		var/obj/item/weapon/reagent_containers/food/snacks/fortunecookie/cookie = new(location)
		var/obj/item/weapon/paper/paper = new(cookie)
		cookie.trash = paper
		paper.SetName("Fortune")
		paper.info = pick(fortunes)

/datum/trader/grocery
	name = "Grocer"
	name_language = TRADER_DEFAULT_NAME
	possible_origins = list("HyTee", "Kreugars", "Spaceway", "Privaxs", "FutureValue", "Phyvendyme", "Skreller's Market")
	trade_flags = TRADER_MONEY

	possible_trading_items = list(/obj/item/weapon/reagent_containers/food/snacks                      = TRADER_SUBTYPES_ONLY,
							/obj/item/weapon/reagent_containers/food/drinks/cans                       = TRADER_SUBTYPES_ONLY,
							/obj/item/weapon/reagent_containers/food/drinks/bottle                     = TRADER_SUBTYPES_ONLY,
							/obj/item/weapon/reagent_containers/food/drinks/bottle/small               = TRADER_BLACKLIST,
							/obj/item/weapon/reagent_containers/food/snacks/boiledslimecore            = TRADER_BLACKLIST,
							/obj/item/weapon/reagent_containers/food/snacks/checker                    = TRADER_BLACKLIST_ALL,
							/obj/item/weapon/reagent_containers/food/snacks/fruit_slice                = TRADER_BLACKLIST,
							/obj/item/weapon/reagent_containers/food/snacks/slice                      = TRADER_BLACKLIST_ALL,
							/obj/item/weapon/reagent_containers/food/snacks/grown                      = TRADER_BLACKLIST_ALL,
							/obj/item/weapon/reagent_containers/food/snacks/human                      = TRADER_BLACKLIST_ALL,
							/obj/item/weapon/reagent_containers/food/snacks/sliceable/braincake        = TRADER_BLACKLIST,
							/obj/item/weapon/reagent_containers/food/snacks/meat/human                 = TRADER_BLACKLIST,
							/obj/item/weapon/reagent_containers/food/snacks/variable                   = TRADER_BLACKLIST_ALL
							)

	speech = list("hail_generic"     = "Salve e benvenuti a ORIGIN, il negozio del futuro!",
				"hail_deny"          = "Siamo spiacenti, ma abbiamo inserito le sue comunicazioni nella blacklist a causa dei suoi comportamenti scorretti e scortesi.",

				"trade_complete"     = "Grazie per essere venuto nel nostro negozio ORIGIN!",
				"trade_blacklist"    = "Io...wow. Questo è...signore, no.",
				"trade_no_goods"     = "ORIGIN accetta solo contanti, signore.",
				"trade_not_enough"   = "Non sono sufficienti, signore.",
				"how_much"           = "Signore, questo vi costerà dei talleri. Va bene lo stesso?",

				"compliment_deny"    = "Signore, questo è un ambiente professionale. Non mi obblighi a chiamare il responsabile.",
				"compliment_accept"  = "Grazie!",
				"insult_good"        = "Signore, per favore non faccia scenate.",
				"insult_bad"         = "Signore, dovrò chiamare il responsabile se non si calma.",

				"bribe_refusal"      = "Certo! ORIGIN sarà sempre disponibile per lei.",
				)

/datum/trader/bakery
	name = "Chef Pasticcere"
	name_language = TRADER_DEFAULT_NAME
	origin = "Pasticceria"
	possible_origins = list("Cakes By Design", "Corner Bakery Local", "My Favorite Cake & Pastry Cafe", "Mama Joes Bakery", "Sprinkles and Fun", "Cakestrosity")

	speech = list("hail_generic"     = "Hello, welcome to ORIGIN! We serve baked goods, including pies, cakes, and anything sweet!",
				"hail_deny"          = "Il nostro cibo è un privilegio, non un diritto. Arrivederci.",

				"trade_complete"     = "Grazie per aver acquistato da noi! Torni pure se avrà fame di nuovo.",
				"trade_blacklist"    = "oi accettiamo solo soldi. Non...quello...",
				"trade_no_goods"     = "Soldi per torte! E' questo il nostro affare!",
				"trade_not_enough"   = "I nosri piatti sono molto più cari rispetto a quelli, signore.",
				"how_much"           = "That lovely dish will cost you VALUE thalers.",

				"compliment_deny"    = "Oh wow, how nice of you...",
				"compliment_accept"  = "Sei dolce quanto le mie torte!",
				"insult_good"        = "My pies are NOT knockoffs!",
				"insult_bad"         = "Well, aren't you a sour apple?",

				"bribe_refusal"      = "Oh ho ho! I'd never think of taking ORIGIN on the road!",
				)
	possible_trading_items = list(/obj/item/weapon/reagent_containers/food/snacks/slice/birthdaycake/filled     = TRADER_THIS_TYPE,
								/obj/item/weapon/reagent_containers/food/snacks/slice/carrotcake/filled         = TRADER_THIS_TYPE,
								/obj/item/weapon/reagent_containers/food/snacks/slice/cheesecake/filled         = TRADER_THIS_TYPE,
								/obj/item/weapon/reagent_containers/food/snacks/slice/chocolatecake/filled      = TRADER_THIS_TYPE,
								/obj/item/weapon/reagent_containers/food/snacks/slice/lemoncake/filled          = TRADER_THIS_TYPE,
								/obj/item/weapon/reagent_containers/food/snacks/slice/limecake/filled           = TRADER_THIS_TYPE,
								/obj/item/weapon/reagent_containers/food/snacks/slice/orangecake/filled         = TRADER_THIS_TYPE,
								/obj/item/weapon/reagent_containers/food/snacks/slice/plaincake/filled          = TRADER_THIS_TYPE,
								/obj/item/weapon/reagent_containers/food/snacks/slice/pumpkinpie/filled         = TRADER_THIS_TYPE,
								/obj/item/weapon/reagent_containers/food/snacks/slice/bananabread/filled        = TRADER_THIS_TYPE,
								/obj/item/weapon/reagent_containers/food/snacks/sliceable                       = TRADER_SUBTYPES_ONLY,
								/obj/item/weapon/reagent_containers/food/snacks/sliceable/pizza                 = TRADER_BLACKLIST_ALL,
								/obj/item/weapon/reagent_containers/food/snacks/sliceable/xenomeatbread         = TRADER_BLACKLIST,
								/obj/item/weapon/reagent_containers/food/snacks/sliceable/flatdough             = TRADER_BLACKLIST,
								/obj/item/weapon/reagent_containers/food/snacks/sliceable/braincake             = TRADER_BLACKLIST,
								/obj/item/weapon/reagent_containers/food/snacks/pie                             = TRADER_THIS_TYPE,
								/obj/item/weapon/reagent_containers/food/snacks/applepie                        = TRADER_THIS_TYPE)