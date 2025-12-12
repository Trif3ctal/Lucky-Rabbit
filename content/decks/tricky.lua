SMODS.Back {
    key = 'tricky',
    atlas = 'Decks',
    pos = { x = 2, y = 2 },
    unlocked = true,
    discovered = false,
    config = {
        dollars = -2,
        extra = {
            amount = 13
        }
    },
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = 1, self.config.extra.amount do
                    local applicable = {}
                    for b = 1, #G.playing_cards do
                        local card = G.playing_cards[b]
                        if not LR_UTIL.has_marking(card) then
                            applicable[#applicable + 1] = card
                        end
                    end
                    local card = pseudorandom_element(applicable, pseudoseed('tricky_' .. i))
                    LR_UTIL.set_marking(card,
                            string.sub(pseudorandom_element(LR_UTIL.ENABLED_MARKINGS, pseudoseed('tricky_' .. i)), 1, -6))
                end
                return true
            end
        }))
    end
}