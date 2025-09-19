SMODS.Joker {
    key = "friend_inside_me",
    rarity = 3,
    atlas = "Jokers",
    config = {
        extra = {
            copies = 6,
            used = false
        }
    },
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    pos = { x = 0, y = 6 },
    soul_pos = { x = 1, y = 6 },
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.copies } }
    end,
    calculate = function(self, card, context)
        if context.discard and not card.ability.extra.used and #context.full_hand == 1 and G.GAME.current_round.discards_used <= 0 and not context.blueprint then
            local cards = {}
            card.ability.extra.used = true
            for i = 1, card.ability.extra.copies do
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copy_card = copy_card(context.full_hand[1], nil, nil, G.playing_card)
                copy_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, copy_card)
                G.hand:emplace(copy_card)
                copy_card.states.visible = nil
                G.E_MANAGER:add_event(Event({
                    func = function()
                        copy_card:start_materialize()
                        return true
                    end
                }))
                copy_card.ability.lr_temp = true
                cards[i] = copy_card
            end
            return {
                remove = true,
                message = localize('k_copied_ex'),
                colour = G.C.CHIPS,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.calculate_context({ playing_card_added = true, cards = cards })
                            return true
                        end
                    }))
                end
            }
        end
        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.used = false
        end
    end
}