
SMODS.Booster {
    key = "remix_small_1",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,
    group_key = "k_fmod_remixpack",
    cost = 4,
    weight = 0,
    atlas = "Boosters",
    pos = { x = 0, y = 2 },
    draw_hand = true,
    kind = "Remix",
    create_card = function(self, card, i) -- this implementation SUCKS
        local types = {"Joker", "Playing Card"}
        for k, v in ipairs(SMODS.ConsumableType.ctype_buffer) do
            types[#types + 1] = v
        end
        for k = 1, i do
            return SMODS.create_card({set = pseudorandom_element(types, "remix_sm_" .. k), skip_materialize = true, area = G.pack_cards})
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("c3d7e3"))
        ease_background_colour({ new_colour = HEX('c3d7e3'), special_colour = HEX("5d6366"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "remix_small_2",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,
    group_key = "k_fmod_remixpack",
    cost = 4,
    weight = 0,
    atlas = "Boosters",
    pos = { x = 1, y = 2 },
    draw_hand = true,
    kind = "Remix",
    create_card = function(self, card, i) -- this implementation SUCKS
        local types = {"Joker", "Playing Card"}
        for k, v in ipairs(SMODS.ConsumableType.ctype_buffer) do
            types[#types + 1] = v
        end
        for k = 1, i do
            return SMODS.create_card({set = pseudorandom_element(types, "remix_sm_" .. k), skip_materialize = true, area = G.pack_cards})
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("d76c1a"))
        ease_background_colour({ new_colour = HEX('d76c1a'), special_colour = HEX("f5dbc7"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "remix_jumbo",
    config = { extra = 5, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,
    group_key = "k_fmod_remixpack",
    cost = 6,
    weight = 0,
    atlas = "Boosters",
    pos = { x = 2, y = 2 },
    draw_hand = true,
    kind = "Remix",
    create_card = function(self, card, i) -- this implementation SUCKS
        local types = {"Joker", "Playing Card"}
        for k, v in ipairs(SMODS.ConsumableType.ctype_buffer) do
            types[#types + 1] = v
        end
        for k = 1, i do
            return SMODS.create_card({set = pseudorandom_element(types, "remix_sm_" .. k), skip_materialize = true, area = G.pack_cards})
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("ab7de5"))
        ease_background_colour({ new_colour = HEX('ab7de5'), special_colour = HEX("fbecfd"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "remix_mega",
    config = { extra = 5, choose = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,
    group_key = "k_fmod_remixpack",
    cost = 8,
    weight = 0,
    atlas = "Boosters",
    pos = { x = 3, y = 2 },
    draw_hand = true,
    kind = "Remix",
    create_card = function(self, card, i) -- this implementation SUCKS
        local types = {"Joker", "Playing Card"}
        for k, v in ipairs(SMODS.ConsumableType.ctype_buffer) do
            types[#types + 1] = v
        end
        for k = 1, i do
            return SMODS.create_card({set = pseudorandom_element(types, "remix_sm_" .. k), skip_materialize = true, area = G.pack_cards})
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("59c69a"))
        ease_background_colour({ new_colour = HEX('59c69a'), special_colour = HEX("59c69a"), contrast = 2 })
    end
}