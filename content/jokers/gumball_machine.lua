SMODS.Joker{
    key = "gumball_machine",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_fmod_juggler
        return { vars = { colours = { HEX("ff98e2") } } }
    end,
    rarity = 3,
    atlas = "Jokers",
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    pos = { x = 9, y = 3 },
    cost = 10,
}