SMODS.Consumable {
    key = "tightrope",
    set = "Silly",
    config = {
        max_highlighted = 1,
        extra = {
            copy_1_amt = 1,
            copy_2_amt = 2,
            destroy_amt = 1,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.copy_1_amt, card.ability.max_highlighted, card.ability.extra.copy_2_amt } }
    end,
    atlas = "Consumables",
    pos = { x = 1, y = 1 },
    cost = 3,
    use = function(self, card, context, copier)
        local pseudo = pseudorandom(pseudoseed('tightrope'))
        if pseudo <= 0.5 then
            -- 50% chance to copy once
            local new_cards = {}
            for k = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local _first_dissolve = nil
                        for i = 1, card.ability.extra.copy_1_amt do
                            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                            local _card = copy_card(G.hand.highlighted[k], nil, nil, G.playing_card)
                            _card:add_to_deck()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            table.insert(G.playing_cards, _card)
                            G.hand:emplace(_card)
                            _card:start_materialize(nil, _first_dissolve)
                            _first_dissolve = true
                            new_cards[#new_cards + 1] = _card
                        end
                        return true
                    end
                }))
            end
            playing_card_joker_effects(new_cards)
        elseif pseudo <= 0.75 then
            -- 25% chance to copy twice
            local new_cards = {}
            for k = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local _first_dissolve = nil
                        for i = 1, card.ability.extra.copy_2_amt do
                            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                            local _card = copy_card(G.hand.highlighted[k], nil, nil, G.playing_card)
                            _card:add_to_deck()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            table.insert(G.playing_cards, _card)
                            G.hand:emplace(_card)
                            _card:start_materialize(nil, _first_dissolve)
                            _first_dissolve = true
                            new_cards[#new_cards + 1] = _card
                        end
                        return true
                    end
                }))
                playing_card_joker_effects(new_cards)
            end
        else
            -- 25% chance to destroy the card
            local destroyed = {}
            for i = 1, #G.hand.highlighted do
                local destroy_card = G.hand.highlighted[i]
                destroyed[#destroyed + 1] = destroy_card
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('tarot1')
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
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
                SMODS.calculate_context({ remove_playing_cards = true, removed = destroyed })
            end
        end
    end,
}
