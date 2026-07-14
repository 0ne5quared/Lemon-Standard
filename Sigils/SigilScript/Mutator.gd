extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):

	if event == "card_summoned" and not card.in_hand and params[0] == is_friendly:
    	var dmgTaken = card.card_data["health"] - card.health
    	card.from_data(CardInfo.from_name(card.card_data["evolution"]))
    	card.health = card.card_data["health"] - dmgTaken
    	slotManager.recalculate_buffs_and_such()
    #	for card in slotManager.all_friendly_cards():
    #		card.calculate_buffs()
    #	for eCard in slotManager.all_enemy_cards():
    #		eCard.calculate_buffs()
