extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):
	print("0")
	if event == "card_summoned" and not card.in_hand and (params[0].get_parent().get_parent().name == "PlayerSlots") == isFriendly:
		print("HIIHIIHIHI")
		var dmgTaken = card.card_data["health"] - card.health
		card.from_data(CardInfo.from_name(card.card_data["evolution"]))
		card.health = card.card_data["health"] - dmgTaken
		slotManager.recalculate_buffs_and_such()
