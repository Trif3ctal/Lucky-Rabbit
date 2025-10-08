SMODS.Blind {
    key = "rhythm",
    atlas = "Blinds",
    pos = { x = 0, y = 4 },
    discovered = false,
    boss = { min = 4 },
    boss_colour = HEX('d69a18'),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.post_trigger and context.other_ret
                and not (context.other_context.end_of_round or context.other_context.setting_blind) then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        SMODS.juice_up_blind()
                        return true;
                    end
                }))
                delay(0.23)
                ease_dollars(-1)
                blind.triggered = true
            end
        end
    end
}