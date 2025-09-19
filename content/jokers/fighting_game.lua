SMODS.Joker {
	key = "fighting_game",
	atlas = "Jokers",
	pos = { x = 3, y = 5 },
	rarity = 2,
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	config = { extra = { odds = 3, h_size = 1, total_size = 0 } },
	loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'fmod_fight')
        return { vars = { numerator, denominator, card.ability.extra.h_size } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit('Clubs') and SMODS.pseudorandom_probability(card, 'fighting_game', 1, card.ability.extra.odds, 'fmod_fight') then
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
