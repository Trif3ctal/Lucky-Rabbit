if LR_CONFIG.silly_enabled then
    SMODS.Joker {
        key = "sad_clown",
        config = {
            extra = {
                discards = 15,
                discards_remaining = 15,
                card_amt = 1
            }
        },
        loc_vars = function(self, info_queue, card)
            return { vars = { card.ability.extra.discards, card.ability.extra.discards_remaining, colours = { HEX("ff98e2") } } }
        end,
        rarity = 1,
        atlas = "Jokers",
        unlocked = true,
        discovered = false,
        pos = { x = 0, y = 4 },
        blueprint_compat = true,
        cost = 4,
        calculate = function(self, card, context)
            if context.discard then
                if card.ability.extra.discards_remaining <= 1 then
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        local bp = context.blueprint_card
                        if not context.blueprint then
                            card.ability.extra.discards_remaining = card.ability.extra.discards
                        end
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        play_sound('timpani')
                                        SMODS.add_card({ set = "Silly", area = G.consumeables, key_append = "cln" })
                                        G.GAME.consumeable_buffer = 0
                                        return true
                                    end
                                }))
                                SMODS.calculate_effect({
                                    message = localize({ type = "variable", key = "a_fmod_silly_card", vars = { card.ability.extra.card_amt } }),
                                    colour = HEX("ff98e2"),
                                }, bp or card)
                                return true
                            end
                        }))
                    end
                elseif not context.blueprint then
                    card.ability.extra.discards_remaining = card.ability.extra.discards_remaining - 1
                    return nil, true
                end
            end
        end,
    }
end
