extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):
	# attached_card_summoned represents the card bearing the sigil being summoned
	if event == "card_perished" and params[0] == card:
		print("Health")
		print(str(card.health))
		if card.get_node("CardBody/SacOlay").visible:
			# Draw the modified card copy
			if isFriendly:
				fightManager.draw_card(CardInfo.from_name(card.card_data["evolution"]))
				fightManager.add_bones(-1)
			else:
				fightManager.add_opponent_bones(-1)
