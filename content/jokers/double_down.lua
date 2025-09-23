SMODS.Joker {
    key = "double_down",
    config = {
        extra = {
            repetitions = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.repetitions } }
    end,
    atlas = "Jokers",
    pos = { x = 0, y = 7 },
    pixel_size = { w = 57, h = 55 },
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    cost = 6,
    calculate = function(self, card, context)
        if context.individual and context.other_card.seal then
            if context.cardarea == G.play and context.other_card.seal == "Gold" then
                return {
                    card = context.other_card,
                    dollars = 3,
                }
            end
            if context.cardarea == G.hand and context.other_card.seal == "Blue" and context.end_of_round and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        if G.GAME.last_hand_played then
                            local _planet = nil
                            for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                                if v.config.hand_type == G.GAME.last_hand_played then
                                    _planet = v.key
                                end
                            end
                            if _planet then
                                SMODS.add_card({ key = _planet, area = G.consumeables })
                            end
                            G.GAME.consumeable_buffer = 0
                        end
                        return true
                    end)
                }))
                return { message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet, card = context.other_card }
            end
        end
    end,
}