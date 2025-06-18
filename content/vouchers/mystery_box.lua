if LR_CONFIG and LR_CONFIG.remix_enabled then
    SMODS.Voucher {
        key = "mystery_box",
        atlas = "Vouchers",
        config = {
            extra = {
                slot = 1
            }
        },
        pos = { x = 2, y = 2 },
        cost = 10,
        unlocked = true,
        available = true,
        requires = { "v_fmod_grab_bag", "v_fmod_gachapon" },
        loc_vars = function(self, info_queue, card)
            return { vars = {} }
        end,
        redeem = function(self, card)
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.change_booster_limit(card.ability.extra.slot)
                    return true
                end
            }))
        end
    }
end
