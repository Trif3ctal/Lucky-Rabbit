SMODS.Blind {
    key = "final_sword",
    atlas = "Blinds",
    pos = { x = 0, y = 13 },
    discovered = false,
    boss = { showdown = true, min = 8 },
    boss_colour = HEX('becacc'),
    debuff_hand = function(self, cards, hand, handname, check)
        if handname == G.GAME.current_round.most_played_poker_hand then
            return true
        else
            return false
        end
    end,
    loc_vars = function(self)
        return { vars = { localize(G.GAME.current_round.most_played_poker_hand, 'poker_hands') } }
    end,
    collection_loc_vars = function(self)
        return { vars = { localize('ph_most_played') } }
    end
}

