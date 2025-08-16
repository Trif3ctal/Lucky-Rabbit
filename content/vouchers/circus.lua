if LR_CONFIG.silly_enabled then
    SMODS.Voucher {
        key = "circus",
        atlas = "Vouchers",
        pos = { x = 0, y = 0 },
        cost = 10,
        unlocked = true,
        available = true,
        loc_vars = function(self, info_queue, card)
            return { vars = { colours = { HEX("ff98e2") } } }
        end,
    }
end
