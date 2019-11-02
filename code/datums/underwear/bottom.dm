/datum/category_item/underwear/bottom
	underwear_gender = PLURAL
	underwear_name = "biancheria intima"
	underwear_type = /obj/item/underwear/bottom

/datum/category_item/underwear/bottom/none
	name = "Nessuna"
	always_last = TRUE
	underwear_type = null

/datum/category_item/underwear/bottom/briefs
	name = "Slip"
	underwear_name = "slip"
	icon_state = "slip"
	has_color = TRUE

/datum/category_item/underwear/bottom/briefs/is_default(var/gender)
	return gender != FEMALE

/datum/category_item/underwear/bottom/panties_noback
	name = "tanga"
	underwear_name = "tanga"
	icon_state = "tanga"
	has_color = TRUE

/datum/category_item/underwear/bottom/boxers_loveheart
	name = "Boxers, Cuoricini"
	underwear_name = "boxers"
	icon_state = "boxers_cuoricini"

/datum/category_item/underwear/bottom/boxers
	name = "Boxers"
	underwear_name = "boxers"
	icon_state = "boxers"
	has_color = TRUE

/datum/category_item/underwear/bottom/boxers_green_and_blue
	name = "Boxers, strisce vedri&blu"
	underwear_name = "boxers"
	icon_state = "boxers_verdi_e_blu"

/datum/category_item/underwear/bottom/panties
	name = "mutandine"
	underwear_name = "mutandine"
	icon_state = "mutandine"
	has_color = TRUE

/datum/category_item/underwear/bottom/panties/is_default(var/gender)
	return gender == FEMALE

/datum/category_item/underwear/bottom/lacy_thong
	name = "Perizoma, Luna"
	underwear_name = "luna"
	icon_state = "perizoma_luna"

/datum/category_item/underwear/bottom/lacy_thong_alt
	name = "Lacy thong, alt"
	underwear_name = "thong"
	icon_state = "lacy_thong_alt"
	has_color = TRUE

/datum/category_item/underwear/bottom/panties_alt
	name = "Panties, alt"
	underwear_name = "panties"
	icon_state = "panties_alt"
	has_color = TRUE

/datum/category_item/underwear/bottom/compression_shorts
	name = "Compression shorts"
	icon_state = "compression_shorts"
	has_color = TRUE

/datum/category_item/underwear/bottom/thong
	name = "Thong"
	underwear_name = "thong"
	icon_state = "thong"
	has_color = TRUE

/datum/category_item/underwear/bottom/expedition_pt_shorts
	name = "PT shorts, Expeditionary Corps"
	icon_state = "expedition_shorts"

/datum/category_item/underwear/bottom/fleet_pt_shorts
	name = "PT shorts, Fleet"
	icon_state = "fleet_shorts"

/datum/category_item/underwear/bottom/army_pt_shorts
	name = "PT shorts, Army"
	icon_state = "army_shorts"

/datum/category_item/underwear/bottom/longjon
	name = "Long John Bottoms"
	underwear_name = "long johns"
	icon_state = "ljonb"
	has_color = TRUE
