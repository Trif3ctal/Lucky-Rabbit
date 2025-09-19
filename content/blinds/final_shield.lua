SMODS.Blind {
    key = "final_shield",
    atlas = "Blinds",
    pos = { x = 0, y = 15 },
    discovered = false,
    boss = { showdown = true, min = 8 },
    boss_colour = HEX('ff9933'),
    debuff = {
        value = {}
    },
    set_blind = function(self)
        G.GAME.blind.debuff.value = G.GAME.current_round.most_played_rank
    end,
    loc_vars = function(self)
        return { vars = { localize(G.GAME.current_round.most_played_rank, 'ranks') } }
    end,
    collection_loc_vars = function(self)
        return { vars = { localize('r_fmod_mostplayed') } }
    end
}

