SMODS.Blind {
    key = "flux",
    atlas = "Blinds",
    pos = { x = 0, y = 10 },
    discovered = false,
    boss = { min = 3 },
    boss_colour = HEX('702791'),
    suit1 = 'Spades',
    suit2 = 'Hearts',
    drawn_to_hand = function(self)
        if G.GAME.blind.prepped then
            for i = 1, #G.playing_cards do
                for b = 1, #G.hand.cards do
                    if G.playing_cards[i] == G.hand.cards[b] then
                        G.hand.cards[b]:juice_up()
                    end
                end
                SMODS.debuff_card(G.playing_cards[i], false, 'flux')
                SMODS.juice_up_blind()
            end
            G.GAME.blind.suit1 = pseudorandom_element(SMODS.Suits, pseudoseed('flux1')).name or 'Spades'
            G.GAME.blind.suit2 = pseudorandom_element(SMODS.Suits, pseudoseed('flux2')).name or 'Hearts'
            while G.GAME.blind.suit2 == G.GAME.blind.suit1 do
                G.GAME.blind.suit2 = pseudorandom_element(SMODS.Suits, pseudoseed('flux2')).name or 'Hearts'
            end
            for i = 1, #G.playing_cards do
                local card = G.playing_cards[i]
                if (card.base.suit == G.GAME.blind.suit1 or card.base.suit == G.GAME.blind.suit2) and not SMODS.has_no_rank(card) then
                    SMODS.debuff_card(card, true, 'flux')
                    for b = 1, #G.hand.cards do
                        if card == G.hand.cards[b] then
                            card:juice_up()
                        end
                    end
                end
            end
        end
        G.GAME.blind.prepped = nil
    end,
    press_play = function(self)
        G.GAME.blind.prepped = true
    end,
    defeat = function(self)
        for i = 1, #G.playing_cards do
            SMODS.debuff_card(G.playing_cards[i], false, 'flux')
        end
    end
}
