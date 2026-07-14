extends SigilEffect

# This is called whenever something happens that might trigger a sigil, with 'event' representing what happened
func handle_event(event: String, params: Array):
	if (event != "card_summoned") or card.in_hand or (params[0].get_parent().get_parent().name != "PlayerSlots") or params[0] == card: return
	card_anim.play("Evolve")
	yield (card_anim, "animation_finished")
	var dmgTaken = card.card_data["health"] - card.health
	card.from_data(CardInfo.from_name(card.card_data["evolution"]))
	card.health = card.card_data["health"] - dmgTaken
	slotManager.recalculate_buffs_and_such()
