SMODS.Joker {
    key = "wisdom",
    atlas = "Jokers",
    pos = { x = 2, y = 10 },
    config = {
        extra = {
            mult = 0,
            gain = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = { key = "purple_seal", set = "Other" }
        return { vars = { card.ability.extra.gain, card.ability.extra.mult } }
    end,
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    cost = 5,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.mult > 0 then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.discard and not context.blueprint then
            if context.other_card and context.other_card.seal and context.other_card.seal == "Purple" and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'mult',
                    scalar_value = 'gain',
                })
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
		---@type JDJokerDefinition
		return {
			reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = lighten(G.C.PURPLE, 0.35) },
            { text = ")" }
        },
		calc_function = function(card)
			card.joker_display_values.localized_text = localize{ type = "name_text", set = "Other", key = "purple_seal" }
		end
		}
	end
}