SMODS.Joker {
	key = "zany_to_the_max",
	atlas = "Jokers",
	pos = { x = 7, y = 5 },
	rarity = 2,
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	config = {
        extra = {
            chip_gain = 10,
            chips = 0,
            mult_gain = 1,
            mult = 0,
            xmult_gain = 0.1,
            xmult = 1,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chip_gain, card.ability.extra.mult_gain, card.ability.extra.xmult_gain, card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint and context.scoring_name == "Three of a Kind" then
            local pseudo = pseudorandom(pseudoseed('zany_to_the_max'))
            -- 33% chance #1
            if pseudo <= 0.33 then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
                -- 33% chance #2
            elseif pseudo <= 0.66 then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                -- 33% chance #3
            else
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            end
            return {
                message = localize("k_upgrade_ex"),
                colour = G.C.CHIPS
            }
        end
        if context.joker_main then
            local ret = {}
            if card.ability.extra.chips > 0 then
                ret.chips = card.ability.extra.chips
            end
            if card.ability.extra.mult > 0 then
                ret.mult = card.ability.extra.mult
            end
            if card.ability.extra.xmult > 1 then
                ret.xmult = card.ability.extra.xmult
            end
            return ret
        end
    end
}