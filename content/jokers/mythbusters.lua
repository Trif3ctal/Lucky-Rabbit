SMODS.Joker {
    key = "mythbusters",
    atlas = "Jokers",
    pos = { x = 8, y = 10 },
    soul_pos = { x = 9, y = 10 },
    config = {
        extra = {
            mult = 0,
            gain = 1,
            antegain = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gain, card.ability.extra.antegain, card.ability.extra.mult } }
    end,
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    cost = 5,
    calculate = function(self, card, context)
        if context.before and not context.blueprint and (next(context.poker_hands['Pair'])) then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mult",
                scalar_value = "gain",
            })
        end
        if context.end_of_round and not context.blueprint and context.cardarea == G.jokers then
            if SMODS.last_hand_oneshot and SMODS.last_hand.scoring_name == "Pair" then
                local played = G.GAME.pair_count
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_value = "antegain",
                    operation = function(ref_table, ref_value, initial, change)
                        ref_table[ref_value] = initial + change*played
                    end
                })
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
}