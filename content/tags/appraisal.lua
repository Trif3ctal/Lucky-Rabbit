SMODS.Tag {
    key = "appraisal",
    atlas = "Tags",
    pos = { x = 3, y = 0 },
    min_ante = 2,
    config = {
        type = "immediate",
        money = 2,
        tally = 0
    },
    discovered = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.money, (self.config.money * (LR_UTIL.get_enhanced() or '0')) } }
    end,
    apply = function(self, tag, context)
        if context.type == self.config.type then
            tag:yep('+', G.C.MONEY,function()
                return true
            end)
            ease_dollars(self.config.money * LR_UTIL.get_enhanced())
            tag.triggered = true
            return true
        end
    end
}

LR_UTIL.get_enhanced = function()
    local amt = 0
    if G.playing_cards then
        for k, v in pairs(G.playing_cards) do
            if next(SMODS.get_enhancements(v)) then amt = amt + 1 end
        end
    return amt
    end
end