if LR_CONFIG.silly_enabled then
    SMODS.Voucher {
        key = "showtime",
        atlas = "Vouchers",
        config = {
            extra = {
                rate = 4
            }
        },
        pos = { x = 0, y = 1 },
        cost = 10,
        unlocked = true,
        available = true,
        requires = { "v_fmod_circus" },
        loc_vars = function(self, info_queue, card)
            return { vars = { colours = { HEX("ff98e2") } } }
        end,
        redeem = function(self, card)
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.silly_rate = card.ability.extra.rate
                    return true
                end
            }))
        end
    }
end
