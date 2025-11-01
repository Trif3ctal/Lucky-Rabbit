SMODS.Joker {
	key = "elimination_game",
	atlas = "Jokers",
	pos = { x = 9, y = 7 },
	rarity = 1,
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
    perishable_compat = false,
	config = { extra = { mult = 0, gain = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gain, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.mult > 0 then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.selling_card and context.card.ability.set == "Joker" and not context.blueprint and context.card ~= card then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = 'mult',
                scalar_value = 'gain',
                message_key = 'a_mult',
                message_colour = G.C.MULT
            })
        end
    end
}
