SMODS.Joker {
    key = "trans_joker",
    config = {
        extra = {
            mult = 5
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, colours = {HEX("ff98e2"), HEX("5bcefa") }  },  }
    end,
    atlas = "Jokers",
    pos = { x = 1, y = 3 },
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    cost = 5,
}