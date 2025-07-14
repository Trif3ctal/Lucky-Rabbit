SMODS.Enhancement {
    key = "raffle_card",
    atlas = "Decks",
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            odds = 5,
        }
    },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'fmod_raffle')
        return { vars = { numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local free = nil
            local silly = nil
            if next(SMODS.find_card('j_fmod_free_shipping')) then
                free = 'e_negative'
            end
            if next(SMODS.find_card('j_fmod_comic_book_ad')) then
                silly = true
            end
            if SMODS.pseudorandom_probability(card, 'raffle_cons', 1, card.ability.extra.odds, 'fmod_raffle') and (free or (#G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit)) then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                local selected = ""
                local passed = false
                local tries = 50
                while tries > 0 and not passed do -- modified from a cryptid function, could easily be absolute garbage
                    tries = tries - 1
                    passed = false
                    local key = ""
                    if not silly then
                        key = pseudorandom_element(G.P_CENTER_POOLS.Consumeables, pseudoseed("raffle_cons")).key
                    else
                        key = pseudorandom_element(G.P_CENTER_POOLS.Silly, pseudoseed("raffle_cons")).key
                    end
                    selected = G.P_CENTERS[key]
                    if not (selected["hidden"] or (G.GAME and G.GAME["hidden"] and G.GAME["hidden"][selected]) or false) then
                        passed = true
                    end
                    if passed or tries <= 0 then
                        if tries <= 0 then
                            selected = "c_strength"
                        else
                            selected = selected
                        end
                    end
                end
                G.E_MANAGER:add_event(Event({
                    delay = 0.3,
                    func = function()
                        SMODS.add_card( { area = G.consumeables, soulable = false, key = selected.key, edition = (free or nil) })
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
            end
        end
    end
}
