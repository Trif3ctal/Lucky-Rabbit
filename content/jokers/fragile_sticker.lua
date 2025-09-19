SMODS.Enhancement:take_ownership('m_glass', {
    calculate = function(self, card, context)
        if next(SMODS.find_card("j_fmod_fragile_sticker")) then
            return nil
        end
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and SMODS.pseudorandom_probability(card, 'glass', 1, card.ability.extra) then
            card.glass_trigger = true
            return { remove = true }
        end
    end,
},
true)

SMODS.Joker {
    key = "fragile_sticker",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
    end,
    rarity = 3,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    pos = { x = 0, y = 1 },
    cost = 8,
    enhancement_gate = "m_glass"
}