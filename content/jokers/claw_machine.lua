SMODS.Joker{
	key = 'claw_machine',
    config = {
        extra = {
            xmult = 1.1,
            odds = 7,
            increase = 0.1
        }
    },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'fmod_claw')
		return {vars = { card.ability.extra.xmult, numerator, denominator, card.ability.extra.increase } }
	end,
	rarity = 3,
    atlas = 'Jokers',
    unlocked = true,
    discovered = false,
    pos = { x = 6, y = 2 },
	cost = 8,
	blueprint_compat = true,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 7 then
            if SMODS.pseudorandom_probability(card, 'claw', 1, card.ability.extra.odds, 'fmod_claw') and not context.blueprint then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'xmult',
                    scalar_value = 'increase',
                    message_key = 'a_xmult',
                })
            end
            if not context.other_card.debuff then
                return {
                    x_mult = card.ability.extra.xmult
                }
            end
        end
	end,
	joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
            { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
            { text = "x",                              scale = 0.35 },
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult" }
                }
            }
        },
        extra = {
            {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "odds" },
                { text = ")" },
            }
        },
        extra_config = { colour = G.C.GREEN, scale = 0.3 },
        calc_function = function(card)
            local playing_hand = next(G.play.cards)
            local count = 0
            for _, playing_card in ipairs(G.hand.cards) do
                if playing_hand or not playing_card.highlighted then
                    if playing_card.facing and not (playing_card.facing == "back") and not SMODS.has_no_rank(playing_card) and playing_card:get_id() == 7 then
                        count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                    end
                end
            end
            card.joker_display_values.count = count
            local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'fmod_claw')
            card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { numerator, denominator } }
        end
        }
    end
}