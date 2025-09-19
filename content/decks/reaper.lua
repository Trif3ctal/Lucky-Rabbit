SMODS.Back {
    key = 'reaper',
    atlas = 'Decks',
    pos = { x = 3, y = 1 },
    unlocked = true,
    discovered = false,
    config = {
        hands = 1,
        discards = 1,
        hand_size = 1,
        joker_slot = 1,
    },
    calculate = function(self, back, context)
        if context.setting_blind and G.GAME.blind.boss then
            G.GAME.blind.chips = G.GAME.blind.chips * 2
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        end
    end
  }