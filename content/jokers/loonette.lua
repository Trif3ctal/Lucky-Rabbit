SMODS.Joker {
    key = "loonette",
    config = {
        extra = {
            xmult = 1.5,
            xmult_base = 1.5,
            increase = 0.1
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_base, card.ability.extra.increase } }
    end,
    pools = {
        ["Fmod_Legendary"] = true,
    },
    rarity = 4,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 6, y = 3 },
    soul_pos = { x = 6, y = 4 },
    blueprint_compat = true,
    cost = 20,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_face() then
                card.ability.extra.xmult = card.ability.extra.xmult_base
            end
            if not context.other_card:is_face() and not SMODS.has_no_rank(context.other_card) then
                local xmult = card.ability.extra.xmult
                if not context.blueprint then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.increase
                end
                return {
                x_mult = xmult,
                card = card
                }
            end
        end
        if context.after and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult_base
        end
    end,
    in_pool = function (self, args)
        return not args or not args.source or args.source ~= 'sou'
    end
}