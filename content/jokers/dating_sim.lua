SMODS.Joker {
	key = "dating_sim",
	atlas = "Jokers",
	pos = { x = 0, y = 5 },
	rarity = 2,
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	config = { extra = { chips = 10 } },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
            }
        }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit('Hearts') then
                context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + card.ability.extra.chips
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS
                }
            end
		end
	end
}
