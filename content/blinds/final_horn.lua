SMODS.Blind {
    key = "final_horn",
    atlas = "Blinds",
    pos = { x = 0, y = 12 },
    discovered = false,
    boss = { showdown = true, min = 16 },
    boss_colour = HEX('b57edc'),
    stay_flipped = function(self, area, card)
        if area == G.hand then return true end
    end
}

