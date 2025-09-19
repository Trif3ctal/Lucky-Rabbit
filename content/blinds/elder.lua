SMODS.Blind {
    key = "elder",
    atlas = "Blinds",
    pos = { x = 0, y = 8 },
    discovered = false,
    boss = { min = 6 },
    boss_colour = HEX('dbbc99'),
    stay_flipped = function(self, area, card)
        if not next(SMODS.get_enhancements(card)) and area == G.hand then
            return true
        end
    end
}