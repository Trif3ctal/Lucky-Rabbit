SMODS.Joker {
    key = "assassin", -- 47
    atlas = "Jokers",
    pos = { x = 2, y = 7 },
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    cost = 4,
    calculate = function(self, card, context)
        if context.after and G.GAME.current_round.hands_left == 0 then
            local _card = G.hand.cards[1]
            if _card then
                SMODS.destroy_cards({ _card })
                return {
                    message = localize("k_fmod_destroyed")
                }
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "active" },
                { text = ")" },
            },
            calc_function = function(card)
                card.joker_display_values.active = G.GAME and G.GAME.current_round.hands_left <= 1 and
                    localize("jdis_active") or localize("jdis_inactive")
            end,
        }
    end
}