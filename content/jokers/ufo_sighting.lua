SMODS.Joker {
    key = "ufo_sighting",
    config = {
        extra = {
            dollars = 4
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 2, y = 9 },
    blueprint_compat = true,
    cost = 5,
    calculate = function(self, card, context)
        if context.before and G.GAME.dollars <= to_big(card.ability.extra.dollars) and G.GAME.current_round.hands_played == 0 then
            return {
                level_up = true,
                message = localize('k_level_up_ex')
            }
        end
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES and G.GAME.dollars <= to_big(card.ability.extra.dollars) end
            juice_card_until(card, eval, true)
        end
    end,
}