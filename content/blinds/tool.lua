SMODS.Blind {
    key = "tool",
    atlas = "Blinds",
    pos = { x = 0, y = 1 },
    discovered = false,
    boss = { min = 5 },
    boss_colour = HEX('9c6838'),
    recalc_debuff = function(self, card, from_blind)
        if card.area and card.area == G.consumeables then
            return true
        end
    end,
    set_blind = function(self)
        for i, k in ipairs(G.consumeables.cards) do
            k:juice_up(0.3, 0.5)
            SMODS.recalc_debuff(k)
        end
    end,
    defeat = function(self)
        for i, k in ipairs(G.consumeables.cards) do
            k:juice_up(0.3, 0.5)
            SMODS.recalc_debuff(k)
        end
    end,
    disable = function(self)
        for i, k in ipairs(G.consumeables.cards) do
            k:juice_up(0.3, 0.5)
            SMODS.recalc_debuff(k)
        end
    end
}