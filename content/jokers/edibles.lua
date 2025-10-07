SMODS.Joker {
    key = "edibles",
    config = {
        extra = {
            uses = 5,
            sub = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.uses } }
    end,
    atlas = "Jokers",
    pos = { x = 1, y = 7 },
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    cost = 7,
    calculate = function(self, card, context)
        if context.after and next(context.poker_hands["Four of a Kind"]) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #context.scoring_hand do
                local percent = 1.15 - (i - 0.999) / (#context.scoring_hand - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        context.scoring_hand[i]:flip()
                        play_sound('card1', percent)
                        context.scoring_hand[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #context.scoring_hand do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        -- SMODS.modify_rank will increment/decrement a given card's rank by a given amount
                        assert(SMODS.modify_rank(context.scoring_hand[i], 1))
                        return true
                    end
                }))
            end
            for i = 1, #context.scoring_hand do
                local percent = 0.85 + (i - 0.999) / (#context.scoring_hand - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        context.scoring_hand[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        context.scoring_hand[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            if card.ability.extra.uses - 1 <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.destroy_cards(card, nil, nil, true)
                        return true
                    end
                }))
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.RED
                }
            else
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        SMODS.scale_card(card, {
                            operation = '-',
                            ref_table = card.ability.extra,
                            ref_value = 'uses',
                            scalar_value = 'sub',
                            message_key = 'a_fmod_uses',
                            message_colour = G.C.RED
                        })
                        return true
                    end
                }))
            end
        end
    end,
}