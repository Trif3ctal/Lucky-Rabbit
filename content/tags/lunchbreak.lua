SMODS.Tag {
    key = "lunchbreak",
    atlas = "Tags",
    pos = { x = 1, y = 0 },
    config = {
        type = "immediate",
    },
    discovered = false,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_negative
    end,
    apply = function(self, tag, context)
        if context.type == self.config.type then
            tag:yep('+', G.C.GREEN, function()
                local key = LR_UTIL.get_food_jokers('lunchbreak')
                SMODS.add_card({set = 'Joker', key = key, edition = 'e_negative'})
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}
