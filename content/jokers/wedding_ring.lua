SMODS.Joker{
    key = "wedding_ring",
    config = {
        extra = {
            rounds = 3,
            xmult = 3,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, math.max(0, card.ability.extra.rounds) } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 7, y = 9 },
    blueprint_compat = true,
    cost = 5,
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers and card.ability.extra.rounds > 0 and not context.blueprint then
            card.ability.extra.rounds = card.ability.extra.rounds - 1
        end
        if context.joker_main and card.ability.extra.rounds <= 0 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+" },
                { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.CHIPS },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.ability.extra",              ref_value = "uses" },
                { text = "/" },
                { ref_table = "card.ability.extra",              ref_value = "rounds" },
                { text = ")" },
            },
        }
    end,
}