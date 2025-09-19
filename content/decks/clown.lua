if LR_CONFIG.silly_enabled then
    SMODS.Back {
        key = 'clown',
        atlas = 'Decks',
        pos = { x = 0, y = 1 },
        config = {
            voucher = 'v_fmod_circus'
        },
        unlocked = true,
        discovered = false,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    localize {
                        type = "name_text",
                        set = "Voucher",
                        key = "v_fmod_circus"
                    },
                    colours = { HEX("ff98e2") }
                }
            }
        end
    }
end
