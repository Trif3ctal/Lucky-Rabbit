SMODS.Joker {
	key = "tem_shop",
	atlas = "Jokers",
	pos = { x = 9, y = 4 },
	rarity = 2,
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers and G.jokers.cards then
                    for i = 1, #G.jokers.cards do
                        G.jokers.cards[i]:set_cost()
                    end
                end
                if G.consumeables and G.consumeables.cards then
                    for i = 1, #G.consumeables.cards do
                        G.consumeables.cards[i]:set_cost()
                    end
                end
                if G.shop_jokers and G.shop_jokers.cards then
                    for i = 1, #G.shop_jokers.cards do
                        G.shop_jokers.cards[i]:set_cost()
                    end
                end
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers and G.jokers.cards then
                    for i = 1, #G.jokers.cards do
                        G.jokers.cards[i]:set_cost()
                    end
                end
                if G.consumeables and G.consumeables.cards then
                    for i = 1, #G.consumeables.cards do
                        G.consumeables.cards[i]:set_cost()
                    end
                end
                if G.shop_jokers and G.shop_jokers.cards then
                    for i = 1, #G.shop_jokers.cards do
                        G.shop_jokers.cards[i]:set_cost()
                    end
                end
                return true
            end
        }))
    end,
}
