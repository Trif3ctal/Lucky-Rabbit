SMODS.Joker {
    key = "low_hanging_fruit",
    config = {
        extra = {
            chips = 9,
            mult = 6
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
    end,
    rarity = 1,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    pos = { x = 5, y = 1 },
    cost = 4,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 9 or context.other_card:get_id() == 6 then
                return {
                    chips = card.ability.extra.chips,
					mult = card.ability.extra.mult,
					card = card
                }
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+",                              colour = G.C.MULT },
                { ref_table = "card.joker_display_values", ref_value = "mult", colour = G.C.MULT, retrigger_type = "mult" },
                { text = " +",                             colour = G.C.CHIPS },
                { ref_table = "card.joker_display_values", ref_value = "chips",  colour = G.C.CHIPS,  retrigger_type = "mult" }
            },
            reminder_text = {
                { text = "(6, 9)" }
            },
            calc_function = function(card)
                local chips, mult = 0, 0
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        if scoring_card:get_id() and (scoring_card:get_id() == 6 or scoring_card:get_id() == 9) then
                            local retriggers = JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                            chips = chips + card.ability.extra.chips * retriggers
                            mult = mult + card.ability.extra.mult * retriggers
                        end
                    end
                end
                card.joker_display_values.chips = chips
                card.joker_display_values.mult = mult
            end
        }
    end,
}