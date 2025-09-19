if LR_CONFIG.enhancements_enabled then
    SMODS.Joker {
        key = "free_shipping",
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS.m_fmod_raffle_card
            info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
            return { vars = {} }
        end,
        rarity = 2,
        atlas = "Jokers",
        unlocked = true,
        discovered = false,
        blueprint_compat = false,
        pos = { x = 4, y = 5 },
        cost = 5,
        enhancement_gate = "m_fmod_raffle_card"
    }
end