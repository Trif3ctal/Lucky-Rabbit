SMODS.Consumable {
    key = "balloon_animal",
    set = "Silly",
    config = {
        extra = {
            money = 3,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money, card.ability.extra.money * LR_UTIL.get_unique_ranks() } }
    end,
    atlas = "Consumables",
    pos = { x = 0, y = 1 },
    cost = 5,
    use = function(self, card, context, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            card:juice_up(0.3, 0.5)
            ease_dollars((card.ability.extra.money * LR_UTIL.get_unique_ranks()), true)
            return true end }))
        delay(0.6)
    end,
    can_use = function(self, card)
        if G.STATE == G.STATES.SELECTING_HAND or G.STATE == G.STATES.SMODS_BOOSTER_OPENED then
            return true
        end
    end,
}

LR_UTIL.get_unique_ranks = function()
    local ranks = {}
    if G.hand then
        for _, v in pairs(G.hand.cards) do
            if not SMODS.has_no_rank(v) and not SMODS.has_enhancement(v, 'm_stone') then
                ranks[v:get_id()] = true
            end
        end
    end
    local unique_ranks_count = 0
    for _ in pairs(ranks) do
        unique_ranks_count = unique_ranks_count + 1
    end
    return unique_ranks_count
end
