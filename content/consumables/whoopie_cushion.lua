-- enhancement
SMODS.Consumable {
    key = "whoopie_cushion",
    set = "Silly",
    config = {
        max_highlighted = 2,
        min_highlighted = 2
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    atlas = "Consumables",
    pos = { x = 4, y = 0 },
    cost = 3,
    use = function(self, card, context, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true end }))
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.2)
        local leftmost = G.hand.highlighted[1]
        for i = 1, #G.hand.highlighted do
            if G.hand.highlighted[i].T.x < leftmost.T.x then
                leftmost = G.hand.highlighted[i]
            end
        end
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                if G.hand.highlighted[i] ~= leftmost then
                    G.hand.highlighted[i]:set_ability(leftmost.config.center)
                    card:juice_up(0.3, 0.5)
                end
            return true end }))
        end
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() update_hand_text({immediate = true, nopulse = true, delay = 0}, {mult = 0, chips = 0, level = '', handname = ''}); G.hand:unhighlight_all(); return true end }))
        delay(0.5)
    end,
    can_use = function(self, card)
		if G.hand and #G.hand.highlighted <= card.ability.max_highlighted and #G.hand.highlighted >= card.ability.min_highlighted then
            local leftmost = G.hand.highlighted[1]
            for i = 1, #G.hand.highlighted do
                if G.hand.highlighted[i].T.x < leftmost.T.x then
                    leftmost = G.hand.highlighted[i]
                end
            end
            if next(SMODS.get_enhancements(leftmost)) then
                return true
            end
		end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if next(SMODS.get_enhancements(playing_card)) then
                return true
            end
        end
        return false
    end
}