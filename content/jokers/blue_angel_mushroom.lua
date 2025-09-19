SMODS.Joker {
	key = 'blue_angel_mushroom',
	atlas = 'Jokers',
	pos = { x = 4, y = 1 },
	rarity = 2,
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	config = { extra = { life = 3, uses = 0 } },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.life,
                card.ability.extra.life - card.ability.extra.uses,
		}
    }
	end,
	calculate = function(self, card, context)
		if context.after and G.GAME.current_round.hands_left == 0 and G.GAME.blind.chips > G.GAME.chips then
            card.ability.extra.uses = card.ability.extra.uses + 1
            G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 1
            if card.ability.extra.uses < card.ability.extra.life then
                return {
                    message = localize('k_saved_ex'),
                    colour = G.C.RED
                }
            else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand_text_area.blind_chips:juice_up()
                        G.hand_text_area.game_chips:juice_up()
                        play_sound('tarot1')
                        card:start_dissolve()
                        return true
                    end
                }))
                return {
                    message = localize('k_saved_ex'),
                    colour = G.C.RED
                }
            end
        end
	end
}
