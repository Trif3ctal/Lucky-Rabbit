LR_UTIL.Marking {
    key = "gilded_mark",
    atlas = "Decks",
    pos = { x = 0, y = 2 },
    badge_colour = HEX('efbf6f'),
    calculate = function(self, card, context)
        local previous = SMODS.get_previous_context()
        if context.mod_probability and (context.trigger_obj == card or (previous and previous.other_card == card)) then
            return {
                numerator = context.numerator * 2
            }
        end
    end
}