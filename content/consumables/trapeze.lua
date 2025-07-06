SMODS.Consumable {
    key = "trapeze",
    set = "Silly",
    config = {
        extra = {
            amount = 5,
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_soul
        info_queue[#info_queue+1] = G.P_CENTERS.c_fmod_soully
        if GB then info_queue[#info_queue+1] = G.P_CENTERS.c_gb_shatter end
        if MINTY then info_queue[#info_queue+1] = G.P_CENTERS.c_minty_wand end
        if next(SMODS.find_mod("VISIBILITY")) then info_queue[#info_queue+1] = G.P_CENTERS.c_vis_hamsa end
        return { vars = { G.GAME.trapeze_count, card.ability.extra.amount } }
    end,
    atlas = "Consumables",
    pos = {x = 6, y = 1 },
    cost = 5,
    use = function(self, card, context, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            card:juice_up(0.3, 0.5)
            G.GAME.trapeze_count = (G.GAME.trapeze_count or 0) + 1
            return true end }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end,
    set_ability = function(self, card, initial, delay_sprites)
        if G.GAME.trapeze_count == card.ability.extra.amount then
            local eval = function() return not card.REMOVED end
            juice_card_until(card, eval, true)
        end
    end
}