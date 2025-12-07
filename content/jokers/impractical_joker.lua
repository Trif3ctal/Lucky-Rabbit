SMODS.Joker{
    key = "impractical_joker",
    config = {
        extra = {
            mult = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pixel_size = { w = 71, h = 80 },
    pos = { x = 7, y = 0 },
    cost = 4,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local temp_ID = 15
            local raised_card = nil
            for i = 1, #context.scoring_hand do
                if temp_ID > context.scoring_hand[i].base.id and not SMODS.has_no_rank(context.scoring_hand[i]) then
                    temp_ID = context.scoring_hand[i].base.id
                    raised_card = context.scoring_hand[i]
                end
            end
            if raised_card == context.other_card then
                return {
                    x_mult = card.ability.extra.mult,
                    colour = G.C.RED,
                    card = card
                }
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
                }
            }
        },
            calc_function = function(card)
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                local temp_ID = 15
                local temp_xmult = card.ability.extra.mult
                local temp_card = nil
                local lowest_cards = {}
                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        if temp_ID >= scoring_card.base.id and not SMODS.has_no_rank(scoring_card) then
                            temp_ID = scoring_card.base.id
                            temp_card = scoring_card
                        end
                    end
                    for _, scoring_card in pairs(scoring_hand) do
                        if temp_ID == scoring_card.base.id then
                            table.insert(lowest_cards, scoring_card)
                        end
                    end
                    if not temp_card or temp_card.debuff or temp_card.facing == 'back' then
                        temp_xmult = 0
                    end
                end
                local first_lowest = JokerDisplay.calculate_leftmost_card(lowest_cards)
                card.joker_display_values.x_mult = (first_lowest and temp_xmult ^ JokerDisplay.calculate_card_triggers(first_lowest, scoring_hand)) or 2
            end
        }
    end,
}