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
        if context.setting_blind and G.consumeables.cards and not context.blueprint then
            local destroyed = G.consumeables.cards[1]
            if destroyed then
                SMODS.destroy_cards(destroyed)
                return {
                    message = localize('k_fmod_fuel'),
                    colour = G.C.RED
                }
            else
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_fmod_drained'),
                    colour = G.C.RED
                }
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