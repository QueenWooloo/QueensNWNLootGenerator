
#include "sp_ench_set"
#include "sp_iprop_header"

//This will dynamically pick an enchantment from the available list. The Method function will determine how it picks subsequent enchantments (if at all).
//oItem is the item to be enchanted
//nRarity is the rarity that you want to pick an enchantment for (This should be already set in stone by now)
//nMethod is the part where it gets tricky.
//Method [0] is the simple way. It picks one enchantment, then applies it to the item with no limitations on size.
//Method [1] is a set number. It picks enchantments until the item holds [nParam1] slots towards its cap.
//Method [2] picks enchantments, with a [nParam1]/50 chance of picking a further enchantment, which continues to halve on each iteration. [nParam2] is used to give a hard cap on size (0 means no cap).
void RollEnchantments(object oItem, int nRarity, int nMethod = 0, int nParam1 = 0, int nParam2 = 0);

//Gives enchantments based on name. Sets the enchantment's name into a local variable named [sLocal]
void GiveEnchant(object oItem, string sEnch, string sLocal);




void RollEnchantments(object oItem, int nRarity, int nMethod = 0, int nParam1 = 0, int nParam2 = 0)
{
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //Determine the Sorting Situation of our item
    if (oItem != OBJECT_INVALID)
    {
        WriteTimestampedLogEntry("Enchantment System: Object is valid");
    }
    else
    {WriteTimestampedLogEntry("Enchantment System: Object is invalid");}
    int nBaseItem = GetBaseItemType(oItem);
    int nSort1;
    int nSort2;
    int nSort3;

    switch (nBaseItem)
        {
            case 0://Shortsword
            {
                nSort1 = 3;
                nSort2 = 4;
                nSort3 = 14;
                break;
            }
            case 1://LongSword
            case 330://Longsword 2 CEP, No difference.
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 10;
                break;
            }
            case 2://Battleaxe
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 1;
                break;
            }
            case 3://Bastard Sword
            {
                nSort1 = 5;
                nSort2 = 3;
                nSort3 = 1;
                break;
            }
            case 4://Light Flail
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 8;
                break;
            }
            case 5://Warhammer
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 17;
                break;
            }
            case 6://Heavy Crossbow
            {
                nSort1 = 5;
                nSort2 = 5;
                nSort3 = 4;
                break;
            }
            case 7://Light Crossbow
            {
                nSort1 = 5;
                nSort2 = 5;
                nSort3 = 6;
                break;
            }
            case 8://Longbow
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 9;
                break;
            }
            case 9://Light Mace
            case 312://LightMace2
            {
                nSort1 = 5;
                nSort2 = 5;
                nSort3 = 7;
                break;
            }
            case 10://Halberd
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 4;
                break;
            }
            case 11://Shortbow
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 13;
                break;
            }
            case 12://Two Bladed Sword
            {
                nSort1 = 5;
                nSort2 = 3;
                nSort3 = 10;
                break;
            }
            case 13://Greatsword
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 3;
                break;
            }
            case 14://Small Shield
            {
                nSort1 = 5;
                nSort2 = 2;
                nSort3 = 2;
                break;
            }
            case 15://Torch
            case 326://CEP Torches
            case 367://
            {
                nSort1 = 5;
                nSort2 = 1;
                nSort3 = 5;
                break;
            }
            case 16: //Armor. Secondary and Tertiary sorting is not determined by base object.
            {
                nSort1 = 2;
                    switch(GetItemACValue(oItem))
                        {
                            case 0:
                                {
                                nSort2 = 1;
                                break;
                                }
                            case 1:
                            case 2:
                            case 3:
                                {
                                nSort2 = 2;
                                break;
                                }
                            case 4:
                            case 5:
                                {
                                nSort2 = 4;
                                break;
                                }
                            case 6:
                            case 7:
                            case 8:
                                {
                                nSort2 = 8;
                                break;
                                }
                         }
                nSort3 = 0;
                break;
            }
            case 17: //Helmet. Secondary and Tertiary sorting is not determined by base object.
            {
                nSort1 = 1;
                nSort2 = 0;
                nSort3 = 0;
                break;
            }
            case 18: //Greataxe
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 2;
                break;
            }
            case 19://Amulet
            case 351://The Rest are CEP Amulets
            case 356://
            case 357://
            case 358://
            case 371://
            case 372://
            case 373://
            case 407://
            case 408://
            case 409://
            case 410://
            {
                nSort1 = 8;
                nSort2 = 0;
                nSort3 = 0;
                break;
            }
            case 20://Arrow
            {
                nSort1 = 10;
                nSort2 = 0;
                nSort3 = 0;
                break;
            }
            case 21://Belt
            case 359://CEP belt
            case 360://
            case 361://
            {
                nSort1 = 9;
                nSort2 = 0;
                nSort3 = 0;
                break;
            }
            case 22://Dagger
            {
                nSort1 = 5;
                nSort2 = 5;
                nSort3 = 2;
                break;
            }
            case 25://Bolt
            {
                nSort1 = 12;
                nSort2 = 0;
                nSort3 = 0;
                break;
            }
            case 26://Boots
            {
                nSort1 = 3;
                nSort2 = 0;
                nSort3 = 0;
                break;
            }
            case 27://Bullet
            {
                nSort1 = 11;
                nSort2 = 0;
                nSort3 = 0;
                break;
            }
            case 28://Club
            {
                nSort1 = 5;
                nSort2 = 5;
                nSort3 = 1;
                break;
            }
            case 31://Dart
            {
                nSort1 = 5;
                nSort2 = 5;
                nSort3 = 3;
                break;
            }
            case 32://Dire Mace
            {
                nSort1 = 5;
                nSort2 = 3;
                nSort3 = 2;
                break;
            }
            case 33://Double Axe
            {
                nSort1 = 5;
                nSort2 = 3;
                nSort3 = 3;
                break;
            }
            case 35://Heavy Flail
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 6;
                break;
            }
            case 36://Gloves
            {
                nSort1 = 4;
                nSort2 = 2;
                nSort3 = 0;
                if (GetTag(oItem) == "MetalGauntlet")
                {
                    nSort2 = 1;
                }
                break;
            }
            case 37://Light Hammer
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 8;
                break;
            }
            case 38://Handaxe
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 5;
                break;
            }
            case 40://Kama
            {
                nSort1 = 5;
                nSort2 = 3;
                nSort3 = 5;
                break;
            }
            case 41://Katana
            {
                nSort1 = 5;
                nSort2 = 3;
                nSort3 = 6;
                break;
            }
            case 42://Kukri
            case 313://Kukri 2 CEP
            {
                nSort1 = 5;
                nSort2 = 3;
                nSort3 = 7;
                break;
            }
            case 44://Magic Rod
            {
                nSort1 = 5;
                nSort2 = 1;
                nSort3 = 3;
                break;
            }
            case 45://Magic Staff
            {
                nSort1 = 5;
                nSort2 = 5;
                nSort3 = 9;
                break;
            }
            case 46://Magic Wand
            {
                nSort1 = 5;
                nSort2 = 1;
                nSort3 = 2;
                break;
            }
            case 47://MorningStar
            {
                nSort1 = 5;
                nSort2 = 5;
                nSort3 = 10;
                break;
            }
            case 50://Quarterstaff
            {
                nSort1 = 5;
                nSort2 = 5;
                nSort3 = 11;
                break;
            }
            case 51://Rapier
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 11;
                break;
            }
            case 52://Ring
            case 350://The rest are CEP Rings
            case 353://Ring
            case 354://Ring
            case 355://Ring
            case 368://Ring
            case 369://Ring
            case 370://Ring
            case 403://Ring
            case 404://Ring
            case 405://Ring
            case 406://Ring
            {
                nSort1 = 7;
                nSort2 = 0;
                nSort3 = 0;
                break;
            }
            case 53://Scimitar
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 12;
                break;
            }
            case 55://Scythe
            {
                nSort1 = 5;
                nSort2 = 3;
                nSort3 = 8;
                break;
            }
            case 56://Large Shield
            {
                nSort1 = 5;
                nSort2 = 2;
                nSort3 = 1;
                break;
            }
            case 57://Tower Shield
            {
                nSort1 = 5;
                nSort2 = 2;
                nSort3 = 3;
                break;
            }
            case 58://Short Spear
            case 210://Tiny Spear
            {
                nSort1 = 5;
                nSort2 = 5;
                nSort3 = 14;
                break;
            }
            case 59://Shuriken
            {
                nSort1 = 5;
                nSort2 = 3;
                nSort3 = 9;
                break;
            }
            case 60://Sickle
            {
                nSort1 = 5;
                nSort2 = 5;
                nSort3 = 12;
                break;
            }
            case 61://Sling
            {
                nSort1 = 5;
                nSort2 = 5;
                nSort3 = 13;
                break;
            }
            case 62://ThievesTools
            {
                nSort1 = 5;
                nSort2 = 1;
                nSort3 = 4;
                break;
            }
            case 63://Throwing Axe
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 15;
                break;
            }
            case 69://Creature Slashing Weapon
            {
                nSort1 = 13;
                nSort2 = 4;
                nSort3 = 0;
                break;
            }
            case 70://Creature Piercing Weapon
            {
                nSort1 = 13;
                nSort2 = 3;
                nSort3 = 0;
                break;
            }
            case 71://Creature Bludgeoning Weapon
            {
                nSort1 = 13;
                nSort2 = 2;
                nSort3 = 0;
                break;
            }
            case 72://Creature Slashing + Piercing weapon
            {
                nSort1 = 13;
                nSort2 = 1;
                nSort3 = 0;
                break;
            }
            case 73://Creature Hide Item
            {
                nSort1 = 15;
                nSort2 = 0;
                nSort3 = 0;
                break;
            }
            case 74://Book
            case 315://Book CEP
            {
                nSort1 = 5;
                nSort2 = 1;
                nSort3 = 1;
                break;
            }
            case 78://Bracer
            case 362://CEP Bracer
            {
                nSort1 = 4;
                nSort2 = 3;
                nSort3 = 0;
                break;
            }
            case 80://Cloak
            {
                nSort1 = 6;
                nSort2 = 0;
                nSort3 = 0;
                break;
            }
            case 95://Trident
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 16;
                break;
            }
            case 108://Dwarven Waraxe
            {
                nSort1 = 5;
                nSort2 = 3;
                nSort3 = 4;
                break;
            }
            case 111://Whip
            {
                nSort1 = 5;
                nSort2 = 3;
                nSort3 = 11;
                break;
            }
            case 300://Trident 1H
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 26;
                break;
            }
            case 301://Heavy Pick
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 21;
                break;
            }
            case 302://Light Pick
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 22;
                break;
            }
            case 303://Sai
            {
                nSort1 = 5;
                nSort2 = 3;
                nSort3 = 16;
                break;
            }
            case 304://Nunchaku
            {
                nSort1 = 5;
                nSort2 = 3;
                nSort3 = 15;
                break;
            }
            case 305://Falchion
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 18;
                break;
            }
            case 308://Sap
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 25;
                break;
            }
            case 309://Assassin Dagger
            {
                nSort1 = 5;
                nSort2 = 5;
                nSort3 = 15;
                break;
            }
            case 310://Katar
            {
                nSort1 = 5;
                nSort2 = 5;
                nSort3 = 17;
                break;
            }
            case 316://Falchion 2
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 19;
                break;
            }
            case 317://Heavy Mace
            {
                nSort1 = 5;
                nSort2 = 5;
                nSort3 = 16;
                break;
            }
            case 318://Maul
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 24;
                break;
            }
            case 319://Mercurial Longsword
            {
                nSort1 = 5;
                nSort2 = 3;
                nSort3 = 14;
                break;
            }
            case 320://Mercurial Greatsword
            {
                nSort1 = 5;
                nSort2 = 3;
                nSort3 = 13;
                break;
            }
            case 321://Double Scimitar
            {
                nSort1 = 5;
                nSort2 = 3;
                nSort3 = 12;
                break;
            }
            case 322://Goad
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 20;
                break;
            }
            case 323://Wind and Fire Wheel
            {
                nSort1 = 5;
                nSort2 = 3;
                nSort3 = 17;
                break;
            }
            case 324://Maug Double Sword
            {
                nSort1 = 5;
                nSort2 = 4;
                nSort3 = 23;
                break;
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // Now we must find the enchants.

        WriteTimestampedLogEntry("Item Determined by enchant system to have: nSort1 = " + IntToString(nSort1) + ", nSort2 = " + IntToString(nSort2) + ", nSort3 = " + IntToString(nSort3));

        int nEnchCount = 0;

        int nWeightMax = 0;
        string sI = IntToString(nSort1);
        int nCount = NBDE_GetCampaignInt(ENCHANT, sI);
        int nFilter2;
        int nFilter3;
        int nRarityItem;
        int nRange;
        int nContinueChance = nParam1 * 2;
        string sItem;
        int nContinue;
        int nEnchantAgain = 1;
        int nSlotCount = 0;
        if (nSort1 < 10) {sI = "0" + sI;}

        int i, j;


        while (nEnchantAgain == 1)
        {
        for (i=0;i<nCount;i++) {
            sItem = sI + IntToString(i);
            nContinue = 1;
            if (nSort2 != 0)  // We're not going to check for secondaries if they don't exist on the item. It's a lot of operations, especially when you get into the deeper Martial Weapons.
            {
                nFilter2 = NBDE_GetCampaignInt(ENCHANT, sItem + "secondary");
                WriteTimestampedLogEntry("Secondary Filter: " + IntToString(nFilter2));
                for (j=0;j<nSort2-1;j++)
                {
                    nFilter2 = nFilter2 / 2;
                    WriteTimestampedLogEntry("Secondary Filter Update, Divided by 2: " + IntToString(nFilter2));
                }
                if ((nFilter2 % 2) == 1)
                {
                    nContinue = 1;
                }
                else
                {
                    nContinue = 0;
                }
            }
            WriteTimestampedLogEntry("nContinue = " + IntToString(nContinue));
            if (nContinue)
            {
                if (nSort3 != 0)  // We're not going to check for tertiaries if they don't exist on the item. It's a lot of operations, especially when you get into the deeper Martial Weapons.
                {
                    nFilter3 = NBDE_GetCampaignInt(ENCHANT, sItem + "tertiary");
                    WriteTimestampedLogEntry("Tertiary Filter: " + IntToString(nFilter3));
                    for (j=0;j<nSort3-1;j++)
                    {
                        nFilter3 = nFilter3 / 2;
                        WriteTimestampedLogEntry("Tertiary Filter Update, Divided by 2: " + IntToString(nFilter3));
                    }
                    if ((nFilter3 % 2) == 1)
                    {
                        nContinue = 1;
                    }
                    else
                    {
                        nContinue = 0;
                    }
                }
            }
            WriteTimestampedLogEntry("nContinue = " + IntToString(nContinue));
            if (nContinue)
            {
                nRarityItem = NBDE_GetCampaignInt(ENCHANT, sItem + "rarity");
                nRange = NBDE_GetCampaignInt(ENCHANT, sItem + "range");
                WriteTimestampedLogEntry("Chest Rarity: " + IntToString(nRarity));
                WriteTimestampedLogEntry("Item Rarity: " + IntToString(nRarityItem));
                if (nRarityItem > nRarity <= (nRarityItem + nRange))
                {
                    nContinue = 1;
                }
                else
                {
                    nContinue = 0;
                }
            }
            WriteTimestampedLogEntry("nContinue = " + IntToString(nContinue));
            if (nMethod == 1)
            {
                if (nContinue)
                {
                    if (nSlotCount + NBDE_GetCampaignInt(ENCHANT, sItem + "size") > nParam1)
                    {
                        nContinue = 0; //Assuming it's Method 1, going over the max size is NOT AN OPTION, so we just ditch the enchant.
                    }
                }
            }
            WriteTimestampedLogEntry("nContinue = " + IntToString(nContinue));
            if (nMethod == 2)
            {
                if (nContinue)
                {
                    if ((nSlotCount + NBDE_GetCampaignInt(ENCHANT, sItem + "size") > nParam2) && nParam2 != 0)
                    {
                        nContinue = 0; //Assuming it's Method 2, going over the max size is also bad, so we ditch again.
                    }
                }
            }
            WriteTimestampedLogEntry("nContinue = " + IntToString(nContinue));
            if (nContinue)
            {
                if (nEnchCount > 0)
                {
                    for(i=0;i<nEnchCount;i++)
                    {
                        if (NBDE_GetCampaignString(ENCHANT, sItem + "name") == GetLocalString(oItem, "Enchant" + IntToString(i)))
                        {
                            nContinue = 0;
                        }
                    }
                }
            }
            WriteTimestampedLogEntry("nContinue = " + IntToString(nContinue));
            if (nContinue)
            {
                WriteTimestampedLogEntry("Weight is updated");
                nWeightMax = nWeightMax + NBDE_GetCampaignInt(ENCHANT, sItem);
            }
        }
        //okay coolio we've got a weight max which should hold the weight of all the enchants that are eligible for the item. Now we make some calculations
        int nDecider = Random(nWeightMax);
        for (i=0;i<nCount;i++) {
            sItem = sI + IntToString(i);
            nContinue = 1;
            if (nSort2 != 0)  // We're not going to check for secondaries if they don't exist on the item. It's a lot of operations, especially when you get into the deeper Martial Weapons.
            {
                nFilter2 = NBDE_GetCampaignInt(ENCHANT, sItem + "secondary");
                for (j=0;j<nSort2-1;j++)
                {
                    nFilter2 = nFilter2 / 2;
                }
                if ((nFilter2 % 2) == 1)
                {
                    nContinue = 1;
                }
                else
                {
                    nContinue = 0;
                }
            }

            if (nContinue)
            {
                if (nSort3 != 0)  // We're not going to check for tertiaries if they don't exist on the item. It's a lot of operations, especially when you get into the deeper Martial Weapons.
                {
                    nFilter3 = NBDE_GetCampaignInt(ENCHANT, sItem + "tertiary");
                    for (j=0;j<nSort3-1;j++)
                    {
                        nFilter3 = nFilter3 / 2;
                    }
                    if ((nFilter3 % 2) == 1)
                    {
                        nContinue = 1;
                    }
                    else
                    {
                        nContinue = 0;
                    }
                }
            }
            if (nContinue)
            {
                nRarityItem = NBDE_GetCampaignInt(ENCHANT, sItem + "rarity");
                nRange = NBDE_GetCampaignInt(ENCHANT, sItem + "range");
                if (nRarityItem > nRarity <= (nRarityItem + nRange))
                {
                    nContinue = 1;
                }
                else
                {
                    nContinue = 0;
                }
            }
            if (nMethod == 1)
            {
                if (nContinue)
                {
                    if (nSlotCount + NBDE_GetCampaignInt(ENCHANT, sItem + "size") > nParam1)
                    {
                        nContinue = 0; //Assuming it's Method 1, going over the max size is NOT AN OPTION, so we just ditch the enchant.
                    }
                }
            }
            if (nMethod == 2)
            {
                if (nContinue)
                {
                    if ((nSlotCount + NBDE_GetCampaignInt(ENCHANT, sItem + "size") > nParam2) && nParam2 != 0)
                    {
                        nContinue = 0; //Assuming it's Method 2, going over the max size is also bad, so we ditch again.
                    }
                }
            }
            if (nContinue)
            {
                if (nEnchCount > 0)
                {
                    for(i=0;i<nEnchCount;i++)
                    {
                        if (NBDE_GetCampaignString(ENCHANT, sItem + "name") == GetLocalString(oItem, "Enchant" + IntToString(i)))
                        {
                            nContinue = 0;
                        }
                    }
                }
            }
            if (nContinue)
            {
                nDecider = nDecider - NBDE_GetCampaignInt(ENCHANT, sItem);
            }
            if (nDecider < 0) {break;}
        }

        //so when we've picked an item, sItem is our enchant.
        //now all we got to do is pull the enchant from the libary. It's going in a separate function because these functions should remain untouched for the forseeable future.
        nEnchCount++;
        GiveEnchant(oItem, NBDE_GetCampaignString(ENCHANT, sItem + "name"), "Enchant" + IntToString(nEnchCount));
        if (nMethod == 0)
        {
            nEnchantAgain = 0;
        }
        if (nMethod == 1)
        {
            if (nSlotCount >= nParam1)
            {
                nEnchantAgain = 0;
            }
        }
        if (nMethod == 2)
        {
            if (d100() > nContinueChance)
            {
                nEnchantAgain = 0;
            }
            else
            {
                nContinueChance = nContinueChance/2;
                if(nParam2 != 0 && nSlotCount >= nParam2)
                {
                    nEnchantAgain = 0;
                }
            }
        }

        }
}

void GiveEnchant(object oItem, string sEnch, string sLocal)
{
    WriteTimestampedLogEntry("Giving enchant now");
    /*if (sEnch == "ShootingStars")
    {
        WriteTimestampedLogEntry("Enchant is shooting stars");
        AddShootingStars(oItem, 3, 3);
        SetName(oItem, GetName(oItem) + " of Shooting Stars");
        SetLocalString(oItem, sLocal, "ShootingStars");
    }*/ // This is an old example. it isn't valid any longer.
    switch (HashString(sEnch))
    {
        //Weapon Enhancements
        case ("EnhancementBonus1"):
        {
            SetLocalInt(oItem, "WeaponEnch", 1);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            AddEnhancementBonus(oItem, 1, "EnhancementBonus1");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "EnhancementBonus2"):
        {
            SetLocalInt(oItem, "WeaponEnch", 2);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            AddEnhancementBonus(oItem, 2, "EnhancementBonus2");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "EnhancementBonus3"):
        {
            SetLocalInt(oItem, "WeaponEnch", 3);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+3);
            AddEnhancementBonus(oItem, 3, "EnhancementBonus3");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "EnhancementBonus4"):
        {
            SetLocalInt(oItem, "WeaponEnch", 4);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+4);
            AddEnhancementBonus(oItem, 4, "EnhancementBonus4");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "EnhancementBonus5"):
        {
            SetLocalInt(oItem, "WeaponEnch", 5);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+5);
            AddEnhancementBonus(oItem, 5, "EnhancementBonus5");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Vampiric Weapons
        case ( "Vampiric"):
        {
            SetLocalInt(oItem, "Drain", 2);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            AddVampiricRegeneration(oItem, 2, "Vampiric");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Vorpal
        case ( "Vorpal"):
        {
            SetLocalInt(oItem, "Vorpal", 1);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+5);
            AddOnHitProps(oItem, IP_CONST_ONHIT_VORPAL, IP_CONST_ONHIT_SAVEDC_20, 0, "Vorpal");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Bursting
        case ( "Bursting"):
        {
            SetLocalInt(oItem, "Burst", 1);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+5);
            AddOnHitProps(oItem, IP_CONST_ONHIT_BLINDNESS, IP_CONST_ONHIT_SAVEDC_26, IP_CONST_ONHIT_DURATION_75_PERCENT_1_ROUND, "Bursting");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Poison Weapon
        case ( "PoisonWeapon1"):
        {
            SetLocalInt(oItem, "POISON", 1);
            SetLocalInt(oItem, "Elemental", 1);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            AddOnHitProps(oItem, IP_CONST_ONHIT_ITEMPOISON, IP_CONST_ONHIT_SAVEDC_20, IP_CONST_POISON_1D2_STRDAMAGE, "PoisonWeapon");
            AddVisualEffect(oItem, ITEM_VISUAL_ACID, "PoisonWeapon1");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "PoisonWeapon2"):
        {
            SetLocalInt(oItem, "POISON", 2);
            SetLocalInt(oItem, "Elemental", 1);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+4);
            AddOnHitProps(oItem, IP_CONST_ONHIT_ITEMPOISON, IP_CONST_ONHIT_SAVEDC_20, IP_CONST_POISON_1D2_STRDAMAGE, "PoisonWeapon2");
            AddOnHitProps(oItem, IP_CONST_ONHIT_ITEMPOISON, IP_CONST_ONHIT_SAVEDC_20, IP_CONST_POISON_1D2_DEXDAMAGE, "PoisonWeapon2");
            AddVisualEffect(oItem, ITEM_VISUAL_ACID, "PoisonWeapon2");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "PoisonWeapon3"):
        {
            SetLocalInt(oItem, "POISON", 3);
            SetLocalInt(oItem, "ELemental", 1);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+6);
            AddOnHitProps(oItem, IP_CONST_ONHIT_ITEMPOISON, IP_CONST_ONHIT_SAVEDC_20, IP_CONST_POISON_1D2_STRDAMAGE, "PoisonWeapon3");
            AddOnHitProps(oItem, IP_CONST_ONHIT_ITEMPOISON, IP_CONST_ONHIT_SAVEDC_20, IP_CONST_POISON_1D2_DEXDAMAGE, "PoisonWeapon3");
            AddOnHitProps(oItem, IP_CONST_ONHIT_ITEMPOISON, IP_CONST_ONHIT_SAVEDC_20, IP_CONST_POISON_1D2_CONDAMAGE, "PoisonWeapon3");
            AddVisualEffect(oItem, ITEM_VISUAL_ACID, "PoisonWeapon3");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Keen
        case ( "Keen"):
        {
            SetLocalInt(oItem, "Keen", 1);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            AddKeen(oItem, "Keen");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // of Force
        case ( "ForceWeapon"):
        {
            SetLocalInt(oItem, "Force", 1);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            AddMassiveCrit(oItem, IP_CONST_DAMAGEBONUS_1d10, "ForceWeapon");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // of Subtlety
        case ( "SubtleWeapon"):
        {
            SetLocalInt(oItem, "Subtle", 1);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            AddBonusFeat(oItem, IP_CONST_FEAT_SNEAK_ATTACK_1D6, "SubtleWeapon");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Aligned Weapons
        case ( "AlignedWeapon"):
        {
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            SetLocalInt(oItem, "Aligned", 1);
            switch (Random(4))
            {
                case (0): //Chaotic Weapon
                {
                    SetLocalInt(oItem, "Chaos", 1);
                    AddDamageBonusVsAlign(
                    oItem, IP_CONST_DAMAGEBONUS_1d10, IP_CONST_DAMAGETYPE_DIVINE, IP_CONST_ALIGNMENTGROUP_LAWFUL, "ChaoticWeapon");
                    AddLimitByAlign(oItem, IP_CONST_ALIGNMENTGROUP_CHAOTIC, "ChaoticWeapon");
                    break;
                }
                case (1): //Lawful Weapon
                {
                    SetLocalInt(oItem, "Law", 1);
                    AddDamageBonusVsAlign(oItem, IP_CONST_DAMAGEBONUS_1d10, IP_CONST_DAMAGETYPE_DIVINE, IP_CONST_ALIGNMENTGROUP_CHAOTIC, "LawfulWeapon");
                    AddLimitByAlign(oItem, IP_CONST_ALIGNMENTGROUP_LAWFUL, "LawfulWeapon");
                    break;
                }
                case (2): //Good Weapon
                {
                    SetLocalInt(oItem, "Good", 1);
                    AddDamageBonusVsAlign(oItem, IP_CONST_DAMAGEBONUS_1d10, IP_CONST_DAMAGETYPE_DIVINE, IP_CONST_ALIGNMENTGROUP_EVIL, "GoodWeapon");
                    AddLimitByAlign(oItem, IP_CONST_ALIGNMENTGROUP_GOOD, "GoodWeapon");
                    break;
                }
                case (3): //Evil Weapon
                {
                    SetLocalInt(oItem, "Evil", 1);
                    AddDamageBonusVsAlign(oItem, IP_CONST_DAMAGEBONUS_1d10, IP_CONST_DAMAGETYPE_DIVINE, IP_CONST_ALIGNMENTGROUP_GOOD, "EvilWeapon");
                    AddLimitByAlign(oItem, IP_CONST_ALIGNMENTGROUP_EVIL, "EvilWeapon");
                    break;
                }
            }
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // True Neutral "Extremist's Bane
        case ( "AlignedNeutrality"):
        {
            SetLocalInt(oItem, "TN", 1);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+5);
            AddDamageBonusVsAlign(oItem, IP_CONST_DAMAGEBONUS_1d10, IP_CONST_DAMAGETYPE_DIVINE, IP_CONST_ALIGNMENTGROUP_GOOD, "NeutralWeapon");
            AddDamageBonusVsAlign(oItem, IP_CONST_DAMAGEBONUS_1d10, IP_CONST_DAMAGETYPE_DIVINE, IP_CONST_ALIGNMENTGROUP_EVIL, "NeutralWeapon");
            AddDamageBonusVsAlign(oItem, IP_CONST_DAMAGEBONUS_1d10, IP_CONST_DAMAGETYPE_DIVINE, IP_CONST_ALIGNMENTGROUP_LAWFUL, "NeutralWeapon");
            AddDamageBonusVsAlign(oItem, IP_CONST_DAMAGEBONUS_1d10, IP_CONST_DAMAGETYPE_DIVINE, IP_CONST_ALIGNMENTGROUP_CHAOTIC, "NeutralWeapon");
            AddLimitBySpecificAlign(oItem, IP_CONST_ALIGNMENT_TN, "NeutralWeapon");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Cleaving
        case ( "Cleaving"):
        {
            SetLocalInt(oItem, "Cleaving", 1);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            AddBonusFeat(oItem, IP_CONST_FEAT_CLEAVE, "Cleaving");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Returning
        case ( "Returning"):
        {
            SetLocalInt(oItem, "Returning", 7);
            AddUnlimitedAmmo(oItem, IP_CONST_UNLIMITEDAMMO_BASIC, "Returning");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Mighty
        case ( "Mighty1"):
        {
            SetLocalInt(oItem, "Mighty", 1);
            AddMighty(oItem, 1, "Mighty1");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "Mighty2"):
        {
            SetLocalInt(oItem, "Mighty", 2);
            AddMighty(oItem, 2, "Mighty2");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "Mighty3"):
        {
            SetLocalInt(oItem, "Mighty", 3);
            AddMighty(oItem, 3, "Mighty3");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+3);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // ProofAgainstTransmutation
        case ( "ProofAgainstTransmute"):
        {
            SetLocalInt(oItem, "ProofVsTr", 1);
            AddSpellImmunitySchool(oItem, IP_CONST_SPELLSCHOOL_TRANSMUTATION, "ProofAgainstTransmute");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+4);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Scintillating Colors
        case ( "RobeofScintillatingColors"):
        {
            SetLocalInt(oItem, "iCasterLvl", 11);
            SetLocalInt(oItem, "Colors", 1);
            AddSpellCasts(oItem, IP_CONST_CASTSPELL_DISPLACEMENT_9, IP_CONST_CASTSPELL_NUMUSES_3_USES_PER_DAY, "RobeofScintillatingColors");
            AddLight(oItem, IP_CONST_LIGHTBRIGHTNESS_NORMAL, IP_CONST_LIGHTCOLOR_ORANGE, "RobeofScintillatingColors");
            AddOnHitProps(oItem, IP_CONST_ONHIT_STUN, IP_CONST_ONHIT_SAVEDC_20, IP_CONST_ONHIT_DURATION_75_PERCENT_1_ROUND, "RobeofScintillatingColors");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+3);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Regeneration
        case ( "Regeneration"):
        {
            SetLocalInt(oItem, "Regeneration", 1);
            AddRegeneration(oItem, 3, "Regeneration");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+5);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Mind Protection
        case ( "MindProtection"):
        {
            if (GetBaseItemType(oItem) == 52)
            {
                SetLocalInt(oItem, "Mind", 1);
            }
            else
            {
                SetLocalInt(oItem, "Mind", 11);
            }
            AddMiscImmunity(oItem, IP_CONST_IMMUNITYMISC_MINDSPELLS, "MindProtection");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+3);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Evasion
        case ( "Evasion"):
        {
            SetLocalInt(oItem, "Evasion", 1);
            AddBonusFeat(oItem, 80, "Evasion");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+4);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // of Spellcasting
        case ( "RingSpellcasting"):
        {
            switch (Random(6))
            {
                case (0)://Oakfather // Druid
                {
                    SetLocalInt(oItem, "Druidspell", 2);
                    AddBonusLevelSpell(oItem, IP_CONST_CLASS_DRUID, 1, "Druidspell");
                    AddBonusLevelSpell(oItem, IP_CONST_CLASS_DRUID, 1, "Druidspell");
                    break;
                }
                case (1)://Martyr // Paladin
                {
                    SetLocalInt(oItem, "Martyr", 2);
                    AddBonusLevelSpell(oItem, IP_CONST_CLASS_PALADIN, 1, "Martyr");
                    AddBonusLevelSpell(oItem, IP_CONST_CLASS_PALADIN, 1, "Martyr");
                    break;
                }
                case (2)://SupremeRanger // Ranger
                {
                    SetLocalInt(oItem, "SupremeRanger", 2);
                    AddBonusLevelSpell(oItem, IP_CONST_CLASS_RANGER, 1, "SupremeRanger");
                    AddBonusLevelSpell(oItem, IP_CONST_CLASS_RANGER, 1, "SupremeRanger");
                    break;
                }
                case (3)://Lord of Song // Bard
                {
                    SetLocalInt(oItem, "MililBless", 2);
                    AddBonusLevelSpell(oItem, IP_CONST_CLASS_BARD, 1, "MililBless");
                    AddBonusLevelSpell(oItem, IP_CONST_CLASS_BARD, 1, "MililBless");
                    break;
                }
                case (4)://of the Pantheon // Cleric
                {
                    SetLocalInt(oItem, "Pantheon", 2);
                    AddBonusLevelSpell(oItem, IP_CONST_CLASS_CLERIC, 1, "Pantheon");
                    AddBonusLevelSpell(oItem, IP_CONST_CLASS_CLERIC, 1, "Pantheon");
                    break;
                }
                case (5)://of Wizardry // Wizard
                {
                    SetLocalInt(oItem, "Wizardry", 2);
                    AddBonusLevelSpell(oItem, IP_CONST_CLASS_WIZARD, 1, "Wizardry");
                    AddBonusLevelSpell(oItem, IP_CONST_CLASS_WIZARD, 1, "Wizardry");
                    break;
                }
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
            }
        }
        // Holy Might
        case ("HolyMight"):
        {
            SetLocalInt(oItem, "HolyMight", 2);
            AddBonusLevelSpell(oItem, IP_CONST_CLASS_CLERIC, 1, "HolyMight");
            AddBonusLevelSpell(oItem, IP_CONST_CLASS_CLERIC, 1, "HolyMight");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Saddle Master
        case ("SaddleMaster1"):
        {
            SetLocalInt(oItem, "SaddleMaster", 2);
            AddSkillBonus(oItem, SKILL_RIDE, 2, "SaddleMaster1");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ("SaddleMaster2"):
        {
            SetLocalInt(oItem, "SaddleMaster", 2);
            AddSkillBonus(oItem, SKILL_RIDE, 2, "SaddleMaster2");
            AddBonusFeat(oItem, 41, "SaddleMaster2");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Mobility
        case ("Mobility"):
        {
            SetLocalInt(oItem, "Mobility", 7);
            AddFreeAction(oItem, "Mobility");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+3);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // of Guiding Light
        case ("GuidingLight"):
        {
            SetLocalInt(oItem, "GuidingLight", 1);
            AddMiscImmunity(oItem, IP_CONST_IMMUNITYMISC_DEATH_MAGIC, "GuidingLight");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Adaptation
        case ("Adaptation"):
        {
            SetLocalInt(oItem, "Adaptation", 5);
            AddSpellImmunitySpecific(oItem, IP_CONST_IMMUNITYSPELL_CLOUDKILL, "Adaptation");
            AddSpellImmunitySpecific(oItem, IP_CONST_IMMUNITYSPELL_STINKING_CLOUD, "Adaptation");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Wolf Shield
        case ("Wolf"):
        {
            SetLocalInt(oItem, "Wolf", 1);
            SetLocalInt(oItem, "iCasterLvl", 9);
            AddSpellCasts(oItem, IP_CONST_CASTSPELL_SUMMON_CREATURE_III_5, IP_CONST_CASTSPELL_NUMUSES_3_USES_PER_DAY, "Wolf");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Helm of Knowledge
        case ("KnowledgeHat"):
        {
            SetLocalInt(oItem, "Knowledge", 2);
            AddBonusLevelSpell(oItem, IP_CONST_CLASS_WIZARD, 1, "Knowledge");
            AddBonusLevelSpell(oItem, IP_CONST_CLASS_WIZARD, 1, "Knowledge");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Helm of The Night
        case ("NightHat"):
        {
            SetLocalInt(oItem, "Darkvision", 5);
            AddDarkvision(oItem, "Darkvision");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Helm of Pretrification
        case ("PetrificationHat"):
        {
            SetLocalInt(oItem, "Petrification", 11);
            AddSpellCasts(oItem, IP_CONST_CASTSPELL_FLESH_TO_STONE_5, IP_CONST_CASTSPELL_NUMUSES_1_USE_PER_DAY, "Petrification");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Helm of True Sight
        case ("TruesightHat"):
        {
            SetLocalInt(oItem, "Seeing", 9);
            SetLocalInt(oItem, "iCasterLvl", 9);
            AddSpellCasts(oItem, IP_CONST_CASTSPELL_TRUE_SEEING_9, IP_CONST_CASTSPELL_NUMUSES_1_USE_PER_DAY, "Seeing");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Night Walker's
        case ("UnderdarkHat"):
        {
            SetLocalInt(oItem, "Daywalk", 1);
            SetLocalInt(oItem, "ShadowWeave", 1);
            AddDamageVulnerability(oItem, IP_CONST_DAMAGEVULNERABILITY_25_PERCENT, IP_CONST_DAMAGETYPE_POSITIVE, "Daywalk");
            AddDamageVulnerability(oItem, IP_CONST_DAMAGEVULNERABILITY_25_PERCENT, IP_CONST_DAMAGETYPE_DIVINE, "Daywalk");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+4);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Helm of Foresight
        case ("ForesightHat"):
        {
            SetLocalInt(oItem, "Precog", 10);
            AddMiscImmunity(oItem, IP_CONST_IMMUNITYMISC_BACKSTAB, "Precog");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+4);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Cloak of Displacement
        case ("Displacement"):
        {
            SetLocalInt(oItem, "Displacement", 7);
            SetLocalInt(oItem, "iCasterLvl", 7);
            AddSpellCasts(oItem, IP_CONST_CASTSPELL_DISPLACEMENT_9, IP_CONST_CASTSPELL_NUMUSES_2_USES_PER_DAY, "Displacement");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+4);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Cloak of Negative Plane Protection
        case ("NegativeProtection"):
        {
            SetLocalInt(oItem, "Drain", 1);
            AddMiscImmunity(oItem, IP_CONST_IMMUNITYMISC_LEVEL_ABIL_DRAIN, "NegativeProtection");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+3);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Boots of The Gargoyle
        case ( "GargoyleBoots"):
        {
            SetLocalInt(oItem, "Stoneskin", 7);
            SetLocalInt(oItem, "iCasterLvl", 7);
            AddSpellCasts(oItem, IP_CONST_CASTSPELL_STONESKIN_7, IP_CONST_CASTSPELL_NUMUSES_2_USES_PER_DAY, "Stoneskin");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
         // Boots of Reflexes
        case ( "ReflexBoots1"):
        {
            SetLocalInt(oItem, "Reflexes", 2);
            AddBonusSavingThrow(oItem, 2, IP_CONST_SAVEBASETYPE_REFLEX, "Reflexes");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "ReflexBoots2"):
        {
            SetLocalInt(oItem, "Reflexes", 4);
            AddBonusSavingThrow(oItem, 4, IP_CONST_SAVEBASETYPE_REFLEX, "Reflexes");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "ReflexBoots3"):
        {
            SetLocalInt(oItem, "Reflexes", 6);
            AddBonusSavingThrow(oItem, 6, IP_CONST_SAVEBASETYPE_REFLEX, "Reflexes");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+3);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "ReflexBoots4"):
        {
            SetLocalInt(oItem, "Reflexes", 8);
            AddBonusSavingThrow(oItem, 8, IP_CONST_SAVEBASETYPE_REFLEX, "Reflexes");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+4);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "ReflexBoots5"):
        {
            SetLocalInt(oItem, "Reflexes", 10);
            AddBonusSavingThrow(oItem, 10, IP_CONST_SAVEBASETYPE_REFLEX, "Reflexes");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+5);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Bags of Holding
        case ( "Holding1"):
        {
            SetLocalInt(oItem, "Holding", 1);
            AddWeightReduction(oItem, IP_CONST_REDUCEDWEIGHT_20_PERCENT, "Holding1");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "Holding2"):
        {
            SetLocalInt(oItem, "Holding", 2);
            AddWeightReduction(oItem, IP_CONST_REDUCEDWEIGHT_40_PERCENT, "Holding2");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "Holding3"):
        {
            SetLocalInt(oItem, "Holding", 3);
            AddWeightReduction(oItem, IP_CONST_REDUCEDWEIGHT_60_PERCENT, "Holding3");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "Holding4"):
        {
            SetLocalInt(oItem, "Holding", 4);
            AddWeightReduction(oItem, IP_CONST_REDUCEDWEIGHT_80_PERCENT, "Holding4");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "Holding5"):
        {
            SetLocalInt(oItem, "Holding", 5);
            AddWeightReduction(oItem, IP_CONST_REDUCEDWEIGHT_80_PERCENT, "Holding5");
            AddWeightReduction(oItem, IP_CONST_REDUCEDWEIGHT_20_PERCENT, "Holding5");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // AC Enhancements
        case ( "ACBonus1"):
        {
            SetLocalInt(oItem, "Defending", 1);
            SetLocalInt(oItem, "ArmorAC", 1);
            SetLocalInt(oItem, "Armor", 1);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            AddACBonus(oItem, 1, "ACBonus1");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "ACBonus2"):
        {
            SetLocalInt(oItem, "Defending", 2);
            SetLocalInt(oItem, "ArmorAC", 2);
            SetLocalInt(oItem, "Armor", 2);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            AddACBonus(oItem, 2, "ACBonus2");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "ACBonus3"):
        {
            SetLocalInt(oItem, "Defending", 3);
            SetLocalInt(oItem, "ArmorAC", 3);
            SetLocalInt(oItem, "Armor", 3);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+3);
            AddACBonus(oItem, 3, "ACBonus3");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "ACBonus4"):
        {
            SetLocalInt(oItem, "Defending", 4);
            SetLocalInt(oItem, "ArmorAC", 4);
            SetLocalInt(oItem, "Armor", 4);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+4);
            AddACBonus(oItem, 4, "ACBonus4");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "ACBonus5"):
        {
            SetLocalInt(oItem, "Defending", 5);
            SetLocalInt(oItem, "ArmorAC", 5);
            SetLocalInt(oItem, "Armor", 5);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+5);
            AddACBonus(oItem, 5, "ACBonus5");
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        //Ghost Touch
        case ( "GhostTouch"):
        {
            SetLocalInt(oItem, "GhostTouch", 1);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        //Elemental Weapon
        case ( "ElementalWeapon1"):
        {
            SetLocalInt(oItem, "Elemental", 1);
            switch (Random(6))
            {
                case (0):
                {
                    SetLocalInt(oItem, "Dark", 1);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_1d6, IP_CONST_DAMAGETYPE_NEGATIVE, "Dark");
                    break;
                }
                case (1):
                {
                    SetLocalInt(oItem, "Flame", 1);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_1d6, IP_CONST_DAMAGETYPE_FIRE, "Flame");
                    break;
                }
                case (2):
                {
                    SetLocalInt(oItem, "SONIC", 1);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_1d6, IP_CONST_DAMAGETYPE_SONIC, "SONIC");
                    break;
                }
                case (3):
                {
                    SetLocalInt(oItem, "COLD", 1);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_1d6, IP_CONST_DAMAGETYPE_COLD, "COLD");
                    break;
                }
                case (4):
                {
                    SetLocalInt(oItem, "SHOCK", 1);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_1d6, IP_CONST_DAMAGETYPE_ELECTRICAL, "SHOCK");
                    break;
                }
                case (5):
                {
                    SetLocalInt(oItem, "ACID", 1);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_1d6, IP_CONST_DAMAGETYPE_ACID, "ACID");
                    break;
                }
            }
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "ElementalWeapon2"):
        {
            SetLocalInt(oItem, "Elemental", 1);
            switch (Random(6))
            {
                case (0):
                {
                    SetLocalInt(oItem, "Dark", 2);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_2d6, IP_CONST_DAMAGETYPE_NEGATIVE, "Dark2");
                    break;
                }
                case (1):
                {
                    SetLocalInt(oItem, "Flame", 2);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_2d6, IP_CONST_DAMAGETYPE_FIRE, "Flame2");
                    break;
                }
                case (2):
                {
                    SetLocalInt(oItem, "SONIC", 2);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_2d6, IP_CONST_DAMAGETYPE_SONIC, "SONIC2");
                    break;
                }
                case (3):
                {
                    SetLocalInt(oItem, "COLD", 2);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_2d6, IP_CONST_DAMAGETYPE_COLD, "COLD2");
                    break;
                }
                case (4):
                {
                    SetLocalInt(oItem, "SHOCK", 2);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_2d6, IP_CONST_DAMAGETYPE_ELECTRICAL, "SHOCK2");
                    break;
                }
                case (5):
                {
                    SetLocalInt(oItem, "ACID", 2);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_2d6, IP_CONST_DAMAGETYPE_ACID, "ACID2");
                    break;
                }
            }
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+4);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "ElementalWeapon3"):
        {
            SetLocalInt(oItem, "Elemental", 1);
            switch (Random(6))
            {
                case (0):
                {
                    SetLocalInt(oItem, "Dark", 3);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_2d8, IP_CONST_DAMAGETYPE_NEGATIVE, "Dark2");
                    break;
                }
                case (1):
                {
                    SetLocalInt(oItem, "Flame", 3);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_2d8, IP_CONST_DAMAGETYPE_FIRE, "Flame2");
                    break;
                }
                case (2):
                {
                    SetLocalInt(oItem, "SONIC", 3);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_2d8, IP_CONST_DAMAGETYPE_SONIC, "SONIC2");
                    break;
                }
                case (3):
                {
                    SetLocalInt(oItem, "COLD", 3);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_2d8, IP_CONST_DAMAGETYPE_COLD, "COLD2");
                    break;
                }
                case (4):
                {
                    SetLocalInt(oItem, "SHOCK", 3);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_2d8, IP_CONST_DAMAGETYPE_ELECTRICAL, "SHOCK2");
                    break;
                }
                case (5):
                {
                    SetLocalInt(oItem, "ACID", 3);
                    AddDamageBonus(oItem, IP_CONST_DAMAGEBONUS_2d8, IP_CONST_DAMAGETYPE_ACID, "ACID2");
                    break;
                }
            }
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+6);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Gloves/Bracers of Archery
        case ( "ArcheryHands1"):
        {
            SetLocalInt(oItem, "Archery", 3);
            AddBonusFeat(oItem, FEAT_POINT_BLANK_SHOT, "Archery1");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "ArcheryHands2"):
        {
            SetLocalInt(oItem, "Archery", 6);
            AddBonusFeat(oItem, FEAT_POINT_BLANK_SHOT, "Archery2");
            AddBonusFeat(oItem, FEAT_RAPID_SHOT, "Archery2");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Gauntlets/Bracers of Battle Mastery
        case ( "BattleMastery1"):
        {
            SetLocalInt(oItem, "Master", 5);
            AddBonusFeat(oItem, IP_CONST_FEAT_AMBIDEXTROUS, "Master1");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "BattleMastery2"):
        {
            SetLocalInt(oItem, "Master", 10);
            AddBonusFeat(oItem, IP_CONST_FEAT_AMBIDEXTROUS, "Master2");
            AddBonusFeat(oItem, IP_CONST_FEAT_TWO_WEAPON_FIGHTING, "Master2");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Gauntlets/Bracers of Divine Favor
        case ( "DivineFavor1"):
        {
            SetLocalInt(oItem, "DPGaunt", 5);
            SetLocalInt(oItem, "iCasterLvl", 5);
            AddBonusFeat(oItem, IP_CONST_FEAT_WEAPON_PROF_MARTIAL, "DPGaunt1");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "DivineFavor2"):
        {
            SetLocalInt(oItem, "DPGaunt", 10);
            SetLocalInt(oItem, "iCasterLvl", 5);
            AddBonusFeat(oItem, IP_CONST_FEAT_WEAPON_PROF_MARTIAL, "DPGaunt2");
            AddSpellCasts(oItem, IP_CONST_CASTSPELL_DIVINE_FAVOR_5, IP_CONST_CASTSPELL_NUMUSES_2_USES_PER_DAY, "DPGaunt2");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Shooting Stars
        case ( "ShootingStars"):
        {
            if (GetBaseItemType(oItem) == 52)
            {
                SetLocalInt(oItem, "Spined", 1);
                SetLocalInt(oItem, "iCasterLvl", 12);
                AddSpellCasts(oItem, IP_CONST_CASTSPELL_MAGIC_MISSILE_9, IP_CONST_CASTSPELL_NUMUSES_3_USES_PER_DAY, "Spined");
            }
            else
            {
                SetLocalInt(oItem, "Spined", 5);
                SetLocalInt(oItem, "iCasterLvl", 5);
                AddSpellCasts(oItem, IP_CONST_CASTSPELL_MAGIC_MISSILE_5, IP_CONST_CASTSPELL_NUMUSES_3_USES_PER_DAY, "Spined");
            }
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;

        }
        // Speed
        case ( "Speed"):
        {
            SetLocalInt(oItem, "Speed", 5);
            SetLocalInt(oItem, "iCasterLvl", 5);
            AddSpellCasts(oItem, IP_CONST_CASTSPELL_HASTE_5, IP_CONST_CASTSPELL_NUMUSES_2_USES_PER_DAY, "Speed");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Elemental Resist
        case ( "ElementalResist1"):
        {
            SetLocalInt(oItem, "Element", 1);
            switch (Random(5))
            {
                case (0): //Fire
                {
                    SetLocalInt(oItem, "Fire", 1);
                    AddDamageResist(oItem, IP_CONST_DAMAGERESIST_10, IP_CONST_DAMAGETYPE_FIRE, "Fire");
                }
                case (1): //Sonic
                {
                    SetLocalInt(oItem, "Sonic", 1);
                    AddDamageResist(oItem, IP_CONST_DAMAGERESIST_10, IP_CONST_DAMAGETYPE_SONIC, "Sonic");
                }
                case (2): //Cold
                {
                    SetLocalInt(oItem, "Cold", 1);
                    AddDamageResist(oItem, IP_CONST_DAMAGERESIST_10, IP_CONST_DAMAGETYPE_COLD, "Cold");
                }
                case (3): //Shock
                {
                    SetLocalInt(oItem, "Shock", 1);
                    AddDamageResist(oItem, IP_CONST_DAMAGERESIST_10, IP_CONST_DAMAGETYPE_ELECTRICAL, "Shock");
                }
                case (4): //Acid
                {
                    SetLocalInt(oItem, "Acid", 1);
                    AddDamageResist(oItem, IP_CONST_DAMAGERESIST_10, IP_CONST_DAMAGETYPE_ACID, "Acid");
                }
            }
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "ElementalResist2"):
        {
            SetLocalInt(oItem, "Element", 1);
            switch (Random(5))
            {
                case (0): //Fire
                {
                    SetLocalInt(oItem, "Fire", 2);
                    AddDamageResist(oItem, IP_CONST_DAMAGERESIST_20, IP_CONST_DAMAGETYPE_FIRE, "Fire");
                }
                case (1): //Sonic
                {
                    SetLocalInt(oItem, "Sonic", 2);
                    AddDamageResist(oItem, IP_CONST_DAMAGERESIST_20, IP_CONST_DAMAGETYPE_SONIC, "Sonic");
                }
                case (2): //Cold
                {
                    SetLocalInt(oItem, "Cold", 2);
                    AddDamageResist(oItem, IP_CONST_DAMAGERESIST_20, IP_CONST_DAMAGETYPE_COLD, "Cold");
                }
                case (3): //Shock
                {
                    SetLocalInt(oItem, "Shock", 2);
                    AddDamageResist(oItem, IP_CONST_DAMAGERESIST_20, IP_CONST_DAMAGETYPE_ELECTRICAL, "Shock");
                }
                case (4): //Acid
                {
                    SetLocalInt(oItem, "Acid", 2);
                    AddDamageResist(oItem, IP_CONST_DAMAGERESIST_20, IP_CONST_DAMAGETYPE_ACID, "Acid");
                }
            }
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+3);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "ElementalResist3"):
        {
            SetLocalInt(oItem, "Element", 1);
            switch (Random(5))
            {
                case (0): //Fire
                {
                    SetLocalInt(oItem, "Fire", 3);
                    AddDamageResist(oItem, IP_CONST_DAMAGERESIST_30, IP_CONST_DAMAGETYPE_FIRE, "Fire");
                }
                case (1): //Sonic
                {
                    SetLocalInt(oItem, "Sonic", 3);
                    AddDamageResist(oItem, IP_CONST_DAMAGERESIST_30, IP_CONST_DAMAGETYPE_SONIC, "Sonic");
                }
                case (2): //Cold
                {
                    SetLocalInt(oItem, "Cold", 3);
                    AddDamageResist(oItem, IP_CONST_DAMAGERESIST_30, IP_CONST_DAMAGETYPE_COLD, "Cold");
                }
                case (3): //Shock
                {
                    SetLocalInt(oItem, "Shock", 3);
                    AddDamageResist(oItem, IP_CONST_DAMAGERESIST_30, IP_CONST_DAMAGETYPE_ELECTRICAL, "Shock");
                }
                case (4): //Acid
                {
                    SetLocalInt(oItem, "Acid", 3);
                    AddDamageResist(oItem, IP_CONST_DAMAGERESIST_30, IP_CONST_DAMAGETYPE_ACID, "Acid");
                }
            }
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+5);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Fortified
        case ( "Fortified"):
        {
            SetLocalInt(oItem, "Fortify", 1);
            AddMiscImmunity(oItem, IP_CONST_IMMUNITYMISC_CRITICAL_HITS, "Fortify");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+4);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Reeds
        case ( "Reed"):
        {
            SetLocalInt(oItem, "Reed", 1);
            AddBonusFeat(oItem, 63, "Reed");
            AddBonusFeat(oItem, 64, "Reed");
            AddWeightReduction(oItem, IP_CONST_REDUCEDWEIGHT_20_PERCENT, "Reed");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+4);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Undead Control
        case ( "UndeadControl"):
        {
            AddSpellCasts(oItem, IP_CONST_CASTSPELL_CONTROL_UNDEAD_13, IP_CONST_CASTSPELL_NUMUSES_1_USE_PER_DAY, "UndeadControl");
            SetLocalInt(oItem, "UndeadControl", 13);
            SetLocalInt(oItem, "iCasterLvl", 13);
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Resistance
        case ( "Resistance1"):
        {
            SetLocalInt(oItem, "Resistance", 1);
            AddBonusSavingThrow(oItem, 1, IP_CONST_SAVEBASETYPE_FORTITUDE, "Resistance");
            AddBonusSavingThrow(oItem, 1, IP_CONST_SAVEBASETYPE_REFLEX, "Resistance");
            AddBonusSavingThrow(oItem, 1, IP_CONST_SAVEBASETYPE_WILL, "Resistance");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "Resistance2"):
        {
            SetLocalInt(oItem, "Resistance", 2);
            AddBonusSavingThrow(oItem, 2, IP_CONST_SAVEBASETYPE_FORTITUDE, "Resistance");
            AddBonusSavingThrow(oItem, 2, IP_CONST_SAVEBASETYPE_REFLEX, "Resistance");
            AddBonusSavingThrow(oItem, 2, IP_CONST_SAVEBASETYPE_WILL, "Resistance");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "Resistance3"):
        {
            SetLocalInt(oItem, "Resistance", 3);
            AddBonusSavingThrow(oItem, 3, IP_CONST_SAVEBASETYPE_FORTITUDE, "Resistance");
            AddBonusSavingThrow(oItem, 3, IP_CONST_SAVEBASETYPE_REFLEX, "Resistance");
            AddBonusSavingThrow(oItem, 3, IP_CONST_SAVEBASETYPE_WILL, "Resistance");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+3);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "Resistance4"):
        {
            SetLocalInt(oItem, "Resistance", 4);
            AddBonusSavingThrow(oItem, 4, IP_CONST_SAVEBASETYPE_FORTITUDE, "Resistance");
            AddBonusSavingThrow(oItem, 4, IP_CONST_SAVEBASETYPE_REFLEX, "Resistance");
            AddBonusSavingThrow(oItem, 4, IP_CONST_SAVEBASETYPE_WILL, "Resistance");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+4);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "Resistance5"):
        {
            SetLocalInt(oItem, "Resistance", 5);
            AddBonusSavingThrow(oItem, 5, IP_CONST_SAVEBASETYPE_FORTITUDE, "Resistance");
            AddBonusSavingThrow(oItem, 5, IP_CONST_SAVEBASETYPE_REFLEX, "Resistance");
            AddBonusSavingThrow(oItem, 5, IP_CONST_SAVEBASETYPE_WILL, "Resistance");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+5);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // Invisibility
        case ( "Invisibility"):
        {
            AddSpellCasts(oItem, IP_CONST_CASTSPELL_INVISIBILITY_3, IP_CONST_CASTSPELL_NUMUSES_2_USES_PER_DAY, "Invisibility");
            SetLocalInt(oItem, "Invisibility", 5);
            if (GetBaseItemType(oItem) == 52)
            {
                SetLocalInt(oItem, "iCasterLvl", 12);
            }
            else
            {
                SetLocalInt(oItem, "iCasterLvl", 5);
            }
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // STR
        case ( "STRBuff1"):
        {
            SetLocalInt(oItem, "Giant", 2);
            SetLocalInt(oItem, "OgreStr", 2);
            AddAbilityBonus(oItem, 2, ABILITY_STRENGTH, "STRBuff1");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "STRBuff2"):
        {
            SetLocalInt(oItem, "Giant", 4);
            SetLocalInt(oItem, "OgreStr", 4);
            AddAbilityBonus(oItem, 4, ABILITY_STRENGTH,  "STRBuff2");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "STRBuff3"):
        {
            SetLocalInt(oItem, "Giant", 6);
            SetLocalInt(oItem, "OgreStr", 6);
            AddAbilityBonus(oItem, 6, ABILITY_STRENGTH,  "STRBuff3");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+3);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // DEX
        case ( "DEXBuff1"):
        {
            SetLocalInt(oItem, "Dexterity", 2);
            SetLocalInt(oItem, "Swiftness", 2);
            SetLocalInt(oItem, "Agility", 2);
            AddAbilityBonus(oItem, 2, ABILITY_DEXTERITY, "DEXBuff1");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "DEXBuff2"):
        {
            SetLocalInt(oItem, "Dexterity", 4);
            SetLocalInt(oItem, "Swiftness", 4);
            SetLocalInt(oItem, "Agility", 4);
            AddAbilityBonus(oItem, 4, ABILITY_DEXTERITY, "DEXBuff2");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "DEXBuff3"):
        {
            SetLocalInt(oItem, "Dexterity", 6);
            SetLocalInt(oItem, "Swiftness", 6);
            SetLocalInt(oItem, "Agility", 6);
            AddAbilityBonus(oItem, 6, ABILITY_DEXTERITY, "DEXBuff3");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+3);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // CON
        case ( "CONBuff1"):
        {
            SetLocalInt(oItem, "Striding", 2);
            SetLocalInt(oItem, "Vitality", 2);
            SetLocalInt(oItem, "Health", 2);
            AddAbilityBonus(oItem, 2, ABILITY_CONSTITUTION, "CONBuff1");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "CONBuff2"):
        {
            SetLocalInt(oItem, "Striding", 4);
            SetLocalInt(oItem, "Vitality", 4);
            SetLocalInt(oItem, "Health", 4);
            AddAbilityBonus(oItem, 4, ABILITY_CONSTITUTION, "CONBuff2");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "CONBuff3"):
        {
            SetLocalInt(oItem, "Striding", 6);
            SetLocalInt(oItem, "Vitality", 6);
            SetLocalInt(oItem, "Health", 6);
            AddAbilityBonus(oItem, 6, ABILITY_CONSTITUTION, "CONBuff3");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+3);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // INT
        case ( "INTBuff1"):
        {
            SetLocalInt(oItem, "Intellect", 2);
            AddAbilityBonus(oItem, 2, ABILITY_INTELLIGENCE, "INTBuff1");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "INTBuff2"):
        {
            SetLocalInt(oItem, "Intellect", 4);
            AddAbilityBonus(oItem, 4, ABILITY_INTELLIGENCE, "INTBuff2");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "INTBuff3"):
        {
            SetLocalInt(oItem, "Intellect", 6);
            AddAbilityBonus(oItem, 6, ABILITY_INTELLIGENCE, "INTBuff3");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+3);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // WIS
        case ( "WISBuff1"):
        {
            SetLocalInt(oItem, "Wisdom", 2);
            AddAbilityBonus(oItem, 2, ABILITY_WISDOM, "WISBuff1");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "WISBuff2"):
        {
            SetLocalInt(oItem, "Wisdom", 4);
            AddAbilityBonus(oItem, 4, ABILITY_WISDOM, "WISBuff2");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "WISBuff3"):
        {
            SetLocalInt(oItem, "Wisdom", 6);
            AddAbilityBonus(oItem, 6, ABILITY_WISDOM, "WISBuff3");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+3);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // CHA
        case ( "CHABuff1"):
        {
            SetLocalInt(oItem, "Nymph", 2);
            SetLocalInt(oItem, "Glamour", 2);
            AddAbilityBonus(oItem, 2, ABILITY_WISDOM, "CHABuff1");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "CHABuff2"):
        {
            SetLocalInt(oItem, "Nymph", 4);
            SetLocalInt(oItem, "Glamour", 4);
            AddAbilityBonus(oItem, 4, ABILITY_WISDOM, "CHABuff2");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "CHABuff3"):
        {
            SetLocalInt(oItem, "Nymph", 6);
            SetLocalInt(oItem, "Glamour", 6);
            AddAbilityBonus(oItem, 6, ABILITY_WISDOM, "CHABuff3");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+3);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        // DIVINE POWER! (Bracers of Relentless Might)
        case ( "DivinePower1"):
        {
            SetLocalInt(oItem, "Relentless", 1);
            AddMiscImmunity(oItem, IP_CONST_IMMUNITYMISC_KNOCKDOWN, "Relentless1");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+1);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "DivinePower2"):
        {
            SetLocalInt(oItem, "Relentless", 2);
            AddMiscImmunity(oItem, IP_CONST_IMMUNITYMISC_KNOCKDOWN, "Relentless2");
            AddAbilityBonus(oItem, 2, ABILITY_STRENGTH, "Relentless2");
            AddAbilityBonus(oItem, 2, ABILITY_CONSTITUTION, "Relentless2");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+2);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "DivinePower3"):
        {
            AddMiscImmunity(oItem, IP_CONST_IMMUNITYMISC_KNOCKDOWN, "Relentless3");
            AddAbilityBonus(oItem, 3, ABILITY_STRENGTH, "Relentless3");
            AddAbilityBonus(oItem, 3, ABILITY_CONSTITUTION, "Relentless3");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+3);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "DivinePower4"):
        {
            AddMiscImmunity(oItem, IP_CONST_IMMUNITYMISC_KNOCKDOWN, "Relentless4");
            AddAbilityBonus(oItem, 4, ABILITY_STRENGTH, "Relentless4");
            AddAbilityBonus(oItem, 4, ABILITY_CONSTITUTION, "Relentless4");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+4);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "DivinePower5"):
        {
            AddMiscImmunity(oItem, IP_CONST_IMMUNITYMISC_KNOCKDOWN, "Relentless5");
            AddAbilityBonus(oItem, 5, ABILITY_STRENGTH, "Relentless5");
            AddAbilityBonus(oItem, 5, ABILITY_CONSTITUTION, "Relentless5");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+5);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }
        case ( "DivinePower6"):
        {
            AddMiscImmunity(oItem, IP_CONST_IMMUNITYMISC_KNOCKDOWN, "Relentless6");
            AddAbilityBonus(oItem, 6, ABILITY_STRENGTH, "Relentless6");
            AddAbilityBonus(oItem, 6, ABILITY_CONSTITUTION, "Relentless6");
            SetLocalInt(oItem, "WeaponCap"/**/, GetLocalInt(oItem, "WeaponCap")+6);
            SetLocalInt(oItem, "AccessoryCap", GetLocalInt(oItem, "WeaponCap")); SetLocalInt(oItem, "ArmorCap", GetLocalInt(oItem, "WeaponCap")); break/**/;
        }



    }
    WriteTimestampedLogEntry("Enchant passed");
}
