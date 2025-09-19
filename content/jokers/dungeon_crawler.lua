SMODS.Joker {
	key = "dungeon_crawler",
	atlas = "Jokers",
	pos = { x = 2, y = 5 },
	rarity = 2,
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	config = { extra = { chips = 10 } },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
            }
        }
	end,
	calculate = function(self, card, context)
		if context.before then
            local spade_in_hand = false
            local spade_list = {}
			for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_suit('Spades') and not context.scoring_hand[i].ability.no_dc then
                    table.insert(spade_list, context.scoring_hand[i])
                    spade_in_hand = true
                end
            end
            if spade_in_hand then
                local valid_pairs = {}
                for _, card_ in ipairs(spade_list) do
                    if not next(SMODS.get_enhancements(card_)) or not card_.ability.no_dc then
                        table.insert(valid_pairs, { card = card_, mod = "enhancement" })
                    end
                    if not card_.seal or not card_.ability.no_dc_seal then
                        table.insert(valid_pairs, { card = card_, mod = "seal" })
                    end
                    if LR_CONFIG.markings_enabled and not LR_UTIL.has_marking(card_) or not card_.ability.no_dc_mrk then
                        table.insert(valid_pairs, { card = card_, mod = "marking" })
                    end
                end
                if #valid_pairs > 0 then
                    local pair = pseudorandom_element(valid_pairs, pseudoseed('dungeon_crawler'))
                    local chosen = pair.card
                    local modify = pair.mod
                    if modify == "enhancement" then
                        chosen:set_ability(SMODS.poll_enhancement({ guaranteed = true, key = 'dungeon_crawler1' }),
                            nil, true)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                chosen:juice_up()
                                chosen.ability.no_dc = true
                                return true
                            end
                        }))
                    elseif modify == "seal" then
                        chosen:set_seal(SMODS.poll_seal({ guaranteed = true, key = 'dungeon_crawler2' }))
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                chosen.ability.no_dc_seal = true
                                return true
                            end
                        }))
                    elseif modify == "marking" then
                        LR_UTIL.set_marking(chosen,
                            string.sub(
                                pseudorandom_element(LR_UTIL.ENABLED_MARKINGS, pseudoseed('dungeon_crawler3')), 0,
                                -6))
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                chosen.ability.no_dc_mrk = true
                                chosen:juice_up()
                                return true
                            end
                        }))
                    end
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.CHIPS
                    }
                end
            end
		end
	end
}
