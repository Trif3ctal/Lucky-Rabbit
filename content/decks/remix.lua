if LR_CONFIG.remix_enabled then
    SMODS.Back {
        key = 'remix',
        atlas = 'Decks',
        pos = { x = 0, y = 3 },
        config = {
            vouchers = { 'v_fmod_grab_bag', 'v_fmod_gachapon' }
        },
        unlocked = true,
        discovered = false,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    localize {
                        type = "name_text",
                        set = "Voucher",
                        key = "v_fmod_grab_bag"
                    },
                    localize {
                        type = "name_text",
                        set = "Voucher",
                        key = "v_fmod_gachapon"
                    },
                }
            }
        end
    }
end