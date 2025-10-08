SMODS.Blind {
    key = "rhythm",
    atlas = "Blinds",
    pos = { x = 0, y = 4 },
    discovered = false,
    boss = { min = 4 },
    boss_colour = HEX('d69a18'),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.post_trigger and context.other_card then
                blind.triggered = true
                ease_dollars(-1)
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = (function()
                        SMODS.juice_up_blind()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.06 * G.SETTINGS.GAMESPEED,
                            blockable = false,
                            blocking = false,
                            func = function()
                                play_sound('tarot2', 0.76, 0.4)
                                return true
                            end
                        }))
                        play_sound('tarot2', 1, 0.4)
                        return true
                    end)
                }))
                delay(0.4)
            end
        end
    end
}