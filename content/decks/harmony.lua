SMODS.Back {
    key = 'harmony',
    atlas = 'Decks',
    pos = { x = 2, y = 1 },
    unlocked = true,
    discovered = false,
    config = {
        discards = -2
    },
    apply = function(self, back)
        G.GAME.starting_params.fmod_harmony = true
    end
}