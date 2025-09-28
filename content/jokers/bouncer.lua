SMODS.Joker {
    key = "bouncer",
    config = {
        extra = {
        }
    },
    atlas = "Jokers",
    pos = { x = 6, y = 7 },
    rarity = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    cost = 10,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.common_mod_old = G.GAME.common_mod
        G.GAME.common_mod = 0
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.common_mod = G.GAME.common_mod_old or 1
        G.GAME.common_mod_old = nil
    end
}