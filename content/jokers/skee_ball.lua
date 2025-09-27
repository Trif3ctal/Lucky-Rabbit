SMODS.Joker {
    key = "skee_ball",
    config = {
        extra = {
        }
    },
    atlas = "Jokers",
    pos = { x = 8, y = 6 },
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    cost = 6,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local diamonds = 0
            local clubs = 0
            for i = 1, #context.full_hand do
                if context.full_hand[i]:is_suit("Diamonds") then
                    diamonds = diamonds + 1
                elseif context.full_hand[i]:is_suit("Clubs") then
                    clubs = clubs + 1
                end
            end
            if diamonds == #context.full_hand or clubs == #context.full_hand then
                for i = 1, #context.full_hand do
                    local card_ = context.full_hand[i]
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            card_:flip()
                            play_sound('card1', 1)
                            card_:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card_:set_ability("m_fmod_raffle_card")
                            return true
                        end
                    }))
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            card_:flip()
                            play_sound('tarot2', 0.85, 0.6)
                            card_:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                return {
                    message = localize{type="variable", key="a_fmod_skee", vars={#context.full_hand}},
                    colour = G.C.PURPLE
                }
            end
        end
    end,
}