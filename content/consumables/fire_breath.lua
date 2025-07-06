SMODS.Consumable {
    key = "fire_breath",
    set = "Silly",
    config = {
        extra = {
            cards = 1,
        }
    },
    atlas = "Consumables",
    pos = { x = 9, y = 1 },
    cost = 5,
    use = function(self, card, context)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            local save_edition = nil
            if G.jokers.highlighted[1].edition then
                save_edition = G.jokers.highlighted[1].edition.key
            end
            for i=1, #G.jokers.cards do
                if G.jokers.cards[i] == G.jokers.highlighted[1] then
                    if G.jokers.cards[i+1] then G.jokers.cards[i+1]:set_edition(save_edition, true, false) end
                end
            end
            if not G.jokers.highlighted[1].ability.eternal then G.jokers.highlighted[1]:start_dissolve(nil) end
            card:juice_up(0.3, 0.5)
            return true end }))
        delay(0.6)
    end,
    can_use = function(self, card)
        if #G.jokers.highlighted == card.ability.extra.cards and #G.jokers.cards >= 2 then
            return true
        end
    end,
}