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
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.scale_card(card, {
                            ref_table = card.ability.extra,
                            ref_value = 'xmult',
                            scalar_value = 'increase',
                            no_message = true
                        })
                        return true
                    end
                }))
                return {
                    message = localize('k_nope_ex'),
					colour = G.C.SECONDARY_SET.Tarot,
					sound = 'cancel'
                }
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult" }
                    }
                }
            },
            extra = {
            {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "odds" },
                { text = ")" },
            }
        },
        extra_config = { colour = G.C.GREEN, scale = 0.3 },
        calc_function = function(card)
            local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
            card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { numerator, denominator } }
        end
        }
    end
}
