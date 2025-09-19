SMODS.Joker {
    key = 'litterbug',
    config = {
        extra = {
            mult = 1,
            base = 0.01,
            mult_gain = 0.01,
            discard = 1
        }
    },
    rarity = 2,
    atlas = 'Jokers',
    pos = { x = 8, y = 3 },
    discovered = false,
    blueprint_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.base, card.ability.extra.discard } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.mult > 1 then
            return {
                xmult = card.ability.extra.mult,
                card = card
            }
        end

        if context.press_play and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local any_selected = nil
                    local text = nil
                    local _cards = {}
                    for k, v in ipairs(G.hand.cards) do
                        _cards[#_cards + 1] = v
                    end
                    if G.hand.cards[1] then
                        local selected_card, card_key = pseudorandom_element(_cards, pseudoseed('litterbug'))
                        if not selected_card.debuff and not SMODS.has_no_rank(selected_card) then
                            card.ability.extra.mult_gain = (0.01 * selected_card.base.nominal)
                            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                            text = true
                        end
                        G.hand:add_to_highlighted(selected_card, true)
                        table.remove(_cards, card_key)
                        any_selected = true
                        play_sound('card1', 1)
                    end
                    delay(0.7)
                    if text then
                        card_eval_status_text(card, "extra", nil, nil, nil, {
                            message = localize { type = "variable", key = "a_xmult", vars = { card.ability.extra.mult } },
                            colour = G.C.MULT,
                            card = card
                        })
                    end
                    if any_selected then G.FUNCS.discard_cards_from_highlighted(nil, true) end
                    return true
                end
            }))
        end
    end
}
