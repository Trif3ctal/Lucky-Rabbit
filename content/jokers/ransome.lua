SMODS.Joker {
    key = "ransome",
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    atlas = "Jokers",
    pools = {
        ["Fmod_Legendary"] = true,
    },
    pos = { x = 5, y = 3 },
    soul_pos = { x = 5, y = 4 },
    calculate = function(self, card, context)
        if context.remove_playing_cards then
            local bp = context.blueprint_card
            for _, removed_card in ipairs(context.removed) do
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copy_card = copy_card(removed_card, nil, nil, G.playing_card)
                copy_card:set_edition("e_polychrome")
                copy_card:set_seal("Red", nil, true)
                copy_card:add_to_deck()
                table.insert(G.playing_cards, copy_card)
                copy_card.states.visible = nil
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        G.hand:emplace(copy_card)
                        copy_card:start_materialize()
                        return true
                    end
                }))
                SMODS.calculate_effect({
                    message = localize('k_copied_ex'),
                    colour = G.C.CHIPS,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.calculate_context({ playing_card_added = true, cards = { copy_card } })
                                return true
                            end
                        }))
                    end
                }, bp or card)
            end
        end
    end,
}