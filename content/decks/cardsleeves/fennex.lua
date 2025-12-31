CardSleeves.Sleeve({
    key = 'fennex',
    atlas = 'Sleeves',
    pos = { x = 1, y = 0 },
    loc_vars = function(self, info_queue, card)
        local key, vars
        if self.get_current_deck_key() == 'b_fmod_fennex' then
            key = self.key .. '_alt'
            vars = { 9 }
        else
            key = self.key
            vars = { 3 }
        end
        return { key = key, vars = vars }
    end,
    apply = function(self, sleeve)
        if self.get_current_deck_key() == 'b_fmod_fennex' then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.jokers.cards[1]:set_edition('e_negative')
                    return true
                end
            }))
        else
            delay(0.4)
            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({
                        area = G.jokers,
                        key = 'j_fmod_fennex',
                    })
                    return true
                end
        }))
        end
    end
})