SMODS.Joker {
	key = "fighting_game",
	atlas = "Jokers",
	pos = { x = 3, y = 5 },
	rarity = 2,
	cost = 5,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	config = { extra = { chance = 3, h_size = 1, total_size = 0 } },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal or 1,
                card.ability.extra.chance,
                card.ability.extra.h_size
            }
        }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit('Clubs') and pseudorandom("fighting_game") < G.GAME.probabilities.normal / card.ability.extra.chance then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.hand:change_size(card.ability.extra.h_size)
                                return true
                            end
                        }))
                        card.ability.extra.total_size = card.ability.extra.total_size + card.ability.extra.h_size
                        return true
                    end
                }))
                return {
                    message = localize{type="variable", key="a_handsize", vars={card.ability.extra.h_size}},
                }
            end
		end
        if context.end_of_round and card.ability.extra.total_size > 0 then
            G.hand:change_size(-card.ability.extra.total_size)
            card.ability.extra.total_size = 0
        end
	end
}
