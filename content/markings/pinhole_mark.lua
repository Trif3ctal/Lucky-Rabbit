LR_UTIL.Marking {
    key = "pinhole_mark",
    atlas = "Decks",
    pos = { x = 1, y = 0 },
    badge_colour = HEX('4f6367'),
    calculate = function(self, card, context)
        if context.stay_flipped and context.from_area == G.play and context.to_area == G.discard then
            return { modify = { to_area = G.deck } }
        end
    end,
}
