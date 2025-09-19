SMODS.Joker {
    key = "newtons_cradle",
    config = {
        extra = {
            retriggers = 0,
            retrigger_gain = 2,
            suit_count = 0,
            increased = false
        }
    },
    loc_vars = function(self, info_queue, card)
        local suit = (G.GAME.current_round.ncradle_card or {}).suit or 'Spades'
        return { vars = { localize(suit, 'suits_plural'), card.ability.extra.retriggers, card.ability.extra.retrigger_gain, colours = { G.C.SUITS[suit] } } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 5, y = 2 },
    blueprint_compat = true,
    cost = 6,
    calculate = function(self, card, context)
        -- increment suit count when a card of the same suit is played
        if context.individual and context.cardarea == G.play and context.scoring_name ~= "High Card" then
            if context.other_card:is_suit(G.GAME.current_round.ncradle_card.suit) and not SMODS.has_no_suit(context.other_card) and not context.other_card.ability.ncradle_set then
                card.ability.extra.suit_count = card.ability.extra.suit_count + 1
                -- ncradle_set is to prevent the same card from being counted multiple times given retriggers
                context.other_card.ability.ncradle_set = true
            end
            -- if it's the last card in the scoring hand and the entire hand consists of that suit, increment retriggers
            -- also, juice up to signify the increasing
            if context.other_card == context.scoring_hand[#context.scoring_hand] and card.ability.extra.suit_count >= #context.scoring_hand and not card.ability.extra.increased then
                card.ability.extra.retriggers = card.ability.extra.retriggers + card.ability.extra.retrigger_gain
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up()
                        return true
                    end
                }))
                -- keep increasing from happening again this hand
                card.ability.extra.increased = true
            end
        end
        if context.after then -- clear card variables after scoring since local vars were annoying to use
            for i = 1, #G.playing_cards do
                if G.playing_cards[i].ability.ncradle_set then
                    -- clear ncradle_set to allow for the same card to be counted again in the next hand
                    G.playing_cards[i].ability.ncradle_set = nil
                end
            end
            card.ability.extra.suit_count = 0
            card.ability.extra.increased = false
        end
        if context.repetition and context.cardarea == G.play and card.ability.extra.retriggers > 0 then -- retrigger the rightmost card if we have any retriggers
            local rightmost = context.scoring_hand[#context.scoring_hand]
            if context.other_card == rightmost then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.retriggers,
                    card = card
                }
            end
        end
        if context.end_of_round and context.cardarea == G.jokers and card.ability.extra.retriggers > 0 then -- reset number of retriggers at end of round
            card.ability.extra.retriggers = 0
            return {
                message = localize('k_reset'),
            }
        end
    end
}

function LR_UTIL.reset_ncradle_card()
    G.GAME.current_round.ncradle_card = { suit = 'Spades' }
    local valid_ncradle_cards = {}
    for _, playing_card in ipairs(G.playing_cards) do
        if not SMODS.has_no_suit(playing_card) then
            valid_ncradle_cards[#valid_ncradle_cards + 1] = playing_card
        end
    end
    local ncradle_card = pseudorandom_element(valid_ncradle_cards,
        'ncradle' .. G.GAME.round_resets.ante)
    if ncradle_card then
        G.GAME.current_round.ncradle_card.suit = ncradle_card.base.suit
    end
end