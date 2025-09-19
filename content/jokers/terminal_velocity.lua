SMODS.Joker {
    key = "terminal_velocity",
    config = {
        extra = {
            perma_xmult = 0.02
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        return { vars = { card.ability.extra.perma_xmult } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 4, y = 2 },
    soul_pos = { x = 1, y = 4 },
    blueprint_compat = true,
    cost = 6,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_wild') then
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + card.ability.extra.perma_xmult
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS },
                    card = card
                }
            end
        end
    end,
    enhancement_gate = "m_wild",
}