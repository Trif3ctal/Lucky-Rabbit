SMODS.Joker {
    key = "comic_book_ad",
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_fmod_raffle_card
        return { vars = { colours = {HEX("ff98e2")} } }
    end,
    rarity = 1,
    atlas = "Jokers",
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    pos = { x = 5, y = 5 },
    cost = 4,
    enhancement_gate = "m_fmod_raffle_card"
}