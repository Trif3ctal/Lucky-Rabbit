SMODS.Joker {
	key = "tax_return",
	atlas = "Jokers",
	pos = { x = 8, y = 4 },
	rarity = 1,
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	config = { extra = { dollars = 1 } },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
            }
        }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == 'unscored' then
			return {
				dollars = card.ability.extra.dollars
			}
		end
	end
}
