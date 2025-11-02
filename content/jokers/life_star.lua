SMODS.Joker {
    key = "life_star",
    atlas = "Jokers",
    pos = { x = 4, y = 8 },
    rarity = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    config = {
        extra = {
            blind_mult = 0.1,
            current = 0
        }
    },
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.blind_mult,
                card.ability.extra.current + 1
            }
        }
    end,
    calculate = function(self, card, context)
        if context.remove_playing_cards then
            local bp = context.blueprint_card
            for _, removed_card in ipairs(context.removed) do
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copy_card = copy_card(removed_card, nil, nil, G.playing_card)
                copy_card:set_edition(poll_edition('fmod_lifestar_card', nil, true, true))
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
                if not context.blueprint then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "current",
                        scalar_value = "blind_mult",
                        no_message = true
                    })
                    G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling + card.ability.extra.current
                    G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante) * G.GAME.blind.mult * G.GAME.starting_params.ante_scaling
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                end
            end
        end
        if context.joker_type_destroyed and context.card.ability.set == 'Joker' and #G.jokers.cards < G.jokers.config.card_limit and not context.card.skip_destroy_animation then
            local bp = context.blueprint_card
            local removed_card = context.card
            G.E_MANAGER:add_event(Event({
                func = function()
                    local copied_card = copy_card(removed_card, nil, nil)
                    copied_card:set_edition(poll_edition('fmod_lifestar_joker', nil, nil, true))
                    copied_card:start_materialize()
                    copied_card:add_to_deck()
                    G.jokers:emplace(copied_card)
                    return true
                end
            }))
            SMODS.calculate_effect({
                message = localize('k_copied_ex'),
                colour = G.C.CHIPS,
            }, bp or card)
            if not context.blueprint then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "current",
                    scalar_value = "blind_mult",
                    no_message = true
                })
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling + card.ability.extra.blind_mult
                G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.blind.mult*G.GAME.starting_params.ante_scaling
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            end
        end
    end
}