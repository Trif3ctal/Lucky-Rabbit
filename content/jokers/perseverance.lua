SMODS.Joker {
    key = "perseverance",
    atlas = "Jokers",
    pos = { x = 3, y = 10 },
    config = {
        extra = {
            base_odds = 3
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = { key = "red_seal", set = "Other" }
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.base_odds, 'fmod_perseverance')
        return { vars = { num, denom } }
    end,
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    cost = 5,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card.seal and context.other_card.seal == "Red" then
            local count = 0
            while SMODS.pseudorandom_probability(card, 'perseverance', 1, count + card.ability.extra.base_odds) do
                count = count + 1
            end
            return {
                repetitions = count,
            }
        end
    end,
    joker_display_def = function(JokerDisplay)
		---@type JDJokerDefinition
		return {
			reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = lighten(G.C.RED, 0.35) },
            { text = ")" }
        },
		calc_function = function(card)
			card.joker_display_values.localized_text = localize{ type = "name_text", set = "Other", key = "red_seal" }
		end
		}
	end
}