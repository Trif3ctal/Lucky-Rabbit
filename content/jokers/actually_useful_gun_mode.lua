SMODS.Joker {
    key = "actually_useful_gun_mode",
    atlas = "Jokers",
    pos = { x = 5, y = 8 },
    rarity = 2,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    cost = 6,
}

local oldcalcedition = Card.calculate_edition -- thanks to ascensio for the code!!
function Card:calculate_edition(context)
    local g
    if self.edition and context.cardarea == G.hand then
        if next(SMODS.find_card("j_fmod_actually_useful_gun_mode")) then
            context.cardarea = G.play
            g = oldcalcedition(self, context)
            context.cardarea = G.hand
        else
            g = oldcalcedition(self, context)
        end
    elseif self.edition and not next(SMODS.find_card("j_fmod_actually_useful_gun_mode")) then
        g = oldcalcedition(self, context)
    end
    return g
end