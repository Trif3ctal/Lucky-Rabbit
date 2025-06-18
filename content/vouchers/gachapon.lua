if LR_CONFIG and LR_CONFIG.remix_enabled then
    SMODS.Voucher {
        key = "gachapon",
        atlas = "Vouchers",
        config = {
            extra = {
                s_rate = 0.75,
                m_rate = 0.19
            }
        },
        pos = { x = 1, y = 2 },
        cost = 10,
        unlocked = true,
        available = true,
        requires = { "v_fmod_grab_bag" },
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS.p_fmod_remix_small_1
            return { vars = {} }
        end,
        redeem = function(self, card)
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.P_CENTERS.p_fmod_remix_small_1.weight = card.ability.extra.s_rate
                    G.P_CENTERS.p_fmod_remix_small_2.weight = card.ability.extra.s_rate
                    G.P_CENTERS.p_fmod_remix_jumbo.weight = card.ability.extra.s_rate
                    G.P_CENTERS.p_fmod_remix_mega.weight = card.ability.extra.m_rate
                    return true
                end
            }))
        end
    }
end
