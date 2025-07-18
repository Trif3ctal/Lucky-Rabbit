SMODS.Consumable {
    key = "rodeo",
    set = "Silly",
    config = {
        max_highlighted = 2,
        min_highlighted = 2,
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_foil
        info_queue[#info_queue+1] = G.P_CENTERS.e_holo
        info_queue[#info_queue+1] = G.P_CENTERS.e_polychrome
        return { vars = { card.ability.max_highlighted } }
    end,
    atlas = "Consumables",
    pos = { x = 5, y = 1 },
    cost = 5,
    use = function(self, card, context, copier)
        local cards = {}
        for i = 1, #G.hand.highlighted do
            cards[i] = G.hand.highlighted[i]
        end
        local destroy_card = pseudorandom_element(cards, pseudoseed('rodeo'))
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
        return true end }))
        for i = 1, #G.hand.highlighted do
            -- adapted from vanilla code, so sorry for the mess
            if G.hand.highlighted[i] ~= destroy_card then
                local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                return true end }))
                delay(0.6)
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                    G.hand.highlighted[i]:set_edition(poll_edition('rodeo', nil, true, true, { 'e_polychrome', 'e_holo', 'e_foil' }), nil, true)
                return true end }))
                local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                return true end }))
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() 
                    G.hand:unhighlight_all()
                return true end }))
            end
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                local d_card = destroy_card
                if d_card.ability.name == 'Glass Card' then
                    d_card:shatter()
                else
                    d_card:start_dissolve(nil)
                end
                return true
            end
        }))
        delay(0.6)
        SMODS.calculate_context({ remove_playing_cards = true, removed = {destroy_card} })
    end,
}