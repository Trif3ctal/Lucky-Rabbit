SMODS.Joker {
    key = "hypeman",
    config = {
        extra = {
            mult = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        local mult = 0
        if G.playing_cards then
            for i = 1, #G.playing_cards do
                if SMODS.has_enhancement(G.playing_cards[i], "m_mult") then
                    mult = mult + 1
                end
            end
        end
        info_queue[#info_queue+1] = G.P_CENTERS.m_mult
        return { vars = { card.ability.extra.mult, ((card.ability.extra.mult * mult) or 0) } }
    end,
    atlas = "Jokers",
    pos = { x = 6, y = 6 },
    rarity = 1,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    cost = 5,
    enhancement_gate = 'm_mult',
    calculate = function(self, card, context)
        if context.joker_main then
            local mult = 0
            for i = 1, #G.playing_cards do
                if SMODS.has_enhancement(G.playing_cards[i], "m_mult") then
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
                    if SMODS.has_enhancement(G.playing_cards[i], "m_mult") then
                        mult = mult + 1
                    end
                end
                card.joker_display_values.mult = (mult * card.ability.extra.mult) or 0
            end
        }
    end
}