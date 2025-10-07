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
}