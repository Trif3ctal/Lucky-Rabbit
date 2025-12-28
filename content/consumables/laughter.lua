SMODS.Consumable {
    key = "laughter",
    set = "Silly",
    loc_vars = function(self, info_queue, card)
        local laughter_c = G.GAME.fmod_last_silly and G.P_CENTERS[G.GAME.fmod_last_silly] or nil
        local last_silly = laughter_c and localize { type = 'name_text', key = laughter_c.key, set = laughter_c.set } or localize('k_none')
        local color = (not laughter_c or laughter_c.key == 'c_fmod_laughter') and G.C.RED or G.C.GREEN
        if not (not laughter_c or laughter_c.key == 'c_fmod_laughter') then
            info_queue[#info_queue+1] = laughter_c
        end

        local main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", padding = 0.02 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "m", colour = color, r = 0.05, padding = 0.05 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. last_silly .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
                        }
                    }
                }
            }
        }

        return { vars = { last_silly, colours = { HEX("ff98e2") } }, main_end = main_end }
    end,
    atlas = "Consumables",
    pos = {x = 8, y = 2 },
    cost = 4,
    use = function(self, card, context, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound('timpani')
                    SMODS.add_card({ key = G.GAME.fmod_last_silly })
                    card:juice_up(0.3, 0.5)
                end
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return (#G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables) and G.GAME.fmod_last_silly and G.GAME.fmod_last_silly ~= 'c_fmod_laughter'
    end
}