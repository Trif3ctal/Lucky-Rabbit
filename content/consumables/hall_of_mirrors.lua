if LR_CONFIG and LR_CONFIG.enhancements_enabled then
    SMODS.Consumable {
        key = "hall_of_mirrors",
        set = "Silly",
        config = {
            max_highlighted = 2,
            mod_conv = "m_fmod_copycat_card",
        },
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS.m_fmod_copycat_card
            return { vars = { card.ability.max_highlighted } }
        end,
        atlas = "Consumables",
        pos = { x = 6, y = 2 },
        cost = 3,
    }
end
