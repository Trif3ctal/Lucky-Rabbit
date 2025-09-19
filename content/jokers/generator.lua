SMODS.Joker{
    key = "generator",
    config = {
        extra = {
            retriggers = 1
        }
    },
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    pos = { x = 2, y = 0 },
    cost = 6,
    calculate = function(self, card, context)
        local destroyed = G.consumeables.cards[1]
        if context.setting_blind and G and G.consumeables and G.consumeables.cards and not context.blueprint then
            if destroyed then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        destroyed:start_dissolve()
                        card:juice_up()
                    return true end
                }))
                card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_fmod_fuel'), colour = G.C.RED } )
            end
            if not destroyed then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card:start_dissolve()
                        G.jokers:remove_card(card)
                        card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_fmod_drained'), colour = G.C.RED } )
                        card = nil
                    return true end
                }))
            end
        end
        if context.cardarea == G.play and context.repetition then
            return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.retriggers,
                    card = card
            }
        end
    end
}