SMODS.Joker{
    key = "fennex",
    config = {
        extra = {
            total_rerolls = 10,
            rerolls = 10
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.total_rerolls, (card.ability.extra.rerolls or 10) } }
    end,
    rarity = 1,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 0, y = 0 },
    cost = 4,
    blueprint_compat = false,
    calculate = function(self, card, context)
        if context.reroll_shop and not context.blueprint then
            card.ability.extra.rerolls = card.ability.extra.rerolls - 1
        end
        if card.ability.extra.rerolls == 0 and not context.blueprint then
            G.GAME.current_round.voucher_2 = get_next_voucher_key()
            G.shop_vouchers.config.card_limit = G.shop_vouchers.config.card_limit + 1
            if G.GAME.current_round.voucher_2 and G.P_CENTERS[G.GAME.current_round.voucher_2] then
                local voucher = Card(G.shop_vouchers.T.x + G.shop_vouchers.T.w/2,
                G.shop_vouchers.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS[G.GAME.current_round.voucher_2],{bypass_discovery_center = true, bypass_discovery_ui = true})
                voucher.shop_voucher = true
                create_shop_card_ui(voucher, 'Voucher', G.shop_vouchers)
                voucher:start_materialize()
                card:juice_up(0.5, 0.5)
                G.shop_vouchers:emplace(voucher)
            end
            card.ability.extra.rerolls = 10
        end
    end
}