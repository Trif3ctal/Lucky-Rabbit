SMODS.Consumable {
    key = "crisis",
    set = "Silly",
    config = {
    },
    atlas = "Consumables",
    pos = { x = 1, y = 2 },
    cost = 10,
    hidden = true,
    loc_vars = function (self, info_queue, card)
        if card.area.config.type == "title" then
            return {
                key = self.key .. "_col"
            }
        end
    end,
    set_ability = function(self, card, initial, delay_sprites)
        if G.STATE == G.STATES.SMODS_BOOSTER_OPENED then
            ease_background_colour{new_colour = HEX('c93930'), special_colour = G.C.BLACK, contrast = 1}
            local eval = function()
                return true
            end
            juice_card_until(card, eval, nil, 0.9)
        end
    end,
    update = function(self, card, dt)
        if G.STATE == G.STATES.SMODS_BOOSTER_OPENED then
            G.PITCH_MOD = (G.PITCH_MOD or 1)*(1 - dt) + dt*((not G.normal_music_speed and G.STATE == G.STATES.GAME_OVER) and 0.5 or 0.70)
        end
    end,
    use = function(self, card, context)
        local minus = -G.GAME.round_resets.ante + 1
        ease_ante(minus)
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + minus
        card:juice_up(0.3, 0.5)
        delay(0.5)
        ease_background_colour{new_colour = G.C.BLIND['Small'], contrast = 1}
        G.PITCH_MOD = 1
    end,
    can_use = function(self, card)
        return G.GAME.round_resets.ante > 1
    end,
    in_pool = function (self, args)
        return G.GAME.round_resets.ante > 1
    end
}
