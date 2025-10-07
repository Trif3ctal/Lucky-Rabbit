SMODS.Joker {
    key = "fennex_the_clown",
    config = {
        extra = {
            scale = 1,
            xmult = 1,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.scale, card.ability.extra.xmult } }
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
        if context.buying_card and context.card.ability.set == 'Voucher' then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = 'xmult',
                scalar_value = 'scale',
                message_key = 'a_xmult',
            })
        end
        if context.cardarea == G.jokers and context.joker_main then
            if card.ability.extra.xmult > 1 then
                return {
                    xmult = card.ability.extra.xmult,
                    card = card
                }
            end
        end
    end,
    in_pool = function (self, args)
        return not args or not args.source or args.source ~= 'sou'
    end
}