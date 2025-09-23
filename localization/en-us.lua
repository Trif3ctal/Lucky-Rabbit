return {
    descriptions = {
        Joker = {
            j_fmod_generator = {
                name = "Generator",
                text = {
                    "Retrigger all {C:attention}played cards{}",
                    "{C:red}Destroy{} {C:attention}leftmost{} consumable at",
                    "start of round, {C:red}self destructs{} if",
                    "no consumable can be destroyed"
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
                    "Each played {C:attention}3{} is",
			        "retriggered {C:attention}3{} times"
                }
            },
            j_fmod_penny_joker = {
                name = "Penny Joker",
                text = {
                    "Gains {C:chips}+#2#{} Chip for",
			        "every card scored",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
                }
            },
            j_fmod_countdown = {
                name = "Countdown",
                text = {
                    "The next {C:attention}#1#{} scored gives {C:mult}+#2#{} Mult,",
			        "then required rank decreases by {C:attention}1{}",
                    "When an {C:attention}#3#{} is reached and scored,",
                    "it gives {X:mult,C:white}X#4#{} Mult"
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
                    "has exactly {C:attention}#1#{} cards,",
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
                    "{C:attention}poker hand{} played,",
                    "resets after {C:attention}Boss Blind{}",
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
                    "The next {C:attention}#2#{} times",
                    "you would {C:attention}die{}, instead",
                    "resume the round with {C:blue}+1{} hand",
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
                    "{C:attention}Gold Cards{} give {X:mult,C:white}X#1#{} Mult",
                    "when held in hand",
                    "{C:attention}Steel Cards{} give {C:money}$#2#{}",
                    "at end of round",
                    "{C:inactive}(Overrides default behavior)"
                }
            },
            j_fmod_jazzercise = {
                name = "Jazzercise Joker",
                text = {
                    "Gains {C:attention}+#1#{} hand size for",
                    "every {C:attention}#2# {C:inactive}[#3#]{} cards destroyed",
                    "{C:inactive}(Currently {C:attention}+#4#{C:inactive})"
                }
            },
            j_fmod_pomni = {
                name = "Pomni",
                text = {
                    "After skipping {C:attention}#2#{} Blinds, {C:attention}-#1#{} Ante",
                    "{C:green}#3# in #4#{} chance for {C:attention}-#5#{} Ante instead",
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
                    "hand contains a scoring",
                    "{C:attention}3{}, {C:attention}7{}, {C:attention}8{}, or {C:attention}Queen{}",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                }
            },
            j_fmod_hyperfixation = {
                name = "Hyperfixation",
                text = {
                    "Each played {C:attention}#1#{} of {V:1}#2#{}",
                    "is retriggered {C:attention}#3#{} time#7#",
                    "Gains {C:attention}1{} retrigger every {C:attention}#5#{} {C:inactive}[#6#]{} times",
                    "a round's {C:attention}required rank{} (#4#) is scored",
                    "{C:inactive}(Required rank changes every round)"
                }
            },
            j_fmod_fragile_sticker = {
                name = "Fragile Sticker",
                text = {
                    "{C:attention}Glass Cards{} no longer",
                    "break through use",
                }
            },
            j_fmod_ghost_trick = {
                name = "Ghost Trick",
                text = {
                    "Played cards have a {C:green}#1# in #2#{} chance",
                    "to create a {C:dark_edition}Negative {C:spectral}Spectral{}",
                    "card when {C:attention}retriggered",
                }
            },
            j_fmod_rabbit = {
                name = "Rabbit",
                text = {
                    "The first {C:attention}#1#{} times each round",
                    "you play a {C:attention}Five of a Kind{},",
                    "create a {C:attention}copy{} of the leftmost",
                    "played card and {C:attention}discard{} it",
                    "{C:inactive}(Currently {C:attention}#2#{C:inactive} remaining){}"
                }
            },
            j_fmod_crazy_neils_crazy_deals = {
                name = "Crazy Neil's Crazy Deals",
                text = {
                    "One random shop item is",
                    "{C:attention}#1#%{} off every shop"
                }
            },
            j_fmod_pop_idol_cat = {
                name = "Pop Idol Cat",
                text = {
                    "Increase the {C:green}odds{} of {C:attention}Lucky",
                    "{C:attention}Cards{} by {C:green}#1#{} every time one",
                    "{C:green}successfully{} triggers, {C:attention}resets{}",
                    "after hand played"
                }
            },
            j_fmod_pub_burger = {
                name = "Pub Burger",
                text = {
                    "{C:attention}+#1#{} discards, {C:red}-#2#{}",
                    "for every hand played",
                    "after the first hand"
                }
            },
            j_fmod_orbit = {
                name = "Orbit",
                text = {
                    "If holding a non-{C:dark_edition}Negative",
                    "{C:planet}Planet{} card at end of round,",
                    "create a random {C:dark_edition}Negative {C:planet}Planet{}",
                    "with {C:attention}halved{} sell value",
                }
            },
            j_fmod_calculator = {
                name = "Calculator",
                text = {
                    "Gives {X:mult,C:white}XMult{} equal to the {C:attention}rank difference",
                    "between first and last {C:attention}scored{} cards,",
                    "{C:red}inactive{} for that many hands after scoring",
                    "{C:inactive}(No effect if difference <= 1)",
                    "{C:inactive}(#1#{C:attention}#2#{C:inactive}#3#)",
                }
            },
            j_fmod_tax_return = {
                name = "Tax Return",
                text = {
                    "Earn {C:money}$#1#{} for each",
                    "{C:attention}unscored{} card in",
                    "played hand",
                }
            },
            j_fmod_civic_secretary = {
                name = "Civic Secretary",
                text = {
                    "When another Joker gives",
                    "{C:chips}+Chips{} or {C:mult}+Mult{}, that amount",
                    "is {C:attention}matched{} by this Joker"
                }
            },
            j_fmod_trans_joker = {
                name = "Trans Joker",
                text = {
                    "Any cards that have had",
                    "their {C:attention,V:1}rank{} or {C:attention,V:2}suit{} changed",
                    "gain {C:mult}+#1#{} Mult"
                }
            },
            j_fmod_litterbug = {
                name = "Litterbug",
                text = {
                    "When hand played, {C:attention}discards{} a",
                    "random card and gains {C:white,X:mult}#2#X{}",
                    "its base {C:chips}Chip value{} as {C:mult}XMult{}",
                    "{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult)"
                }
            },
            j_fmod_sad_clown = {
                name = "Sad Clown",
                text = {
                    "Creates a random {V:1}Silly{} card",
                    "every {C:attention}#1# {C:inactive}[#2#]{} discards",
                    "{C:inactive}(Must have room)"
                }
            },
            j_fmod_claw_machine = {
                name = "Claw Machine",
                text = {
                    "Each {C:attention}7{} held in hand gives",
                    "{C:white,X:mult}X#1#{} Mult, and has a {C:green}#2#",
                    "{C:green}in #3#{} chance to increase",
                    "given Mult by {C:white,X:mult}X#4#"
                }
            },
            j_fmod_fennex_the_clown = {
                name = "Fennex the Clown",
                text = {
                    "This Joker gains {C:white,X:mult}X#1#{}",
                    "Mult per {C:attention}Voucher{} owned",
                    "{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive})"
                }
            },
            j_fmod_dating_sim = {
                name = "Dating Sim",
                text = {
                    "Played {C:hearts}Hearts{} permanently",
                    "gain {C:chips}+#1#{} Chips when",
                    "scored"
                }
            },
            j_fmod_rhythm_game = {
                name = "Rhythm Game",
                text = {
                    "Played {C:diamonds}Diamonds{C:attention} retrigger",
                    "when scored"
                }
            },
            j_fmod_dungeon_crawler = {
                name = "Dungeon Crawler",
                text = {
                    "If played hand contains a",
                    "scoring {C:spades}Spade{}, a {C:spades}Spade in",
                    "that hand is given a random",
                    "{C:attention}Enhancement{}, {C:attention}Seal{}, or {C:attention}Marking{}",
                    "{C:inactive}(Won't override existing modifiers)"
                }
            },
            j_fmod_fighting_game = {
                name = "Fighting Game",
                text = {
                    "Played {C:clubs}Clubs{} have a",
                    "{C:green}#1# in #2#{} chance to",
                    "give {C:attention}+#3# hand size{}",
                    "until end of round"
                }
            },
            j_fmod_free_shipping = {
                name = "Free Shipping",
                text = {
                    "Consumables created",
                    "by {C:attention}Raffle Cards{} are",
                    "{C:dark_edition}Negative"
                }
            },
            j_fmod_comic_book_ad = {
                name = "Comic Book Ad",
                text = {
                    "{C:attention}Raffle Cards{} always",
                    "generate {V:1}Silly{} cards"
                }
            },
            j_fmod_lottery = {
                name = "Lottery",
                text = {
                    "{C:green}#1# in #2#{} chance to gain",
                    "between {C:money}$#3#{} and {C:money}$#4# {C:attention}sell",
                    "{C:attention}value{} at end of round"
                }
            },
            j_fmod_detective = {
                name = "Detective",
                text = {
                    "{C:attention}Cards{} that were previously",
                    "played this {C:attention}Ante{} give {C:money}$#1#",
                }
            },
            j_fmod_strange_dreams = {
                name = "Strange Dreams",
                text = {
                    "After hand played, turn",
                    "a random {C:attention}unscored{} card",
                    "into the {C:attention}rightmost scored",
                    "card"
                }
            },
            j_fmod_ransome = {
                name = "Ransome",
                text = {
                    "When a card is {C:attention}destroyed{},",
                    "creates a {C:dark_edition}Polychrome{} copy",
                    "with a {C:red}Red Seal{}"
                }
            },
            j_fmod_feline_fleecer = {
                name = "Feline Fleecer",
                text = {
                    "Add a free {C:attention}Remix Pack",
                    "to the {C:attention}Shop{} upon",
                    "beating a {C:attention}Blind"
                }
            },
            j_fmod_tem_shop = {
                name = "Tem Shop",
                text = {
                    "{C:attention}Sell value{} of all cards",
                    "starts off at {C:attention}75%{} of",
                    "their {C:attention}base{} price",
                }
            },
            j_fmod_debut_album = {
                name = "Debut Album",
                text = {
                    "{C:white,X:mult}X#1#{} Mult, {C:white,X:mult}-X#2#{} Mult",
                    "per hand played",
                    "{C:inactive}(Self destructs at {C:white,X:mult}X1{C:inactive} Mult)",
                }
            },
            j_fmod_zany_to_the_max = {
                name = "Zany to the Max",
                text = {
                    "If played hand is a {C:attention}Three of a Kind,",
                    "gain {C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult, or {C:white,X:mult}+X#3#{} Mult",
                    "{C:inactive}(Currently {C:chips}+#4#{C:inactive} Chips, {C:mult}+#5#{C:inactive} Mult, {C:white,X:mult}X#6#{C:inactive} Mult)",
                }
            },
            j_fmod_ghostly_joker = {
                name = "Ghostly Joker",
                text = {
                    "Creates a {C:attention}Death{} {C:tarot}Tarot{} card for",
                    "every {C:attention}fourth{} scoring {C:attention}4 {C:inactive}[#1#]",
                    "{C:inactive}(Must have room)"
                }
            },
            j_fmod_friend_inside_me = {
                name = "Friend Inside Me",
                text = {
                    "If {C:attention}first discard{} of round has",
                    "only {C:attention}1{} card, {C:attention}destroy{} it and",
                    "create {C:attention}#1#{} temporary copies",
                    "{C:inactive}(Destroyed at end of round)",
                }
            },
            j_fmod_prismatic_joker = {
                name = "Prismatic Joker",
                text = {
                    "If played hand contains a",
                    "{C:attention}Four of a Kind{}, all {C:attention}scored",
                    "cards become {C:attention}Copycat",
                    "{C:attention}Cards"
                }
            },
            j_fmod_newtons_cradle = {
                name = "Newton's Cradle",
                text = {
                    "For every non-{C:attention}High Card{} hand",
                    "played consisting of only {V:1}#1#{},",
                    "the {C:attention}rightmost{} card gains {C:attention}#3#{}",
                    "retriggers {C:inactive}(Currently {C:attention}#2#{C:inactive})",
                    "{C:inactive}(Retriggers reset, suit changes",
                    "{C:inactive}at end of round)",
                }
            },
            j_fmod_working_joker = {
                name = "Working Joker",
                text = {
                    "{C:attention}5{}s, {C:attention}6{}s, {C:attention}7{}s, {C:attention}8{}s, and {C:attention}9{}s each give",
                    "{C:mult}+#1#{} Mult when scored",
                }
            },
            j_fmod_hypeman = {
                name = "Hypeman",
                text = {
                    "{C:mult}+#1#{} Mult for each {C:attention}Mult{}",
                    "card in full deck",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                }
            },
            j_fmod_and_thats_not_all = {
                name = "And That's Not All!",
                text = {
                    "{C:mult}+#1#{} Mult for each",
                    "{C:attention}Bonus{} Card scored",
                    "{C:mult}-#1#{} Mult for each",
                    "{C:attention}Bonus{} Card discarded",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                }
            },
            j_fmod_double_down = {
                name = "Double Down",
                text = {
                    "{C:attention}Seal{} effects are",
                    "triggered {C:attention}twice{}"
                }
            }
        },
        Tag = {
            tag_fmod_appraisal = {
                name = "Appraisal Tag",
                text = {
                    "Gives {C:money}$#1#{} for each {C:attention}Enhanced",
                    "card in your full deck",
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
                    "Adds two {C:attention}free",
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
            },
            bl_fmod_thorn = {
                name = "The Thorn",
                text = {
                    "Cards with seals",
                    "are debuffed"
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
                    "Start run with the",
                    "{C:attention,T:j_fmod_fennex}Fennex{} Joker,",
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
                    "Every Boss Blind is a",
                    "{C:attention}Finisher Blind{} with {X:mult,C:white}X2{} {C:red}Size{}",
                    "{C:chips}+1{} Hand, {C:red}+1{} Discard, {C:attention}+1{}",
                    "Hand Size, {C:attention}+1{} Joker Slot"
                }
            },
            b_fmod_harmony = {
                name = "Harmony Deck",
                text = {
                    "All cards in deck are",
                    "the same {C:attention}rank{} and {C:attention}suit{}",
                    "{C:red}-2{} Discards"
                }
            }
        },
        Silly = {
            c_fmod_pie = {
                name = "Pie",
                text = {
                    "Select {C:attention}#1#{} cards, copy the",
                    "{C:attention}rank{} of the {C:attention}left{} card",
                    "onto the {C:attention}right{} card"
                }
            },
            c_fmod_clown_car = {
                name = "Clown Car",
                text = {
                    "Creates a random {C:dark_edition}Negative{}",
                    "{C:attention}Joker{}, {C:money}-$#1#{} for each",
                    "{C:dark_edition}Negative{} Joker owned",
                    "{C:inactive}(Joker has no {C:attention}sell value{C:inactive})"
                }
            },
            c_fmod_bang_gun = {
                name = "Bang Gun",
                text = {
                    "Select {C:attention}#1#{} cards, copy the",
                    "{C:attention}suit{} of the {C:attention}left{} card",
                    "onto the {C:attention}right{} card"
                }
            },
            c_fmod_squirt_flower = {
                name = "Squirt Flower",
                text = {
                    "Select {C:attention}#1#{} cards, copy the",
                    "{C:attention}seal{} of the {C:attention}left{} card",
                    "onto the {C:attention}right{} card"
                }
            },
            c_fmod_whoopie_cushion = {
                name = "Whoopie Cushion",
                text = {
                    "Select {C:attention}#1#{} cards, copy the",
                    "{C:attention}Enhancement{} of the {C:attention}left card",
                    "onto the {C:attention}right{} card"
                }
            },
            c_fmod_joy_buzzer = {
                name = "Joy Buzzer",
                text = {
                    "Select {C:attention}#1#{} cards, copy the",
                    "{C:dark_edition}Edition{} of the {C:attention}left card",
                    "onto the {C:attention}right{} card"
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
                    "Juggler is used this run"
                }
            },
            c_fmod_balloons = {
                name = "Balloons",
                text = {
                    "{C:attention}Doubles{} the {C:chips}Chip value{}",
                    "of all cards held in hand",
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
                    "from the {C:attention}Lucky Rabbit{} Mod",
                    "{C:inactive}(Must have room)"
                }
            },
            c_fmod_tightrope = {
                name = "Tightrope",
                text = {
                    "{C:green}50%{} chance to create",
                    "{C:attention}#1#{} copy of {C:attention}#2#{} selected card",
                    "{C:green}25%{} chance to create",
                    "{C:attention}#3#{} copies",
                    "{C:green}25%{} chance to {C:red}destroy{}",
                    "selected card",
                    "{C:inactive}(Odds cannot be changed)"
                }
            },
            c_fmod_fire_breath = {
                name = "Fire Breath",
                text = {
                    "Destroy selected {C:attention}Joker{}, then",
                    "copy its {C:dark_edition}Edition{} onto the",
                    "{C:attention}Joker{} to its right"
                }
            },
            c_fmod_rodeo = {
                name = "Rodeo",
                text = {
                    "Select {C:attention}#1#{} cards. Give a random one",
                    "{C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or {C:dark_edition}Polychrome{},",
                    "and {C:red}destroy{} the other"
                }
            },
            c_fmod_endless_scarf = {
                name = "Endless Scarf",
                text = {
                    "{C:attention}+#1#{} hand size",
                    "until end of round"
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
                    "After using Trapeze {C:attention}#2#{} times,",
                    "its next appearance will be",
                    "replaced by a {C:attention}Soul{} card",
                    "{C:inactive}(Currently {C:attention}#1#{C:inactive}/#2#)"
                }
            },
            c_fmod_greasepaint = {
                name = "Greasepaint",
                text = {
                    "Select up to {C:attention}#1#{} cards",
                    "to {C:attention}mark{} with {C:attention}Ink{}",
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
            },
            c_fmod_barker = {
                name = "Barker",
                text = {
                    "Enhances {C:attention}#1#",
                    "selected cards into",
                    "{C:attention}Raffle Cards{}",
                }
            },
            c_fmod_suspenders = {
                name = "Suspenders",
                text = {
                    "Select {C:attention}#1#{} cards, copy the",
                    "{C:attention}Clip{} of the {C:attention}left{} card",
                    "onto the {C:attention}right{} card",
                }
            },
            c_fmod_hall_of_mirrors = {
                name = "Hall of Mirrors",
                text = {
                    "Enhances {C:attention}#1#",
                    "selected cards into",
                    "{C:attention}Copycat Cards{}",
                }
            },
            c_fmod_crisis = {
                name = "Crisis",
                text = {
                    "Set {C:attention}Ante{} to {C:attention}1{}.",
                    "All cards and stats",
                    "are {C:attention}preserved."
                }
            },
            c_fmod_crisis_col = {
                name = "Crisis",
                text = {
                    "...?"
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
                    "Permanently gain",
                    "yet another {C:blue}+#1#{}",
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
                    "{C:dark_edition}+1{} Joker Slot",
                    "The {C:inactive}Blank{} and {C:dark_edition}Antimatter{}",
                    "{C:attention}Vouchers{} are returned",
                    "to the {C:attention}Voucher{} pool"
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
                    "{C:attention}+#1#{} hand size"
                }
            },
            v_fmod_fire_sale = {
                name = "Fire Sale",
                text = {
                    "{C:attention}+#1#{} card slot,",
                    "{C:attention}+#2#{} {C:attention}Booster Pack{} slot",
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
                    "{C:attention}Booster Pack{}",
                    "to each shop"
                }
            },
            v_fmod_grab_bag = {
                name = "Grab Bag",
                text = {
                    "Open a free {C:attention}Remix{}",
                    "{C:attention}Pack{} upon clearing",
                    "a {C:attention}Boss Blind{}"
                }
            },
            v_fmod_gachapon = {
                name = "Gachapon",
                text = {
                    "{C:attention}Remix Packs{}",
                    "appear in the",
                    "{C:attention}shop"
                }
            },
            v_fmod_mystery_box = {
                name = "Mystery Box",
                text = {
                    "+1 {C:attention}Booster Pack{}",
                    "available in the",
                    "{C:attention}shop"
                }
            }
        },
        Enhanced = {
            m_fmod_raffle_card = {
                name = "Raffle Card",
                text = {
                    "{C:green}#1# in #2#{} chance to create",
                    "a random {C:attention}Consumable",
                    "when scored",
                    "{C:inactive}(Must have room)"
                }
            },
            m_fmod_copycat_card = {
                name = "Copycat Card",
                text = {
                    "All Copycat cards in deck",
                    "become the same random",
                    "{C:attention}rank{} after scoring"
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
            p_fmod_remix_small_1 = {
                name = "Remix Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to {C:attention}#2#",
                    "{C:attention}Jokers{}, {C:attention}Playing{} cards, or",
                    "{C:attention}Consumables{} to add or use"
                }
            },
            p_fmod_remix_small_2 = {
                name = "Remix Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to {C:attention}#2#",
                    "{C:attention}Jokers{}, {C:attention}Playing{} cards, or",
                    "{C:attention}Consumables{} to add or use"
                }
            },
            p_fmod_remix_jumbo = {
                name = "Jumbo Remix Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to {C:attention}#2#",
                    "{C:attention}Jokers{}, {C:attention}Playing{} cards, or",
                    "{C:attention}Consumables{} to add or use"
                }
            },
            p_fmod_remix_mega = {
                name = "Mega Remix Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to {C:attention}#2#",
                    "{C:attention}Jokers{}, {C:attention}Playing{} cards, or",
                    "{C:attention}Consumables{} to add or use"
                }
            },
            fmod_ink_mark = {
                name = "Inked",
                text = {
                    "Cannot be",
                    "{C:attention}debuffed",
                    "or {C:attention}flipped"
                }
            },
            fmod_crease_mark = {
                name = "Creased",
                text = {
                    "Always shuffled to",
                    "the {C:attention}top{} of deck",
                }
            },
            fmod_pinhole_mark = {
                name = "Pinholed",
                text = {
                    "{C:attention}Returns{} to the",
                    "deck when played",
                }
            }
        }
    },
    misc = {
        dictionary = {
            k_fmod_fuel = "Fueled!",
            k_fmod_drained = "Drained!",
            k_fmod_neil_deal = "Discounted!",
            k_fmod_sillypack = "Silly Pack",
            k_fmod_remixpack = "Remix Pack",
            r_fmod_mostplayed = "(most played rank)",
            k_fmod_config_restart = "Requires Restart",
            k_fmod_config_jokers = "Enable Jokers",
            k_fmod_config_silly = "Enable Silly Cards",
            k_fmod_config_vouchers = "Enable Vouchers",
            k_fmod_config_blinds = "Enable Blinds",
            k_fmod_config_tags = "Enable Tags",
            k_fmod_config_decks = "Enable Decks",
            k_fmod_config_markings = "Enable Markings",
            k_fmod_config_enhancements = "Enable Enhancements",
            k_fmod_config_remix = "Enable Remix Packs",
            k_fmod_planet_orbit = "+1 Planet",
            k_fmod_debut_destruct = "Finished!",
            k_fmod_copycat = "Copycat!"
        },
        v_dictionary={
            a_fmod_discards = "+#1# Discards",
            a_fmod_silly_card = "+#1# Silly",
            a_fmod_money = "+$#1#",
            a_fmod_booster = "+#1# Booster",
        },
        labels = {
            fmod_ink_mark = "Inked",
            fmod_crease_mark = "Creased",
            fmod_pinhole_mark = "Pinholed",
        },
    }
}