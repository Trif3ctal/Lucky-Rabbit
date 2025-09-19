SMODS.Joker{
    key = "nerothefool",
    config = {
        extra = {
            cards_played = 2,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards_played } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 5, y = 0 },
    blueprint_compat = false,
    cost = 4,
    calculate = function(self, card, context)
        if context.destroy_card and (context.cardarea == G.play or context.cardarea == 'unscored') and #context.full_hand == 2 and G.GAME.current_round.hands_played == 0 and not context.blueprint then
            return {remove = true}
       end

        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end

    end
}