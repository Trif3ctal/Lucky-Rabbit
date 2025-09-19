SMODS.Joker {
    key = "fennex_the_clown",
    config = {
        extra = {
            xmult = 1,
            total = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, 1 + (card.ability.extra.xmult * LR_UTIL.num_vouchers()) } }
    end,
    pools = {
        ["Fmod_Legendary"] = true,
    },
    rarity = 4,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 7, y = 3 },
    soul_pos = { x = 7, y = 4 },
    blueprint_compat = true,
    cost = 20,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            local count = LR_UTIL.num_vouchers()
            if count > 0 then
                card.ability.extra.total = card.ability.extra.xmult + count
                return {
                    xmult = card.ability.extra.total,
                    card = card
                }
            end
        end
    end,
    in_pool = function (self, args)
        return not args or not args.source or args.source ~= 'sou'
    end
}