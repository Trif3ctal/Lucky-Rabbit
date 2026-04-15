SMODS.Joker {
    key = "moments_of_happiness",
    atlas = "Jokers",
    pos = { x = 5, y = 10 },
    config = {
        extra = {
            highest = "High Card",
            card_amt = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { colours = { HEX("ff98e2") } } }
    end,
    rarity = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    cost = 8,
    calculate = function(self, card, context)
        if context.before then
            local _handname, _levels, _order = 'High Card', -1, 100
            for k, v in pairs(G.GAME.hands) do
                if (v.level > _levels or (v.played == _levels and _order > v.order)) then
                    _levels = v.level
                    _handname = k
                    card.ability.extra.highest = G.GAME.hands[_handname]
                end
            end
            if context.scoring_name ~= _handname and card.ability.extra.highest.level >= G.GAME.hands[context.scoring_name].level
            and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                local bp = context.blueprint_card
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
            end
        end
    end,
}