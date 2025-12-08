SMODS.Joker {
    key = "defenestration",
    config = {
        extra = {
            mult = 30
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult} }
    end,
    rarity = 1,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 5, y = 9 },
    soul_pos = { x = 6, y = 9 },
    blueprint_compat = true,
    cost = 5,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.blind and G.GAME.blind.boss then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            reminder_text = {
                { ref_table = "card.joker_display_values", ref_value = "active_text" },
            },
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.MULT },
            calc_function = function(card)
                local boss = G.GAME and G.GAME.blind and G.GAME.blind.get_type and (G.GAME.blind:get_type() == 'Boss')
                card.joker_display_values.mult = boss and card.ability.extra.mult or 0
                card.joker_display_values.active = boss
                card.joker_display_values.active_text = localize(boss and 'k_active' or 'ph_no_boss_active')
            end,
            style_function = function(card, text, reminder_text, extra)
                if reminder_text and reminder_text.children[1] then
                    reminder_text.children[1].config.colour = card.joker_display_values.active and G.C.GREEN or G.C.RED
                    reminder_text.children[1].config.scale = card.joker_display_values.active and 0.35 or 0.3
                    return true
                end
                return false
            end
        }
    end
}