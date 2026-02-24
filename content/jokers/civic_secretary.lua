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
	blueprint_compat = false,
	calculate = function(self,card,context)
		if context.before then
			card.ability.extra.active = true
		end
		if context.after then
			card.ability.extra.active = false
		end
		if card.ability.extra.active and context.post_trigger and context.other_card and context.other_card.config
		and context.other_card.config.center_key ~= "j_fmod_civic_secretary" and not context.blueprint then
			if context.other_ret and context.other_ret.jokers
			and (type(context.other_ret.jokers) == "table" and context.other_ret.jokers.chips and context.other_ret.jokers.chips ~= 0)
			or (type(context.other_ret.jokers) == "table" and context.other_ret.jokers.chip_mod and context.other_ret.jokers.chip_mod ~= 0) then
				return {
					func = function()
						SMODS.calculate_effect{
							card = card,
							chips = (context.other_ret.jokers.chips or 0) + (context.other_ret.jokers.chip_mod or 0)
						}
						return true
					end
				}
			end
			if context.other_ret and context.other_ret.jokers
			and (type(context.other_ret.jokers) == "table" and context.other_ret.jokers.mult and context.other_ret.jokers.mult ~= 0)
			or (type(context.other_ret.jokers) == "table" and context.other_ret.jokers.mult_mod and context.other_ret.jokers.mult_mod ~= 0) then
				return {
					func = function()
						SMODS.calculate_effect{
							card = card,
							mult = (context.other_ret.jokers.mult or 0) + (context.other_ret.jokers.mult_mod or 0)
						}
						return true
					end
				}
			end
		end
	end,
}