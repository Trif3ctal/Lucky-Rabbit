SMODS.Joker {
    key = "ghostly_joker",
    rarity = 2,
    atlas = "Jokers",
    config = {
        extra = {
            fours = 4,
        }
    },
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    pos = { x = 3, y = 6 },
    soul_pos = { x = 4, y = 6,
        draw = function(card, scale_mod, rotate_mod)
            local _scale_mod = 0.1 + 0.05*math.sin(1.8*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*11)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
            local _rotate_mod = 0.1*math.sin(0.6*G.TIMERS.REAL) + 0.00*math.sin((G.TIMERS.REAL)*math.pi*2)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2

            card.children.floating_sprite.role.draw_major = card
            card.children.floating_sprite:draw_shader('dissolve',0, nil, nil, card.children.center, _scale_mod, _rotate_mod,nil, 0.1 + 0.03*math.sin(1.8*G.TIMERS.REAL),nil, 0.6)
            card.children.floating_sprite:draw_shader('dissolve', nil, nil, nil, card.children.center, _scale_mod, _rotate_mod)
        end,
    },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_death
        return { vars = { card.ability.extra.fours } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint and context.other_card:get_id() == 4 then
            if card.ability.extra.fours - 1 <= 0 and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                card.ability.extra.fours = 4
                return {
                    extra = {
                        message = localize('k_plus_tarot'),
                        message_card = card,
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    SMODS.add_card { set = 'Tarot', key = 'c_death' }
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                        end
                    },
                }
            else
                card.ability.extra.fours = card.ability.extra.fours - 1
            end
        end
    end
}