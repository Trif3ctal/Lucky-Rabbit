SMODS.Joker {
    key = "555_hotline",
    rarity = 1,
    atlas = "Jokers",
    config = {
        extra = {
            fives = 5,
            money = 25
        }
    },
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    pos = { x = 9, y = 8 },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money, card.ability.extra.fives } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint and context.other_card:get_id() == 5 then
            if card.ability.extra.fives - 1 <= 0 and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                card.ability.extra.fives = 5
                return {
                    dollars = card.ability.extra.money
                }
            else
                card.ability.extra.fives = card.ability.extra.fives - 1
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            reminder_text = {
                { text = "(" },
                { ref_table = "card.ability.extra",        ref_value = "fives" },
                { text = "/" },
                { ref_table = "card.joker_display_values", ref_value = "start_count" },
                { text = ")" },
            },
            extra = {
                {
                    { text = "(" },
                    { text = "5", colour = G.C.ORANGE },
                    { text = ")" },
                }
            },
            calc_function = function(card)
                card.joker_display_values.start_count = card.joker_display_values.start_count or card.ability.extra.fives
            end,
        }
    end
}