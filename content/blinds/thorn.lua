SMODS.Blind {
    key = "thorn",
    atlas = "Blinds",
    pos = { x = 0, y = 7 },
    discovered = false,
    boss = { min = 4 },
    boss_colour = HEX('747d45'),
    recalc_debuff = function(self, card, from_blind)
        if card.seal then
            return true
        end
    end
}