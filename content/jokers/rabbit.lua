SMODS.Joker {
    key = "rabbit",
    rarity = 3,
    atlas = "Jokers",
    config = {
        extra = {
            max_times = 2,
            base = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.max_times,
                card.ability.extra.max_times - card.ability.extra.base
            }
        }
    end,
    unlocked = true,
    discovered = false,
    pos = { x = 8, y = 2 },
    blueprint_compat = true,
    cost = 8,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands["Five of a Kind"]) and card.ability.extra.base < card.ability.extra.max_times then
            G.E_MANAGER:add_event(Event({
                func =  function()
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local _card = copy_card(context.full_hand[1], nil, nil, G.playing_card)
                _card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, _card)
                G.hand:emplace(_card)
                _card.states.visible = nil
                _card:start_materialize()
                delay(0.2)
                draw_card(G.hand, G.discard, 90, "up", nil, _card)
                return true
            end
            }))
            card.ability.extra.base = card.ability.extra.base + 1
            return {
                message = localize('k_copied_ex'),
                colour = G.C.CHIPS,
                card = card,
                playing_cards_created = { true }
            }
        end
        if context.end_of_round and not context.blueprint then
            card.ability.extra.base = 0
        end
    end,
}