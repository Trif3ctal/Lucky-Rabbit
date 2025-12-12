SMODS.Joker {
    key = "sleazy_joker",
    config = {
        extra = {
            mult = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        local mult = 0
        if G.playing_cards then
            for i = 1, #G.playing_cards do
                if LR_UTIL.has_marking(G.playing_cards[i]) then
                    mult = mult + 1
                end
            end
        end
        return { vars = { card.ability.extra.mult, ((card.ability.extra.mult * mult) or 0) } }
    end,
    atlas = "Jokers",
    pos = { x = 3, y = 9 },
    rarity = 1,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    cost = 5,
    calculate = function(self, card, context)
        if context.joker_main then
            local mult = 0
            for i = 1, #G.playing_cards do
                if LR_UTIL.has_marking(G.playing_cards[i]) then
                    mult = mult + 1
                end
            end
            if mult > 0 then
                return {
                    mult = card.ability.extra.mult * mult
                }
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.MULT },
            calc_function = function(card)
                local mult = 0
                for i = 1, #G.playing_cards do
                    if LR_UTIL.has_marking(G.playing_cards[i]) then
                        mult = mult + 1
                    end
                end
                card.joker_display_values.mult = (mult * card.ability.extra.mult) or 0
            end
        }
    end
}