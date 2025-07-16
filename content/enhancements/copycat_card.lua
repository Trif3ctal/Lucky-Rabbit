SMODS.Enhancement {
    key = "copycat_card",
    atlas = "Decks",
    pos = { x = 4, y = 0 },
    config = {
        extra = { 
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.rank } }
    end,
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.play then
            local rank = pseudorandom_element(SMODS.Ranks, "copycat_card").key
            for k, v in ipairs(context.scoring_hand) do
                if SMODS.has_enhancement(v, "m_fmod_copycat_card") then
                    v.ability.copy_master = true
                    break
                end
            end
            if card.ability.copy_master and SMODS.has_enhancement(card, "m_fmod_copycat_card") then
                local copycats = {}
                for i = 1, #G.hand.cards do
                    if SMODS.has_enhancement(G.hand.cards[i], "m_fmod_copycat_card") then copycats[#copycats + 1] = G.hand.cards[i] end
                end
                for i = 1, #G.play.cards do
                    if SMODS.has_enhancement(G.play.cards[i], "m_fmod_copycat_card") then copycats[#copycats + 1] = G.play.cards[i] end
                end
                for i = 1, #copycats do
                    local percent = 1.15 - (i - 0.999) / (#copycats - 0.998) * 0.3
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            copycats[i]:flip(); play_sound('card1', percent); copycats[i]:juice_up(0.3, 0.3); return true
                        end
                    }))
                end
                delay(0.2)
                for i = 1, #copycats do
                    local _card = copycats[i]
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            assert(SMODS.change_base(_card, nil, rank))
                            _card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                delay(0.2)
                for i = 1, #copycats do
                    local percent = 0.85 + (i - 0.999) / (#copycats - 0.998) * 0.3
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            copycats[i]:flip(); play_sound('tarot2', percent, 0.6); copycats[i]:juice_up(0.3, 0.3); return true
                        end
                    }))
                end
                for i = 1, #G.playing_cards do
                    local _card = G.playing_cards[i]
                    local changable = true
                    for n = 1, #copycats do
                        if _card == copycats[n] then
                            changable = false -- card has already been changed, so don't
                            break
                        end
                    end
                    if changable and SMODS.has_enhancement(_card, "m_fmod_copycat_card") then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                assert(SMODS.change_base(_card, nil, rank))
                                return true
                            end
                        }))
                    end
                end
                card.ability.copy_master = nil
            end
        end
    end
}
