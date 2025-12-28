SMODS.Joker {
    key = "metal_face_villain",
    config = {
        extra = {
            mult = 1.5
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_steel
        return { vars = { card.ability.extra.mult } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 6, y = 10 },
    blueprint_compat = true,
    cost = 7,
    calculate = function(self, card, context)
        if context.individual and SMODS.has_enhancement(context.other_card, "m_steel") and not SMODS.has_no_rank(context.other_card) and context.cardarea == G.play then
            return {
                mult = context.other_card.base.nominal * card.ability.extra.mult,
                card = context.other_card
            }
        end
    end,
}