SMODS.Joker {
    key = "pub_burger",
    config = {
        extra = {
            discards = 5,
            discard_mod = 1,
            base_discard = 3
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.discards, card.ability.extra.discard_mod } }
    end,
    rarity = 3,
    atlas = "Jokers",
    pools = {
        Food = true
    },
    unlocked = true,
    discovered = false,
    pos = { x = 6, y = 1 },
    blueprint_compat = false,
    eternal_compat = false,
    cost = 6,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.base_discard = G.GAME.round_resets.discards
        G.E_MANAGER:add_event(Event({func = function()
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
            ease_discard((card.ability.extra.discards), nil, false)
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_fmod_discards', vars = {card.ability.extra.discards}}})
        return true end }))
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
            G.GAME.round_resets.discards = card.ability.extra.base_discard
            ease_discard(-(card.ability.extra.discards), nil, false)
        return true end }))
    end,
    calculate = function(self, card, context)
        if context.before and G.GAME.current_round.hands_played > 0 then
            if card.ability.extra.discards - card.ability.extra.discard_mod <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                return true; end}))
                        return true
                    end
                }))
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.RED
                }
            else
                card.ability.extra.discards = card.ability.extra.discards - card.ability.extra.discard_mod
                G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard_mod
                ease_discard(-(card.ability.extra.discard_mod), nil, false)
                return {
                    message = localize{type='variable',key='a_chips_minus',vars={card.ability.extra.discard_mod}},
                    colour = G.C.RED
                }
            end
        end
    end
}