SMODS.Joker {
    key = "calculator",
    config = {
        extra = {
            inactive_hands = 0,
        }
    },
    loc_vars = function(self, info_queue, card)
        if card.ability.extra.inactive_hands > 0 then
            local hands_left = card.ability.extra.inactive_hands
            return { vars = {
                "Inactive for ",
                hands_left,
                " hand" .. (card.ability.extra.inactive_hands == 1 and "" or "s")
            } }
        else
            return { vars = { "Active!", "", "" } }
        end
    end,
    rarity = 2,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    pos = { x = 7, y = 1 },
    pixel_size = { w = 71, h = 65 },
    cost = 4,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.inactive_hands == 0 then
            local first_card = context.scoring_hand[1]
            local last_card = context.scoring_hand[#context.scoring_hand]
            if card.ability.extra.inactive_hands == 0 then
                if first_card ~= last_card
                and not SMODS.has_no_rank(first_card)
                and not SMODS.has_no_rank(last_card) then
                    local function adjusted_id(card)
                        local id = card:get_id()
                        if id >= 11 and id <= 13 then
                            return 10
                        elseif id == 14 then
                            return 11
                        else
                            return id
                        end
                    end
                    local xmult = adjusted_id(first_card) - adjusted_id(last_card)
                    if xmult > 1 then
                        if not context.blueprint then
                            card.ability.extra.inactive_hands_to_add = (card.ability.extra.inactive_hands_to_add or 0) + xmult
                        end
                        return {
                            xmult = xmult
                        }
                    end
                end
            end
        end
        if context.after and not context.blueprint then
            if card.ability.extra.inactive_hands_to_add then
                card.ability.extra.inactive_hands =
                    card.ability.extra.inactive_hands + card.ability.extra.inactive_hands_to_add
                card.ability.extra.inactive_hands_to_add = nil
            else
                card.ability.extra.inactive_hands = math.max(card.ability.extra.inactive_hands - 1, 0)
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
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "active_text" },
                { text = ")" },
            },
            calc_function = function(card)
                card.joker_display_values.x_mult = 1
                local dist = nil
                if card.ability.extra.inactive_hands == 0 then
                    local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                    if text ~= 'Unknown' then
                        local first_card = JokerDisplay.calculate_leftmost_card(scoring_hand)
                        local last_card = JokerDisplay.calculate_rightmost_card(scoring_hand)
                        if first_card ~= last_card and not SMODS.has_no_rank(first_card) and not SMODS.has_no_rank(last_card) then
                            local function adjusted_id(_card)
                                local id = _card:get_id()
                                if id >= 11 and id <= 13 then
                                    return 10
                                elseif id == 14 then
                                    return 11
                                else
                                    return id
                                end
                            end
                            dist = adjusted_id(first_card) - adjusted_id(last_card) > 1 and adjusted_id(first_card) - adjusted_id(last_card) or 1
                        end
                    end
                end
                local remaining = card.ability.extra.inactive_hands
                card.joker_display_values.x_mult = dist or 1
                card.joker_display_values.active_text = localize { type = 'variable', key = (remaining == 0 and 'loyalty_active' or 'loyalty_inactive'), vars = { remaining } }
            end
        }
    end
}