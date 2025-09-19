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
        for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:set_cost()
        end
        for i = 1, #G.consumeables.cards do
            G.consumeables.cards[i]:set_cost()
        end
        if G.shop_jokers then 
	    for i = 1, #G.shop_jokers.cards do
                G.shop_jokers.cards[i]:set_cost()
            end 
	end
    end,
    remove_from_deck = function(self, card, from_debuff)
        for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:set_cost()
        end
        for i = 1, #G.consumeables.cards do
            G.consumeables.cards[i]:set_cost()
        end
        if G.shop_jokers then 
	    for i = 1, #G.shop_jokers.cards do
                G.shop_jokers.cards[i]:set_cost()
            end 
	end
    end,
}
