SMODS.Blind {
    key = "dice",
    atlas = "Blinds",
    pos = { x = 0, y = 9 },
    discovered = false,
    boss = { min = 4 },
    boss_colour = HEX('90c7e6'),
    debuff = {
        old_prob = 1,
    },
    calculate = function(self, blind, context)
        if context.fix_probability and not blind.disabled then
            return {
                numerator = 0
            }
        end
    end
}
