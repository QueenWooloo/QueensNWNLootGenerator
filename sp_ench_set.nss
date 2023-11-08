#include "nbde_inc"



//Sets the enchant list filters for the new randomized enchantment system. 
//Script: sp_ench_set
void SetEnchants();


//This sets enchantment filters
//Script: sp_ench_set
//sFilter: primary filter (found on spreadsheet: https://docs.google.com/spreadsheets/d/1BVOOR7w2pCWkabDC__6jrmGFKMkIfvb92uWTsnMBGPQ/edit?usp=sharing )
//nWeight: Weight given to enchantment assuming it is eligible (Higher means more likely, each weight is one share)
//nSize: number contributed to enchantment cap
//sName: name used in the decoding library, CASE SENSETIVE
//nRarity: Rarity of chests that will hold item (Higher is rarer)
//nRange: Range of Rarity to be allowed (ex. Rarity is 15, Range is 5, enchantment will be eligible on any rarity where 15 < r <= 20)
//nSecondary: secondary filter (found on spreadsheet: https://docs.google.com/spreadsheets/d/1BVOOR7w2pCWkabDC__6jrmGFKMkIfvb92uWTsnMBGPQ/edit?usp=sharing )
//nTertiary: tertiary filter (found on spreadsheet: https://docs.google.com/spreadsheets/d/1BVOOR7w2pCWkabDC__6jrmGFKMkIfvb92uWTsnMBGPQ/edit?usp=sharing )
//nMaterial: On the off-chance you care about materials, here's your chance to put em' in. This can only be used to search for one material, based on its 2da Entry Number.
// if you need to EXCLUDE ONE material, then put it in as a NEGATIVE VALUE OF ITS 2da Entry Number (This is the number on the left of the 2da, not in the Name Column. A picture of said 2da is on The Spreadsheet.
void LoopFilters(string sFilter, int nWeight, int nSize, string sName, int nRarity, int nRange, int nSecondary = 65535, int nTertiary = 67108863, int nMaterial = 0);

// Loops filters for specific weapons based on nType.
// Here's all the trickle down ints:
//nWeight: Weight given to enchantment assuming it is eligible (Higher means more likely, each weight is one share)
//nSize: number contributed to enchantment cap
//sName: name used in the decoding library, CASE SENSETIVE
//nRarity: Rarity of chests that will hold item (Higher is rarer)
//nRange: Range of Rarity to be allowed (ex. Rarity is 15, Range is 5, enchantment will be eligible on any rarity where 15 < r <= 20)
//nMaterial: On the off-chance you care about materials, here's your chance to put em' in. This can only be used to search for one material, based on its 2da Entry Number.
//nType: Informs which weapons will be looped
//Type = 0 (all weapons), Type = 1 (Melee), Type = 2 (Ranged), Type = 3 (Swords), Type = 4 (Bows), Type = 5 (Crossbows)
//Type = 6 (Slashing), Type = 7 (Piercing), Type = 8 (Pierce/Slashing), Type = 9 (Bludgeoning), Type = 10 (Bludgeoning/Piercing)
//Type = 11 (Shields), Type = 12 (Piercing W/out Bows)
void LoopWeapons(int nWeight, int nSize, string sName, int nRarity, int nRange, int nType = 0, int nMaterial = 0);



const string ENCHANT = "Enchant_Database";
const int SECONDMAX = 65535;  // Easy filtermaxes in case you need to just use the material function at the end
const int THIRDMAX = 67108863;
void SetEnchants()
{
    SendMessageToAllDMs("Enchantment setting process started");

    object oMod = GetModule();
    int i;
    for (i=0;i<15;i++)
    {
        NBDE_SetCampaignInt(ENCHANT, IntToString(i), 0);
        NBDE_FlushCampaignDatabase(ENCHANT);
    }

                           //If there are multiple different categories listed, futher filters are not allowed. Split the enchant into multiple entries into that case.
                           // easy number calculator https://docs.google.com/spreadsheets/d/1BVOOR7w2pCWkabDC__6jrmGFKMkIfvb92uWTsnMBGPQ/edit?usp=sharing
                           // EASY NUMBER KEYS:
                           // All: 65535
                           // Hands Only: 1024
                           // Rings Only: 256

/*
    // Example 1 From Queen: Shooting Stars.
    // Only Applicable on Swords, Shields, Rings
    LoopFilters("1024",                 //Hands only
                5,                      //Weight is 5
                1,                      //Size is 1, contributes 1 to the enchantment cap
                "ShootingStars",        //Name (Check it out! It's part of the demo!)
                0,                     //rarity
                100,                     //range
                16,                     //Filter to simple only
                81922);                 //Just daggers and katar lol
    LoopFilters("1024",                 //========> These secondary options are for the martial and exotic swords. This IS necessary. If you're using the tertiary filter, you MUST only have one secondary filter and use multiple entries.
                5,
                1,                      //If you're NOT using tertiary filters, then by all means go for the secondary ones :)
                "ShootingStars",
                0,
                100,
                8,                      //Martial
                421380);                 //Greatsword, Longsword, Rapier, Scimitar, Shortsword
   LoopFilters("1024",
                5,
                1,
                "ShootingStars",
                0,
                100,
                4,                      //Exotic
                14945);                   //Bastard Sword, Katana, Kukri (It's a knife, okay?), Two-Bladed Sword
   LoopFilters("1024",
                5,
                1,
                "ShootingStars",
                0,
                100,
                2);                    //Shields, All of em baby!
   LoopFilters("256",                  //Rings Only
                5,
                1,
                "ShootingStars",
                0,
                100);                   //No Further Sorting Necessary, works on all rings :)


   // Example 2 From Queen: Esoteric Cleave.
   // Only Applicable on Exotic and Simple Weapons and Mithril Boots
   LoopFilters("1024",
                20,
                2,
                "EsotericCleave",
                15,
                20,
                20);                    //Exotic and Simple Weapons. None else.
   LoopFilters("4096",
                20,
                2,
                "EsotericCleave",
                15,
                20,
                65535,                  //Unused Secondary and Tertiary filters should be set to maximum values to not confuse the system.
                131071,
                11);                    //so we can move to use the material slot, a much less used item on the function. Mithral is id 11.

*/

// Enchantments Listed Below 

// Weapons
    //+1 - +5 Weapons
    LoopWeapons(50, 1, "EnhancementBonus1", 0, 20);

    LoopWeapons(50, 2, "EnhancementBonus2", 20, 20);

    LoopWeapons(50, 3, "EnhancementBonus3", 40, 20);

    LoopWeapons(50, 4, "EnhancementBonus4", 60, 20);

    LoopWeapons(50, 5, "EnhancementBonus5", 80, 20);

    //Vampiric
    LoopWeapons(10, 1, "Vampiric", 40, 40);

    //Vorpal
    LoopWeapons(5, 5, "Vorpal", 80, 20, 6); //Slashing
    LoopWeapons(5, 5, "Vorpal", 80, 20, 8); //Slash/Piercing

    //Bursting
    LoopWeapons(5, 5, "Bursting", 80, 20);

    //Poison Weapon
    LoopWeapons(10, 2, "PoisonWeapon1", 20, 20);

    LoopWeapons(10, 4, "PoisonWeapon2", 40, 20);

    LoopWeapons(10, 6, "PoisonWeapon2", 60, 20);

    //Keen  Only on Piercing, Slashing, and Pierce/Slashing melee weapons
    LoopWeapons(10, 2, "Keen", 10, 40, 6); //Slashing
    LoopWeapons(10, 2, "Keen", 10, 40, 12);  //Piercing but only the Melee ones
    LoopWeapons(10, 2, "Keen", 10, 40, 8); //Slash/Piercing

    //of Force
    LoopWeapons(10, 2, "ForceWeapon", 25, 40);

    //of Subtlety
    LoopWeapons(10, 2, "SubtleWeapon", 25, 40);

    //AlignedWeapon (handle specific later)
    LoopWeapons(10, 2, "AlignedWeapon", 10, 40);
    LoopFilters("2048", 10, 2, "AlignedWeapon", 10, 40, 1); //Gauntlets

    //NeutralWeapon (handle specific later)
    LoopWeapons(4, 5, "AlignedNeutrality", 10, 40);
    LoopFilters("2048", 4, 5, "AlignedNeutrality", 10, 40, 1); //Gauntlets

    //Melee Exclusives

    //Cleaving
    LoopWeapons(15, 1, "Cleaving", 10, 40, 1);

    //Bow Exclusives

    //Returning
    LoopWeapons(10, 1, "Returning", 0, 40, 4);

    //Mighty
    LoopWeapons(30, 1, "Mighty1", 0, 20, 4);
    LoopWeapons(30, 2, "Mighty2", 20, 20, 4);
    LoopWeapons(30, 3, "Mighty3", 40, 20, 4);

    //Armor Enchants
    //Proof Against Transmutation
    LoopFilters("8192", 5, 4, "ProofAgainstTransmute", 60, 40);

    //Robe Enchants
    //of Scintillating Colors
    LoopFilters("8192", 5, 3, "RobeofScintillatingColors", 40, 20, 1);

    // Ring Enchants

    // Regen
    LoopFilters("256", 10, 5, "Regeneration", 80, 20);

    // Mind Protection
    LoopFilters("256", 15, 3, "MindProtection", 40, 40);

    // Evasion
    LoopFilters("256", 10, 4, "Evasion", 60, 40);

    // Of Spellcasting (handle specific Later)
    LoopFilters("256", 20, 1, "RingSpellcasting", 30, 40);

    // Belt Specific Enchants

    //Holy Might
    LoopFilters("64", 20, 1, "HolyMight", 20, 40);

    // Saddle Master
    LoopFilters("64", 15, 1, "SaddleMaster1", 10, 30);
    LoopFilters("64", 15, 2, "SaddleMaster2", 40, 30);

    // Mobility
    LoopFilters("64", 5, 3, "Mobility", 40, 40);

    // of Guiding Light
    LoopFilters("64", 15, 2, "GuidingLight", 60, 40);

    // Amulet Specific Enchants

    // Adaptation
    LoopFilters("128", 15, 2, "Adaptation", 20, 40);

    // Shield Specific Enchants
    // Wolf Shield
    LoopWeapons(20, 1, "Wolf", 0, 40, 11); // Shields

    // Helm Specific Enchants
    //Mind Protection
    LoopFilters("16384", 20, 3, "MindProtection", 80, 20);

    //of Knowledge
    LoopFilters("16384", 20, 1, "KnowledgeHat", 20, 40);

    // of The Night
    LoopFilters("16384", 30, 1, "NightHat", 20, 40);

    // of Petrification
    LoopFilters("16384", 20, 1, "PetrificationHat", 40, 40);

    // of True Sight
    LoopFilters("16384", 10, 1, "KnowledgeHat", 60, 40);

    // Night Walker's
    LoopFilters("16384", 25, 4, "UnderdarkHat", 60, 40);

    // of Foresight
    LoopFilters("16384", 10, 2, "ForesightHat", 60, 40);

    // Cloak Specific Enchants

    // of Displacement
    LoopFilters("512", 20, 1, "Displacement", 20, 40);

    // of Negative Plane Protection
    LoopFilters("512", 5, 3, "NegativeProtection", 60, 40);

    // Boots Specific Enchants
    // of The Gargoyle
    LoopFilters("4096", 15, 1, "GargoyleBoots", 40, 40);

    // of Reflexes
    LoopFilters("4096", 30, 1, "ReflexBoots1", 0, 20);
    LoopFilters("4096", 30, 2, "ReflexBoots2", 20, 20);
    LoopFilters("4096", 30, 3, "ReflexBoots3", 40, 20);
    LoopFilters("4096", 30, 4, "ReflexBoots4", 60, 20);
    LoopFilters("4096", 30, 5, "ReflexBoots5", 80, 20);

    // Wondrous Items
    // Bags of Holding
    LoopFilters("32768", 50, 1, "Holding1", 0, 20);
    LoopFilters("32768", 50, 1, "Holding2", 20, 20);
    LoopFilters("32768", 50, 1, "Holding3", 40, 20);
    LoopFilters("32768", 50, 1, "Holding4", 60, 20);
    LoopFilters("32768", 50, 1, "Holding5", 80, 20);

    // Mixed Enchants
    // +1 - +5 AC
    LoopWeapons(20, 1, "ACBonus1", 0, 20, 1);  //Melee Weapons
    LoopWeapons(20, 2, "ACBonus2", 20, 20, 1);
    LoopWeapons(20, 3, "ACBonus3", 40, 20, 1);
    LoopWeapons(20, 4, "ACBonus4", 60, 20, 1);
    LoopWeapons(20, 5, "ACBonus5", 80, 20, 1);

    LoopWeapons(50, 1, "ACBonus1", 0, 20, 11); // Shields
    LoopWeapons(50, 2, "ACBonus2", 20, 20, 11);
    LoopWeapons(50, 3, "ACBonus3", 40, 20, 11);
    LoopWeapons(50, 4, "ACBonus4", 60, 20, 11);
    LoopWeapons(50, 5, "ACBonus5", 80, 20, 11);

    LoopFilters("8192", 50, 1, "ACBonus1", 0, 20);//Armor
    LoopFilters("8192", 50, 2, "ACBonus2", 20, 20);//Armor
    LoopFilters("8192", 50, 3, "ACBonus3", 40, 20);//Armor
    LoopFilters("8192", 50, 4, "ACBonus4", 60, 20);//Armor
    LoopFilters("8192", 50, 5, "ACBonus5", 80, 20);//Armor

    LoopFilters("256", 50, 1, "ACBonus1", 0, 20);//Rings
    LoopFilters("256", 50, 2, "ACBonus2", 20, 20);//Rings
    LoopFilters("256", 50, 3, "ACBonus3", 40, 20);//Rings
    LoopFilters("256", 50, 4, "ACBonus4", 60, 20);//Rings
    LoopFilters("256", 50, 5, "ACBonus5", 80, 20);//Rings

    LoopFilters("512", 50, 1, "ACBonus1", 0, 20);//Cloaks
    LoopFilters("512", 50, 2, "ACBonus2", 20, 20);//Cloaks
    LoopFilters("512", 50, 3, "ACBonus3", 40, 20);//Cloaks
    LoopFilters("512", 50, 4, "ACBonus4", 60, 20);//Cloaks
    LoopFilters("512", 50, 5, "ACBonus5", 80, 20);//Cloaks

    LoopFilters("128", 50, 1, "ACBonus1", 0, 20);//Amulet
    LoopFilters("128", 50, 2, "ACBonus2", 20, 20);//Amulet
    LoopFilters("128", 50, 3, "ACBonus3", 40, 20);//Amulet
    LoopFilters("128", 50, 4, "ACBonus4", 60, 20);//Amulet
    LoopFilters("128", 50, 5, "ACBonus5", 80, 20);//Amulet

    //Ghost Touch
    LoopWeapons(20, 1, "GhostTouch", 0, 40, 1);  //Melee Weapons

    LoopWeapons(20, 1, "GhostTouch", 0, 40, 11); // Shields

    LoopFilters("8192", 20, 1, "GhostTouch", 0, 40);//Armor

    LoopFilters("2048", 20, 1, "GhostTouch", 0, 20, 5);//Gauntlets + Bracers

    //Elemental Weapon
    LoopWeapons(10, 2, "ElementalWeapon1", 10, 25);
    LoopWeapons(10, 4, "ElementalWeapon2", 35, 25);
    LoopWeapons(10, 6, "ElementalWeapon3", 60, 30);

    LoopFilters("2048", 10, 2, "ElementalWeapon1", 10, 25, 1);
    LoopFilters("2048", 10, 4, "ElementalWeapon2", 35, 25, 1);
    LoopFilters("2048", 10, 6, "ElementalWeapon3", 60, 30, 1);

    //Gloves/Bracers of Archery

    LoopFilters("2048", 15, 1, "ArcheryHands1", 10, 40, 6);//Gloves + Bracers
    LoopFilters("2048", 15, 1, "ArcheryHands2", 50, 40, 6);//Gloves + Bracers

    //Gauntlets/Bracers of Battle Mastery
    LoopFilters("2048", 10, 1, "BattleMastery1", 10, 40, 3);//Gloves + Bracers
    LoopFilters("2048", 10, 1, "BattleMastery2", 50, 40, 3);//Gloves + Bracers

    //Gauntlets/Bracers of Divine Favor
    LoopFilters("2048", 10, 1, "DivineFavor1", 10, 40, 3);//Gloves + Bracers
    LoopFilters("2048", 10, 1, "DivineFavor2", 50, 40, 3);//Gloves + Bracers

    //of Shooting Stars
    LoopWeapons(15, 1, "ShootingStars", 0, 40);
    LoopFilters("256", 15, 1, "ShootingStars", 0, 40);//Rings
    LoopWeapons(15, 1, "ShootingStars", 0, 40, 11); // Spined? Shields

    //of Speed
    LoopWeapons(15, 1, "Speed", 0, 40);//Weapons
    LoopFilters("4096", 15, 1, "Speed", 0, 40);//Boots

    //Elemental Resistance
    LoopFilters("8192", 10, 1, "ElementalResist1", 30, 30);//Armor
    LoopFilters("8192", 10, 3, "ElementalResist2", 60, 20);//Armor
    LoopFilters("8192", 10, 5, "ElementalResist3", 80, 20);//Armor
    LoopWeapons(20, 1, "ElementalResist1", 30, 30, 11); // Shields
    LoopWeapons(20, 3, "ElementalResist2", 60, 20, 11); // Shields
    LoopWeapons(20, 5, "ElementalResist3", 80, 20, 11); // Shields
    LoopFilters("256", 20, 1, "ElementalResist1", 30, 30);//Rings
    LoopFilters("256", 20, 3, "ElementalResist2", 60, 20);//Rings
    LoopFilters("256", 20, 5, "ElementalResist3", 80, 20);//Rings

    //Fortified
    LoopFilters("8192", 5, 4, "Fortified", 60, 40, 14);//Armor
    LoopWeapons(5, 4, "Fortified", 60, 40, 11); // Shields

    // of The Reed
    LoopFilters("8192", 5, 4, "Reed", 60, 40);//Armor
    LoopWeapons(5, 4, "Reed", 60, 40, 11); // Shields

    //Undead Control
    LoopFilters("8192", 20, 1, "UndeadControl", 0, 40);//Armor
    LoopWeapons(20, 1, "UndeadControl", 0, 40, 11); // Shields

    //Spell Resistance
    LoopFilters("256", 10, 3, "SpellResistance", 60, 40);//Rings
    LoopFilters("512", 10, 3, "SpellResistance", 60, 20);//Cloaks

    //Resistance
    LoopFilters("512", 50, 1, "Resist1", 0, 20);//Cloaks
    LoopFilters("512", 50, 2, "Resist2", 20, 20);//Cloaks
    LoopFilters("512", 50, 3, "Resist3", 40, 20);//Cloaks
    LoopFilters("512", 50, 4, "Resist4", 60, 20);//Cloaks
    LoopFilters("512", 50, 5, "Resist5", 80, 20);//Cloaks

    LoopFilters("16384", 50, 1, "Resist1", 0, 20);//Helm
    LoopFilters("16384", 50, 2, "Resist2", 20, 20);//Helm
    LoopFilters("16384", 50, 3, "Resist3", 40, 20);//Helm
    LoopFilters("16384", 50, 4, "Resist4", 60, 20);//Helm
    LoopFilters("16384", 50, 5, "Resist5", 80, 20);//Helm

    //of Invisibility
    LoopFilters("512", 20, 1, "Invisibility", 0, 40);//Cloaks
    LoopFilters("256", 20, 1, "Invisibility", 0, 40);//Rings

    // Stats! Stats! Get your stats!
    //STR
    LoopFilters("8192", 30, 1, "STRBuff1", 10, 20, 14);//Armor
    LoopFilters("8192", 30, 1, "STRBuff2", 30, 20, 14);//Armor
    LoopFilters("8192", 30, 1, "STRBuff3", 50, 20, 14);//Armor
    LoopFilters("2048", 30, 1, "STRBuff1", 10, 20, 1);//Gauntlet
    LoopFilters("2048", 30, 1, "STRBuff2", 30, 20, 1);//Gauntlet
    LoopFilters("2048", 30, 1, "STRBuff3", 50, 20, 1);//Gauntlet
    LoopFilters("64", 30, 1, "STRBuff1", 10, 20);//Belt
    LoopFilters("64", 30, 1, "STRBuff2", 30, 20);//Belt
    LoopFilters("64", 30, 1, "STRBuff3", 50, 20);//Belt
    //DEX
    LoopFilters("4096", 30, 1, "DEXBuff1", 10, 20);//Boots
    LoopFilters("4096", 30, 1, "DEXBuff2", 30, 20);//Boots
    LoopFilters("4096", 30, 1, "DEXBuff3", 50, 20);//Boots
    LoopFilters("2048", 30, 1, "DEXBuff1", 10, 20, 2);//Gloves
    LoopFilters("2048", 30, 1, "DEXBuff2", 30, 20, 2);//Gloves
    LoopFilters("2048", 30, 1, "DEXBuff3", 50, 20, 2);//Gloves
    LoopFilters("64", 30, 1, "DEXBuff1", 10, 20);//Belt
    LoopFilters("64", 30, 1, "DEXBuff2", 30, 20);//Belt
    LoopFilters("64", 30, 1, "DEXBuff3", 50, 20);//Belt
    //CON
    LoopFilters("4096", 30, 1, "CONBuff1", 10, 20);//Boots
    LoopFilters("4096", 30, 1, "CONBuff2", 30, 20);//Boots
    LoopFilters("4096", 30, 1, "CONBuff3", 50, 20);//Boots
    LoopFilters("2048", 30, 1, "CONBuff1", 10, 20, 4);//Bracer
    LoopFilters("2048", 30, 1, "CONBuff2", 30, 20, 4);//Bracer
    LoopFilters("2048", 30, 1, "CONBuff3", 50, 20, 4);//Bracer
    LoopFilters("128", 30, 1, "CONBuff1", 10, 20);//Amulet
    LoopFilters("128", 30, 1, "CONBuff2", 30, 20);//Amulet
    LoopFilters("128", 30, 1, "CONBuff3", 50, 20);//Amulet
    //INT
    LoopFilters("8192", 30, 1, "INTBuff1", 30, 20, 1);//Clothing
    LoopFilters("8192", 30, 1, "INTBuff2", 50, 20, 1);//Clothing
    LoopFilters("8192", 30, 1, "INTBuff3", 70, 20, 1);//Clothing
    LoopFilters("16384", 30, 1, "INTBuff1", 30, 20);//Helm
    LoopFilters("16384", 30, 1, "INTBuff2", 50, 20);//Helm
    LoopFilters("16384", 30, 1, "INTBuff3", 70, 20);//Helm
    //WIS
    LoopFilters("128", 30, 1, "WISBuff1", 30, 20);//Amulet
    LoopFilters("128", 30, 1, "WISBuff2", 50, 20);//Amulet
    LoopFilters("128", 30, 1, "WISBuff3", 70, 20);//Amulet
    //CHA
    LoopFilters("512", 30, 1, "CHABuff1", 30, 20);//Cloak
    LoopFilters("512", 30, 1, "CHABuff2", 50, 20);//Cloak
    LoopFilters("512", 30, 1, "CHABuff3", 70, 20);//Cloak
    LoopFilters("16384", 30, 1, "CHABuff1", 30, 20);//Helm
    LoopFilters("16384", 30, 1, "CHABuff2", 50, 20);//Helm
    LoopFilters("16384", 30, 1, "CHABuff3", 70, 20);//Helm
    //DIVINE POWER! (Bracers of Relentless Might)
    LoopFilters("2048", 5, 1, "DivinePower1", 40, 10, 6);//Bracer/Gloves
    LoopFilters("2048", 5, 1, "DivinePower2", 50, 10, 6);//Bracer/Gloves
    LoopFilters("2048", 5, 1, "DivinePower3", 60, 10, 6);//Bracer/Gloves
    LoopFilters("2048", 5, 1, "DivinePower4", 70, 10, 6);//Bracer/Gloves
    LoopFilters("2048", 5, 1, "DivinePower5", 80, 10, 6);//Bracer/Gloves
    LoopFilters("2048", 5, 1, "DivinePower6", 90, 10, 6);//Bracer/Gloves

    SendMessageToAllDMs("Filters are all done!");
}











































void LoopFilters(string sFilter, int nWeight, int nSize, string sName, int nRarity, int nRange, int nSecondary = 65535, int nTertiary = 67108863, int nMaterial = 0) //This adds this to lists
{
   SendMessageToAllDMs("Filters are being set");
   int nFilter = StringToInt(sFilter);
   int i;
   for (i=15;i>0;i--)
   {
        if ((nFilter % 2) == 1) // Use the filter to determine the last bit on the right.
        {
            int nCount = NBDE_GetCampaignInt(ENCHANT, IntToString(i));
            string sCount = IntToString(nCount);//pull count in the list
            string sI = IntToString(i);
            if (i < 10) {sI = "0" + sI;}

            NBDE_SetCampaignInt(ENCHANT, sI + sCount, nWeight);  //Add all the stuffs
            NBDE_SetCampaignInt(ENCHANT, sI + sCount + "size", nSize);  //Add all the stuffs
            NBDE_SetCampaignString(ENCHANT, (sI + sCount + "name"), sName);
            NBDE_SetCampaignInt(ENCHANT, (sI + sCount + "rarity"), nRarity);
            NBDE_SetCampaignInt(ENCHANT, (sI + sCount + "range"), nRange);

            NBDE_SetCampaignInt(ENCHANT, (sI + sCount + "secondary"), nSecondary);
            NBDE_SetCampaignInt(ENCHANT, (sI + sCount + "tertiary"), nTertiary);

            nCount++; // Increase Count and update
            NBDE_SetCampaignInt(ENCHANT, IntToString(i), nCount);

            NBDE_FlushCampaignDatabase(ENCHANT);
            WriteTimestampedLogEntry("Enchantment " + sName + " has been loaded as enchantment number " + IntToString(nCount));
        }

        if ((nFilter % 2) == 1) // Update the filter by removing the end bit and shrinking the rest down to size
        {
            nFilter--;
        }
        nFilter = nFilter / 2;
   }
}

void LoopWeapons(int nWeight, int nSize, string sName, int nRarity, int nRange, int nType = 0, int nMaterial = 0)
    //Type = 0 (all weapons), Type = 1 (Melee), Type = 2 (Ranged), Type = 3 (Swords), Type = 4 (Bows), Type = 5 (Crossbows)
    //Type = 6 (Slashing), Type = 7 (Piercing), Type = 8 (Pierce/Slashing), Type = 9 (Bludgeoning), Type = 10 (Bludgeoning/Piercing)
    //Type = 11 (Shields), Type = 12 (Piercing W/out Bows)
{
    if (nType == 0)
    {
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    28,
                    67108863,
                    nMaterial);
    }
    else if (nType == 1) //Melee
    {
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    16,
                    519891,
                    nMaterial);
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    8,
                    49786623,
                    nMaterial);
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    4,
                    130815,
                    nMaterial);
   `}
    else if (nType == 2) //Ranged
    {
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    16,
                    12,
                    nMaterial);
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    8,
                    16797952,
                    nMaterial);
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    4,
                    256,
                    nMaterial);
    }
    else if (nType == 3) //Swords
    {
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    16,
                    2,
                    nMaterial);
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    8,
                    4599300,
                    nMaterial);
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    4,
                    14881,
                    nMaterial);
    }
    else if (nType == 4) //Bows
    {
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    8,
                    4599300,
                    nMaterial);
    }
    else if (nType == 5) //Crossbows
    {
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    16,
                    40,
                    nMaterial);
    }
    else if (nType == 6) //Slashing
    {
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    16,
                    2048,
                    nMaterial);
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    8,
                    289303,
                    nMaterial);
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    4,
                    79485,
                    nMaterial);
     }
     else if (nType == 7) //Piercing
     {
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    16,
                    352318,
                    nMaterial);
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    8,
                    36738304,
                    nMaterial);
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    4,
                    256,
                    nMaterial);
    }
    else if (nType == 8) //Pierce/Slashing
    {
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    8,
                    4325384,
                    nMaterial);
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    4,
                    128,
                    nMaterial);
    }
    else if (nType == 9) //Bludgeoning
    {
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    16,
                    169409,
                    nMaterial);
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    8,
                    25231584,
                    nMaterial);
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    4,
                    49154,
                    nMaterial);
    }
    else if (nType == 10) //Bludgeoning/Slashing
    {
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    16,
                    512,
                    nMaterial);
    }
    else if (nType == 11) // Shields
    {
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    2,
                    67108863,
                    nMaterial);
    }
    else if (nType == 12) //Melee Piercing
    {
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    16,
                    286738,
                    nMaterial);
        LoopFilters("1024",
                    nWeight,
                    nSize,
                    sName,
                    nRarity,
                    nRange,
                    8,
                    37258240,
                    nMaterial);
    }
}

