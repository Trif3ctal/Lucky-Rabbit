SMODS.Blind {
    key = "tool",
    atlas = "Blinds",
    pos = { x = 0, y = 1 },
    discovered = false,
    boss = { min = 5 },
    boss_colour = HEX('9c6838'),
    set_blind = function(self)
        for i, k in ipairs(G.consumeables.cards) do
            k:juice_up(0.3, 0.5)
            k:set_debuff(true)
        end
    end,
    defeat = function (self)
        for i, k in ipairs(G.consumeables.cards) do
            k:juice_up(0.3, 0.5)
            k:set_debuff(false)
        end
    end,
    disable = function (self)
        for i, k in ipairs(G.consumeables.cards) do
            k:juice_up(0.3, 0.5)
            k:set_debuff(false)
        end
    end
}