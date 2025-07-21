SMODS.Voucher {
    key = "shopaholic",
    atlas = "Vouchers",
    pos = { x = 5, y = 1 },
    config = {
        extra = {
            slot = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.slot } }
    end,
    cost = 10,
    unlocked = true,
    available = true,
    requires = {"v_fmod_coupon", "v_fmod_extreme_couponing"},
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({func = function()
            SMODS.change_booster_limit(card.ability.extra.slot)
            local booster = G.shop_booster.cards[#G.shop_booster.cards]
            if booster then booster.ability.couponed = true end
            booster:set_cost()
        return true end}))
    end,
    calculate = function(self, card, context)
        if context.starting_shop then
            local booster = G.shop_booster.cards[#G.shop_booster.cards]
            if booster then booster.ability.couponed = true end
            booster:set_cost()
        end
    end
}