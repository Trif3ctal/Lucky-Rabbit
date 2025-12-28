SMODS.Joker {
    key = "balancing_act",
    config = {
        extra = {
            chips = 150
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    rarity = 1,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 8, y = 9 },
    blueprint_compat = true,
    cost = 5,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.discards_used == 0 then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.CHIPS },
            calc_function = function(card)
                card.joker_display_values.chips = G.GAME.current_round.discards_used == 0 and card.ability.extra.chips or 0
            end
        }
    end
}