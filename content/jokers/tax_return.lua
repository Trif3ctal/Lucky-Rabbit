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
	end,
	joker_display_def = function(JokerDisplay)
		---@type JDJokerDefinition
		return {
			text = {
				{ ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
				{ text = "x",                              scale = 0.35 },
				{ text = "$1",                             colour = G.C.GOLD },
			},
			calc_function = function(card)
				local count = 0
				local text, _, scoring_hand = JokerDisplay.evaluate_hand()
				local full_hand = JokerDisplay.current_hand
				if text ~= 'Unknown' then
					for _, _card in pairs(full_hand) do
						if not SMODS.in_scoring(_card, scoring_hand) then
							count = count + 1
						end
					end
				end
				card.joker_display_values.count = count
			end
		}
	end,
}
