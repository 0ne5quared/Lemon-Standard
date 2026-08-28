extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened

func handle_event(event: String, params: Array):

	# attached_card_summoned represents the card bearing the sigil being summoned
	if event == "card_sacrificed" and params[0] == card and isFriendly:
		print("Unkillable triggered!")
		# Draw the modified card copy
		fightManager.draw_card(CardInfo.from_name(card.card_data["evolution"]))
