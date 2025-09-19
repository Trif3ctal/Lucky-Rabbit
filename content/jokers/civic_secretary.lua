SMODS.Joker{
	key = 'civic_secretary',
    config = { extra = { active = false }},
    loc_vars = function(self,info_queue,card)
		return {vars = {}}
	end,
	rarity = 2,
    atlas = 'Jokers',
    unlocked = true,
    discovered = false,
    pos = { x = 8, y = 1 },
	cost = 6,
	blueprint_compat = true,
	calculate = function(self,card,context)
		if context.before then
			card.ability.extra.active = true
		end
		if context.after then
			card.ability.extra.active = false
		end
		if card.ability.extra.active then
            local total_chips = 0
            local total_mult = 0
			for _, v in ipairs(G.jokers.cards) do
				if v.ability.name ~= 'Blueprint' and v.ability.name ~= 'Brainstorm' and v.ability.name ~= "j_fmod_civic_secretary" then
					context.blueprint = nil
					local ret = SMODS.blueprint_effect(card, v, context)
					if ret then
						total_chips = total_chips + (ret.chips or 0)
                        total_chips = total_chips + (ret.chip_mod or 0)
                        total_mult = total_mult + (ret.mult or 0)
                        total_mult = total_mult + (ret.mult_mod or 0)
                        total_mult = total_mult + (ret.h_mult or 0)
					end
				end
			end
            if total_chips > 0 or total_mult > 0 then
                return {
                    chips = total_chips,
                    mult = total_mult,
                }
            end
		end
	end,
}