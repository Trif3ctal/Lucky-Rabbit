SMODS.Joker {
    key = "pomni",
    config = {
        extra = {
            blind_count = 0,
            base_ante = 1,
            chance_ante = 2,
            odds = 4,
            skip_amt = 3
        }
    },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'fmod_pomni')
        return { vars = {card.ability.extra.base_ante, card.ability.extra.skip_amt, numerator, denominator, card.ability.extra.chance_ante, card.ability.extra.blind_count } }
    end,
    pools = {
        ["Fmod_Legendary"] = true,
    },
    rarity = 4,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 3, y = 3 },
    soul_pos = { x = 3, y = 4 },
    blueprint_compat = false,
    cost = 20,
    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            card.ability.extra.blind_count = card.ability.extra.blind_count + 1
            if card.ability.extra.blind_count == card.ability.extra.skip_amt then
                card.ability.extra.blind_count = 0
                if SMODS.pseudorandom_probability(card, 'pomni', 1, card.ability.extra.odds) then
                    ease_ante(-card.ability.extra.chance_ante)
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.chance_ante
                else
                    ease_ante(-card.ability.extra.base_ante)
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.base_ante
                end
                return {
                    message = localize('k_reset'),
                }
            else
                return {
                    message = card.ability.extra.blind_count..'/'..card.ability.extra.skip_amt,
                }
            end
        end
    end,
    in_pool = function (self, args)
        return not args or not args.source or args.source ~= 'sou'
    end
}