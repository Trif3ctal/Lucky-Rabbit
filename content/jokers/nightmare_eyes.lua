SMODS.Joker {
	key = "nightmare_eyes",
	atlas = "Jokers",
	pos = { x = 2, y = 8 },
	rarity = 2,
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	config = { extra = { xmult = 0.1 } },
    loc_vars = function(self, info_queue, card)
        local xmult = card.ability.extra.xmult * ((G.deck and G.deck.cards) and #G.deck.cards or 52)
        return { vars = { card.ability.extra.xmult, xmult > 1 and xmult or 1 } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_left == 0 and G.GAME.current_round.discards_left == 0 then
            local xmult = card.ability.extra.xmult * #G.deck.cards
            if xmult > 1 then
                return {
                    xmult = xmult
                }
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "exp" }
                }
            },
            calc_function = function(card)
                local xmult = card.ability.extra.xmult * ((G.deck and G.deck.cards) and #G.deck.cards or 52)
                card.joker_display_values.xmult = xmult > 1 and xmult or 1
            end
        }
    end,
}
