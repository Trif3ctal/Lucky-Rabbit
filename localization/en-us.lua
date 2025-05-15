return {
    descriptions = {
        Joker = {
            j_fmod_generator = {
                name = "Generator",
                text = {
                        "Retrigger all {C:attention}played cards{},",
                        "{C:red}destroys{} {C:attention}leftmost{} consumable",
                        "at beginning of round",
                        "{C:red}Self destructs{} if no consumables",
                        "can be destroyed"
                },
            },
            j_fmod_fennex = {
                name = "Fennex",
                text = {
                    "Every {C:attention}#1#{} rerolls, add",
                    "a {C:attention}Voucher{} to the shop",
                    "{C:inactive,s:0.8}(#2# remaining)"
                }
            },
            j_fmod_terminal_velocity = {
                name = "Terminal Velocity",
                text = {
                    "Played {C:attention}Wild Cards{} permanently",
                    "gain {X:mult,C:white}X#1#{} Mult"
                }
            },
            j_fmod_low_hanging_fruit = {
                name = "Low Hanging Fruit",
                text = {
                    "Each played {C:attention}6{} or {C:attention}9",
			        "gives {C:mult}+#2#{} Mult and",
			        "{C:chips}+#1#{} Chips when scored"
                }
            },
            j_fmod_nerdcubed = {
                name = "Nerdcubed",
                text = {
                    "Each played {C:attention}3{}",
			        "is retriggered {C:attention}3{} times"
                }
            },
            j_fmod_penny_joker = {
                name = "Penny Joker",
                text = {
                    "Gains {C:chips}+2 Chips{} for",
			        "every card scored.",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
                }
            },
            j_fmod_countdown = {
                name = "Countdown",
                text = {
                    "The next {C:attention}#1#{} scored gives",
			        "{C:mult}+#2#{} Mult, and decreases rank once.",
                    "When an {C:attention}#3#{} is scored, gives {X:mult,C:white}X#4#{}",
                    "Mult and resets to a {C:attention}King{}"
                }
            },
            j_fmod_despicable_bear = {
                name = "Despicable Bear",
                text = {
                    "Played {C:attention}Two Pair{} hands are",
                    "considered {C:attention}Four of a Kind{}",
                    "if played with exactly {C:attention}4{} cards",
                }
            },
            j_fmod_nerothefool = {
                name = "Nero the Fool",
                text = {
                    "If {C:attention}first hand{} of round",
                    "has exactly {C:attention}2{} cards,",
                    "destroy them"
                }
            },
            j_fmod_negativejoker = {
                name = "Negative Joker",
                text = {
                    "{C:chips}+#1#{} Chips, becomes",
                    "{C:attention}Negative{} after {C:attention}#2#{} rounds",
                    "{C:inactive}(Rounds left: {C:attention}#3#{C:inactive})",
                }
            },
            j_fmod_passport = {
                name = "Passport",
                text = {
                    "{C:mult}+#1#{} Mult per unique",
                    "{C:attention}Poker Hand{} played",
                    "{C:inactive}(Currently: {C:mult}+#2#{C:inactive} Mult)",
                }
            },
            j_fmod_steve = {
                name = "Steve",
                text = {
                    "Creates a random {C:dark_edition}Negative {C:attention}Food",
                    "{C:attention}Joker{} at the start of each round",
                }
            },
            j_fmod_blue_angel_mushroom = {
                name = "Blue Angel Mushroom",
                text = {
                    "If death were to occur",
                    "give {C:red}+1{} hand and resume the round",
                    "Self-destructs after {C:attention}#1#{} uses",
                    "{C:inactive}(Uses left: {C:attention}#2#{C:inactive})",
                }
            },
            j_fmod_impractical_joker = {
                name = "Impractical Joker",
                text = {
                    "First {C:attention}lowest ranking{}",
                    "card in played hand",
                    "gives {X:mult,C:white}X#1#{} Mult",
                    "when scored"
                }
            },
            j_fmod_ferromancy = {
                name = "Ferromancy",
                text = {
                    "{C:attention}Gold{} cards give {X:mult,C:white}X#1#{} Mult",
                    "when held in hand, while",
                    "{C:attention}Steel{} cards give {C:money}$#2#{}",
                    "at end of round",
                    "{C:inactive}(Overrides default behavior)"
                }
            },
            j_fmod_jazzercise = {
                name = "Jazzercise Joker",
                text = {
                    "{C:attention}+#1#{} hand size for every {C:attention}#2# {C:inactive}[#3#]",
                    "cards destroyed in this run",
                    "{C:inactive}(Currently {C:attention}+#4#{C:inactive})"
                }
            },
            j_fmod_pomni = {
                name = "Pomni",
                text = {
                    "After skipping {C:attention}#2#{} Blinds, {C:attention}-#1#{} Ante",
                    "{C:green}#3# in #4#{} chance for {C:attention}-#5#{} Ante",
                    "{C:inactive}(Currently {C:attention}#6#{C:inactive}/#2#)"
                }
            },
            j_fmod_loonette = {
                name = "Loonette",
                text = {
                    "{C:attention}Number{} cards give {X:mult,C:white}X#1#{} Mult when",
                    "scored, increases by {X:mult,C:white}X#2#{} Mult for",
                    "each consecutively scored {C:attention}number{} card",
                    "{C:inactive}(Resets after hand played)"
                }
            },
            j_fmod_wordle = {
                name = "Wordle",
                text = {
                    "Gains {C:chips}+#1#{} Chips if played",
                    "hand contains a {C:attention}3{}, {C:attention}7{}, {C:attention}8{}, or",
                    "a {C:attention}Queen{}",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                }
            },
            j_fmod_hyperfixation = {
                name = "Hyperfixation",
                text = {
                    "Each played {C:attention}#1#{} of {V:1}#2#{}",
                    "is retriggered {C:attention}#3#{} time(s)",
                    "Gains {C:attention}1{} retrigger every {C:attention}#5#{} {C:inactive}[#6#]{} times",
                    "a round's {C:attention}required rank{} (#4#) is scored",
                    "{C:inactive}(Required rank changes every round)"
                }
            },
            j_fmod_fragile_sticker = {
                name = "Fragile Sticker",
                text = {
                    "{C:attention}Glass{} no longer breaks",
                    "through use",
                }
            },
            j_fmod_ghost_trick = {
                name = "Ghost Trick",
                text = {
                    "Played cards have a {C:green}#1# in #2#{} chance",
                    "to create a {C:dark_edition}Negative {C:spectral}Spectral{}",
                    "card when {C:attention}retriggered",
                }
            }
        },
        Tag = {
            tag_fmod_appraisal = {
                name = "Appraisal Tag",
                text = {
                    "Gives {C:money}$#1#{} for each {C:attention}Enhanced",
                    "{C:attention}Card{} in your full deck",
                    "{C:inactive}(Will give {C:money}$#2#{C:inactive})"
                }
            },
            tag_fmod_lunchbreak = {
                name = "Lunch Break Tag",
                text = {
                    "Creates a random",
                    "{C:dark_edition}Negative {C:attention}Food Joker{}"
                }
           },
            tag_fmod_boost = {
                name = "Boost Tag",
                text = {
                    "Adds two {C:attention}Free",
                    "{C:attention}Booster Packs",
                    "to the next shop"
                }
            },
            tag_fmod_goofy = {
                name = "Goofy Tag",
                text = {
                    "Gives a free",
                    "{V:1}Mega Silly Pack{}"
                }
            }
        },
        Blind = {
            bl_fmod_hoard = {
                name = "The Hoard",
                text = {
                    "All number cards",
                    "are drawn face down"
                }
            },
            bl_fmod_tool = {
                name = "The Tool",
                text = {
                    "All consumables",
                    "are debuffed"
                }
            },
            bl_fmod_baby = {
                name = "The Baby",
                text = {
                    "All enhanced cards",
                    "are drawn face down"
                }
            },
            bl_fmod_priest = {
                name = "The Priest",
                text = {
                    "Cannot play more",
                    "than 4 cards"
                }
            },
            bl_fmod_dice = {
                name = "The Dice",
                text = {
                    "All odds fall",
                    "to zero"
                }
            },
            bl_fmod_final_sword = {
                name = "Ivory Sword",
                text = {
                    "Cannot play a",
                    "#1#"
                }
            },
            bl_fmod_light = {
                name = "The Light",
                text = {
                    "Played Enhanced cards",
                    "lose their Enhancements"
                }
            },
            bl_fmod_elder = {
                name = "The Elder",
                text = {
                    "All unenhanced cards",
                    "are drawn face down"
                }
            },
            bl_fmod_flux = {
                name = "The Flux",
                text = {
                    "Two random suits",
                    "debuffed every hand",
                }
            },
            bl_fmod_final_shield = {
                name = "Saffron Shield",
                text = {
                    "All #1#s are",
                    "debuffed"
                }
            },
            bl_fmod_final_horn = {
                name = "Lavender Horn",
                text = {
                    "All cards are",
                    "drawn face down"
                }
            }
        },
        Back = {
            b_fmod_recursive = {
                name = "Recursive Deck",
                text = {
                    "{C:attention}Joker{}, {C:tarot}Tarot{}, {C:planet}Planet{},",
                    "and {C:spectral}Spectral{} cards may",
                    "appear multiple times",
                }
            },
            b_fmod_fennex = {
                name = "Fennex Deck",
                text = {
                    "Start run with the {C:attention,T:j_fmod_fennex}Fennex{} Joker,",
                    "{C:legendary}Lucky Rabbit{C:attention} Jokers{} are",
                    "{X:green,C:white}3X{} more likely to appear"
                }
            },
            b_fmod_clown = {
                name = "Clown Deck",
                text = {
                    "Start run with the",
                    "{V:1,T:v_fmod_circus}#1#{} Voucher"
                }
            },
            b_fmod_reaper = {
                name = "Reaper Deck",
                text = {
                    "Every Boss Blind is a {C:attention}Finisher{}",
                    "{C:attention}Blind{} with {X:mult,C:white,s:1.2}X2{} {C:red}Base Size{}",
                    "{C:chips}+1{} Hand, {C:red}+1{} Discard, {C:chips}+1{} Hand",
                    "Size, {C:attention}+1{} Joker Slot"
                }
            },
            b_fmod_harmony = {
                name = "Harmony Deck",
                text = {
                    "All cards in deck are the",
                    "same {C:attention}Rank{} and {C:attention}Suit{}",
                    "{C:red}-2{} Discards"
                }
            }
        },
        Silly = {
            c_fmod_pie = {
                name = "Pie",
                text = {
                    "Select {C:attention}#1#{} cards, copy the {C:attention}rank",
                    "of the {C:attention}left{} card onto the {C:attention}right{}",
                    "card"
                }
            },
            c_fmod_clown_car = {
                name = "Clown Car",
                text = {
                    "Creates a random {C:dark_edition}Negative{}",
                    "{C:attention}Joker card{}, {C:money}-$#1#{} for each",
                    "{C:dark_edition}Negative{} Joker owned",
                    "{C:inactive}(Joker has no {C:attention}sell value{C:inactive})"
                }
            },
            c_fmod_bang_gun = {
                name = "Bang Gun",
                text = {
                    "Select {C:attention}#1#{} cards, copy the {C:attention}suit",
                    "of the {C:attention}left{} card onto the {C:attention}right{}",
                    "card"
                }
            },
            c_fmod_squirt_flower = {
                name = "Squirt Flower",
                text = {
                    "Select {C:attention}#1#{} cards, copy the {C:attention}seal",
                    "of the {C:attention}left{} card onto the {C:attention}right{}",
                    "card"
                }
            },
            c_fmod_whoopie_cushion = {
                name = "Whoopie Cushion",
                text = {
                    "Select {C:attention}#1#{} cards, copy the",
                    "{C:attention}Enhancement{} of the {C:attention}left",
                    "card onto the {C:attention}right{} card"
                }
            },
            c_fmod_joy_buzzer = {
                name = "Joy Buzzer",
                text = {
                    "Select {C:attention}#1#{} cards, copy",
                    "the {C:dark_edition}Edition{} of the {C:attention}left",
                    "card onto the {C:attention}right{} card"
                }
            },
            c_fmod_midway_games = {
                name = "Midway Games",
                text = {
                    "Gives a {C:attention}Standard Tag{},",
                    "{C:tarot}Charm Tag{}, {C:planet}Meteor Tag{},",
                    "or {C:inactive}Buffoon Tag{}"
                }
            },
            c_fmod_juggler = {
                name = "Juggler",
                text = {
                    "Gain {C:money}$#1#{}. Increases",
                    "by +{C:money}$#2#{} each time",
                    "a Juggler card is",
                    "used in this run"
                }
            },
            c_fmod_balloons = {
                name = "Ballooons",
                text = {
                    "All cards held in hand gain",
                    "extra chips equal to {C:attention}double",
                    "their total {C:chips}Chip value",
                    "{C:inactive}(Excludes {C:dark_edition}Editions{C:inactive})"
                }
            },
            c_fmod_split_pants = {
                name = "Split Pants",
                text = {
                    "Decreases rank of",
                    "up to {C:attention}#1#{} selected",
                    "cards by {C:attention}1",
                }
            },
            c_fmod_balloon_animal = {
                name = "Balloon Animal",
                text = {
                    "Gain {C:money}$#1#{} per unique",
                    "{C:attention}rank{} in your hand",
                    "{C:inactive}(Currently {C:money}$#2#{C:inactive})"
                }
            },
            c_fmod_soully = {
                name = "Soully",
                text = {
                    "Creates a {C:legendary,E:1}Legendary{} Joker",
                    "from the Lucky Rabbit Mod",
                    "{C:inactive}(Must have room)"
                }
            },
            c_fmod_tightrope = {
                name = "Tightrope",
                text = {
                    "{C:green}1 in 2{} chance to create",
                    "{C:attention}1{} copy of {C:attention}1{} selected card",
                    "{C:green}1 in 4{} chance to create",
                    "{C:attention}2{} copies",
                    "{C:green}1 in 4{} chance to {C:red}destroy{}",
                    "selected card",
                    "{C:inactive}(Odds cannot be changed)"
                }
            },
            c_fmod_fire_breath = {
                name = "Fire Breath",
                text = {
                    "Destroys a selected {C:attention}Joker{} and",
                    "copies its {C:dark_edition}Edition{} onto the",
                    "{C:attention}Joker{} to its right"
                }
            },
            c_fmod_rodeo = {
                name = "Rodeo",
                text = {
                    "Select {C:attention}#1#{} cards. A random one",
                    "will be given {C:dark_edition}Foil{}, {C:dark_edition}Holographic{},",
                    "or {C:dark_edition}Polychrome{}, and the other",
                    "will be {C:attention}destroyed"
                }
            },
            c_fmod_endless_scarf = {
                name = "Endless Scarf",
                text = {
                    "{C:attention}+#1#{} hand size for the",
                    "next, or current, round"
                }
            },
            c_fmod_knife_throw = {
                name = "Knife Throw",
                text = {
                    "Select up to {C:attention}#1#{} cards,",
                    "each selected card will",
                    "either gain a random",
                    "{C:attention}Seal{}, or be destroyed"
                }
            },
            c_fmod_trapeze = {
                name = "Trapeze",
                text = {
                    "After this card has been used",
                    "{C:attention}#2#{} times, its next occurance",
                    "will be replaced by a {C:attention}Soul{} card",
                    "{C:inactive}(Currently {C:attention}#1#{C:inactive}/#2#)"
                }
            },
            c_fmod_greasepaint = {
                name = "Greasepaint",
                text = {
                    "Select up to {C:attention}#1#{} cards to",
                    "{C:attention}mark{} with {C:attention}Ink{}",
                }
            },
            c_fmod_unicycle = {
                name = "Unicycle",
                text = {
                    "Select up to {C:attention}#1#{} cards to",
                    "{C:attention}mark{} with a {C:attention}Crease{}",
                }
            },
            c_fmod_cannon = {
                name = "Cannon",
                text = {
                    "Select up to {C:attention}#1#{} cards to",
                    "{C:attention}mark{} with a {C:attention}Pinhole{}",
                }
            }
        },
        Voucher = {
            v_fmod_circus = {
                name = "Circus",
                text = {
                    "{V:1}Silly Cards{} may",
                    "appear in any of",
                    "the {C:tarot}Arcana{} packs"
                }
            },
            v_fmod_showtime = {
                name = "Showtime",
                text = {
                    "{V:1}Silly Cards{} can",
                    "be purchased",
                    "in the {C:attention}shop{}"
                }
            },
            v_fmod_reroll_superfluity = {
                name = "Reroll Superfluity",
                text = {
                    "Rerolls only increase",
                    "in price {C:attention}every",
                    "{C:attention}other{} reroll"
                }
            },
            v_fmod_buffet = {
                name = "Buffet",
                text = {
                    "Permanently gain yet",
                    "another {C:blue}+#1#{}",
                    "hands per round"
                }
            },
            v_fmod_dumpster_ritual = {
                name = "Dumpster Ritual",
                text = {
                    "Permanently gain",
                    "yet another {C:red}+#1#{}",
                    "discards each round"
                }
            },
            v_fmod_anti_higgs_boson = {
                name = "Anti-Higgs Boson",
                text = {
                    "Additional {C:dark_edition}+1{} Joker Slot",
                    "{C:inactive}Blank{} and {C:dark_edition}Antimatter{}",
                    "vouchers are reintroduced",
                    " into the voucher pool"
                }
            },
            v_fmod_big_bang = {
                name = "Big Bang",
                text = {
                    "{C:attention}-#1#{} Ante,",
                    "{C:attention}-#2#{} hand size"
                }
            },
            v_fmod_color_swatches = {
                name = "Color Swatches",
                text = {
                    "Permanently gain",
                    "yet another",
                    "{C:attention}+#1#{} hand size"
                }
            },
            v_fmod_fire_sale = {
                name = "Fire Sale",
                text = {
                    "{C:attention}+#1#{} card slot,",
                    "{C:attention}+#2#{} pack slot",
                    "available in shop",
                }
            },
            v_fmod_coupon = {
                name = "Coupon",
                text = {
                    "{C:attention}+#1#{} consumable slot"
                }
            },
            v_fmod_extreme_couponing = {
                name = "Extreme Couponing",
                text = {
                    "{C:attention}+#1#{} additional consumable slot"
                }
            },
            v_fmod_shopaholic = {
                name = "Shopaholic",
                text = {
                    "Add a {C:attention}free{}",
                    "extra {C:attention}booster",
                    "{C:attention}pack{} to the shop"
                }
            }
        },
        Other = {
            p_fmod_silly_small = {
                name = "Silly Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {V:1}Silly{} cards to",
                    "be used immediately"
                }
            },
            p_fmod_silly_small_2 = {
                name = "Silly Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {V:1}Silly{} cards to",
                    "be used immediately"
                }
            },
            p_fmod_silly_small_3 = {
                name = "Silly Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {V:1}Silly{} cards to",
                    "be used immediately"
                }
            },
            p_fmod_silly_small_4 = {
                name = "Silly Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {V:1}Silly{} cards to",
                    "be used immediately"
                }
            },
            p_fmod_silly_jumbo = {
                name = "Jumbo Silly Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {V:1}Silly{} cards to",
                    "be used immediately"
                }
            },
            p_fmod_silly_jumbo_2 = {
                name = "Jumbo Silly Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {V:1}Silly{} cards to",
                    "be used immediately"
                }
            },
            p_fmod_silly_mega = {
                name = "Mega Silly Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {V:1}Silly{} cards to",
                    "be used immediately"
                }
            },
            p_fmod_silly_mega_2 = {
                name = "Mega Silly Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {V:1}Silly{} cards to",
                    "be used immediately"
                }
            },
            fmod_ink_mark = {
                name = "Inked",
                text = {
                    "This card can no",
                    "longer be {C:attention}flipped"
                }
            },
            fmod_crease_mark = {
                name = "Creased",
                text = {
                    "This card is prioritized",
                    "to the {C:attention}top{} of the",
                    "draw order"
                }
            },
            fmod_pinhole_mark = {
                name = "Pinholed",
                text = {
                    "This card is {C:attention}returned",
                    "to the deck when played",
                }
            }
        }
    },
    misc = {
        dictionary = {
            k_fmod_fuel = "Fueled!",
            k_fmod_drained = "Drained!",
            k_fmod_upgraded = "Upgraded!",
            k_fmod_sillypack = "Silly Pack",
            r_fmod_mostplayed = "(most played rank)",
            k_fmod_config_restart = "Requires Restart",
            k_fmod_config_jokers = "Enable Jokers",
            k_fmod_config_silly = "Enable Silly Cards",
            k_fmod_config_vouchers = "Enable Vouchers",
            k_fmod_config_blinds = "Enable Blinds",
            k_fmod_config_tags = "Enable Tags",
            k_fmod_config_decks = "Enable Decks",
        },
        labels = {
            fmod_ink_mark = "Inked",
            fmod_crease_mark = "Creased",
            fmod_pinhole_mark = "Pinholed",
        },
    }
}
