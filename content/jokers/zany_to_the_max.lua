SMODS.Joker {
	key = "zany_to_the_max",
	atlas = "Jokers",
	pos = { x = 7, y = 5 },
	rarity = 2,
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
    perishable_compat = false,
	config = {
        extra = {
            chip_gain = 10,
            chips = 0,
            mult_gain = 1,
            mult = 0,
            xmult_gain = 0.1,
            xmult = 1,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chip_gain, card.ability.extra.mult_gain, card.ability.extra.xmult_gain, card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint and context.scoring_name == "Three of a Kind" then
            local pseudo = pseudorandom(pseudoseed('zany_to_the_max'))
            -- 33% chance #1
            if pseudo <= 0.33 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'chips',
                    scalar_value = 'chip_gain',
                    message_key = 'a_chips',
                    message_colour = G.C.CHIPS
                })
                -- 33% chance #2
            elseif pseudo <= 0.66 then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'mult',
                    scalar_value = 'mult_gain',
                    message_key = 'a_mult',
                    message_colour = G.C.MULT
                })
                -- 33% chance #3
            else
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'xmult',
                    scalar_value = 'xmult_gain',
                    message_key = 'a_xmult',
                    message_colour = G.C.MULT
                })
            end
        end
        if context.joker_main then
            local ret = {}
            if card.ability.extra.chips > 0 then
                ret.chips = card.ability.extra.chips
            end
            if card.ability.extra.mult > 0 then
                ret.mult = card.ability.extra.mult
            end
            if card.ability.extra.xmult > 1 then
                ret.xmult = card.ability.extra.xmult
            end
            return ret
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+",                              colour = G.C.MULT },
                { ref_table = "card.ability.extra", ref_value = "mult", colour = G.C.MULT, retrigger_type = "mult" },
                { text = " +",                             colour = G.C.CHIPS },
                { ref_table = "card.ability.extra", ref_value = "chips",  colour = G.C.CHIPS,  retrigger_type = "mult" },
                { text = " " },
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                    }
                }
            },
            reminder_text = {
                { text = "(" },
                { text = localize("Three of a Kind", "poker_hands"), colour = G.C.ORANGE },
                { text = ")" }
            },
        }
    end,
}