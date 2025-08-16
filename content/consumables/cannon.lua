if LR_CONFIG.markings_enabled then
    SMODS.Consumable {
        key = "cannon",
        set = "Silly",
        config = {
            max_highlighted = 2,
        },
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = LR_UTIL.marking_tooltip("pinhole")
            return { vars = { card.ability.max_highlighted } }
        end,
        atlas = "Consumables",
        pos = { x = 2, y = 1 },
        cost = 5,
        use = function(self, card, context, copier)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({ trigger = 'after', delay = 0.15, func = function()
                    G.hand.highlighted[i]:flip(); play_sound('card1', percent); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true
                end }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        LR_UTIL.set_marking(G.hand.highlighted[i], 'pinhole')
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({ trigger = 'after', delay = 0.15, func = function()
                    G.hand.highlighted[i]:flip(); play_sound('tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3,
                        0.3); return true
                end }))
            end
            G.E_MANAGER:add_event(Event({ trigger = 'after', delay = 0.2, func = function()
                update_hand_text({ immediate = true, nopulse = true, delay = 0 },
                    { mult = 0, chips = 0, level = '', handname = '' }); G.hand:unhighlight_all(); return true
            end }))
            delay(0.5)
        end,
    }
end
