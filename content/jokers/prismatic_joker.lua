if LR_CONFIG.enhancements_enabled then
    SMODS.Joker {
        key = "prismatic_joker",
        atlas = "Jokers",
        pos = { x = 2, y = 6 },
        rarity = 2,
        cost = 8,
        unlocked = true,
        discovered = false,
        blueprint_compat = false,
        loc_vars = function(self, info_queue, card)
            info_queue[#info_queue + 1] = G.P_CENTERS.m_fmod_copycat_card
        end,
        calculate = function(self, card, context)
            if context.before and context.main_eval and not context.blueprint and next(context.poker_hands["Four of a Kind"]) then
                for i = 1, #context.scoring_hand do
                    local card_ = context.scoring_hand[i]
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
                            card_:set_ability("m_fmod_copycat_card")
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
                    message = localize("k_fmod_copycat"),
                    colour = G.C.PURPLE
                }
            end
        end
    }
end
