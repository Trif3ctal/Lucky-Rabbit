SMODS.Joker {
	key = "pet_rock",
	atlas = "Jokers",
	pos = { x = 8, y = 7 },
	rarity = 2,
	cost = 4,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	config = { extra = { } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
    end,
    calculate = function(self, card, context)
        if context.before then
            for i = 1, #context.full_hand do
                if SMODS.has_enhancement(context.full_hand[i], 'm_stone') then
                    context.full_hand[i]:set_seal(SMODS.poll_seal({guaranteed = true}))
                end
            end
        end
    end
}
