CardSleeves.Sleeve({
    key = 'clown',
    atlas = 'Sleeves',
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, card)
        local key, vars
        if self.get_current_deck_key() == "b_fmod_clown" then
            key = self.key .. '_alt'
            vars = { localize { type = "name_text", set = "Voucher", key = "v_fmod_circus" }, localize { type = "name_text", set = "Voucher", key = "v_fmod_showtime" },
                colours = { HEX("ff98e2") } }
            self.config = { vouchers = { 'v_fmod_circus', 'v_fmod_showtime' } }
        else
            key = self.key
            vars = { localize { type = "name_text", set = "Voucher", key = "v_fmod_circus" }, colours = { HEX("ff98e2") } }
            self.config = { vouchers = { 'v_fmod_circus' } }
        end
        return { key = key, vars = vars }
    end,
})
