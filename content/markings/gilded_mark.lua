LR_UTIL.Marking {
    key = "gilded_mark",
    atlas = "Decks",
    pos = { x = 1, y = 2 },
    badge_colour = HEX('efbf6f'),
    calculate = function(self, card, context)
        if context.mod_probability and context.trigger_obj == card then
            return {
                numerator = context.numerator * 2
            }
        end
    end
}