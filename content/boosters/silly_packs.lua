SMODS.Booster {
    key = "silly_small",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("ff98e2")} } }
    end,
    group_key = "k_fmod_sillypack",
    cost = 4,
    atlas = "Boosters",
    weight = 0.75,
    pos = { x = 0, y = 0 },
    draw_hand = true,
    kind = "Silly",
    create_card = function(self, card, i)
        return SMODS.create_card({set = "Silly", skip_materialize = true, area = G.pack_cards})
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("d66a5e"))
        ease_background_colour({ new_colour = HEX('d66a5e'), special_colour = HEX("90c7e6"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "silly_small_2",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("ff98e2")} } }
    end,
    group_key = "k_fmod_sillypack",
    cost = 4,
    atlas = "Boosters",
    weight = 0.75,
    pos = { x = 1, y = 0 },
    draw_hand = true,
    kind = "Silly",
    create_card = function(self, card, i)
        return SMODS.create_card({set = "Silly", skip_materialize = true, area = G.pack_cards})
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("d66a5e"))
        ease_background_colour({ new_colour = HEX('d66a5e'), special_colour = HEX("90c7e6"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "silly_small_4",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("ff98e2")} } }
    end,
    group_key = "k_fmod_sillypack",
    cost = 4,
    atlas = "Boosters",
    weight = 0.75,
    pos = { x = 2, y = 0 },
    draw_hand = true,
    kind = "Silly",
    create_card = function(self, card, i)
        return SMODS.create_card({set = "Silly", skip_materialize = true, area = G.pack_cards})
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("d66a5e"))
        ease_background_colour({ new_colour = HEX('d66a5e'), special_colour = HEX("90c7e6"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "silly_small_3",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("ff98e2")} } }
    end,
    group_key = "k_fmod_sillypack",
    cost = 4,
    atlas = "Boosters",
    weight = 0.75,
    pos = { x = 3, y = 0 },
    draw_hand = true,
    kind = "Silly",
    create_card = function(self, card, i)
        return SMODS.create_card({set = "Silly", skip_materialize = true, area = G.pack_cards})
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("d66a5e"))
        ease_background_colour({ new_colour = HEX('d66a5e'), special_colour = HEX("90c7e6"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "silly_jumbo",
    config = { extra = 5, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("ff98e2")} } }
    end,
    group_key = "k_fmod_sillypack",
    cost = 6,
    atlas = "Boosters",
    weight = 0.75,
    pos = { x = 0, y = 1 },
    draw_hand = true,
    kind = "Silly",
    create_card = function(self, card, i)
        return SMODS.create_card({set = "Silly", skip_materialize = true, area = G.pack_cards})
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("d66a5e"))
        ease_background_colour({ new_colour = HEX('d66a5e'), special_colour = HEX("90c7e6"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "silly_jumbo_2",
    config = { extra = 5, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("ff98e2")} } }
    end,
    group_key = "k_fmod_sillypack",
    cost = 6,
    atlas = "Boosters",
    weight = 0.75,
    pos = { x = 1, y = 1 },
    draw_hand = true,
    kind = "Silly",
    create_card = function(self, card, i)
        return SMODS.create_card({set = "Silly", skip_materialize = true, area = G.pack_cards})
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("d66a5e"))
        ease_background_colour({ new_colour = HEX('d66a5e'), special_colour = HEX("90c7e6"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "silly_mega",
    config = { extra = 5, choose = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("ff98e2")} } }
    end,
    group_key = "k_fmod_sillypack",
    cost = 8,
    weight = 0.19,
    atlas = "Boosters",
    pos = { x = 2, y = 1 },
    draw_hand = true,
    kind = "Silly",
    create_card = function(self, card, i)
        return SMODS.create_card({set = "Silly", skip_materialize = true, area = G.pack_cards})
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("d66a5e"))
        ease_background_colour({ new_colour = HEX('d66a5e'), special_colour = HEX("90c7e6"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "silly_mega_2",
    config = { extra = 5, choose = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("ff98e2")} } }
    end,
    group_key = "k_fmod_sillypack",
    cost = 8,
    weight = 0.19,
    atlas = "Boosters",
    pos = { x = 3, y = 1 },
    draw_hand = true,
    kind = "Silly",
    create_card = function(self, card, i)
        return SMODS.create_card({set = "Silly", skip_materialize = true, area = G.pack_cards})
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("d66a5e"))
        ease_background_colour({ new_colour = HEX('d66a5e'), special_colour = HEX("90c7e6"), contrast = 2 })
    end
}