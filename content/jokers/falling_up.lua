SMODS.Joker {
	key = "falling_up",
	atlas = "Jokers",
	pos = { x = 7, y = 7 },
	rarity = 2,
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
    perishable_compat = false,
	config = {
        extra = {
            xmult = 1,
            increase = 0.5,
            odds = 5
        }
    },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return { vars = { numerator, denominator, card.ability.extra.increase, card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.xmult > 1 then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
        if context.final_scoring_step and not context.blueprint and G.GAME.current_round.hands_left > 0 then
            if SMODS.pseudorandom_probability(card, 'falling_up', 1, card.ability.extra.odds) then
                hand_chips = to_big(0)
                mult = to_big(0)
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'xmult',
                    scalar_value = 'increase',
                    no_message = true
                })
                return {
                    message = localize('k_nope_ex'),
					colour = G.C.SECONDARY_SET.Tarot,
					sound = 'cancel'
                }
            end
        end
    end
}
