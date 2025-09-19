SMODS.Blind {
    key = "baby",
    atlas = "Blinds",
    pos = { x = 0, y = 2 },
    discovered = false,
    boss = { min = 2 },
    boss_colour = HEX('ffc0cb'),
    stay_flipped = function(self, area, card)
        if next(SMODS.get_enhancements(card)) and area == G.hand then
            return true
        end
    end
}