SMODS.Joker {
	key = "girl_next_door",
	atlas = "Jokers",
	pos = { x = 0, y = 8 },
	rarity = 2,
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
    perishable_compat = false,
	config = {
        extra = {
            xmult = 1,
            gain_diamond = 0.25,
            loss = 0.5
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.gain_diamond, card.ability.extra.loss } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.xmult > 1 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.change_suit and context.old_suit ~= nil and context.new_suit == "Diamonds" and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "gain_diamond",
                message_key = "a_xmult"
            })
        end
        if context.individual and context.cardarea == G.play and not context.blueprint and card.ability.extra.xmult - card.ability.extra.loss >= 1 then
            if (context.other_card:get_id() == 12) or (context.other_card:get_id() == 13) then
                SMODS.scale_card(card, {
                    operation = "-",
                    ref_table = card.ability.extra,
                    ref_value = "xmult",
                    scalar_value = "loss",
                    message_key = "a_xmult_minus"
                })
            end
        end
    end
}