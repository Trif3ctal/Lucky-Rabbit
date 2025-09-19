SMODS.Tag({
    key = "boost",
    atlas = "Tags",
    pos = { x = 2, y = 0 },
    config = {
    },
    discovered = false,
    apply = function(self, tag, context)
        if context.type == 'voucher_add' then
            tag:yep('+', G.C.BOOSTER, function()
                for i = 1, 2 do
                    SMODS.add_booster_to_shop()
                    local booster = G.shop_booster.cards[#G.shop_booster.cards]
                    if booster then booster.ability.couponed = true end
                    booster:set_cost()
                end
                return true
            end)
            self.triggered = true
        end
    end,
})