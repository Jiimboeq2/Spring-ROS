function main(string Adorn="")
{
    variable string curAdorn
    variable string empAdorn
    variable string voidAdorn
    Switch ${Adorn}
    {
	case Fear
            empAdorn:Set[Empyral Rune: Blinding Gleam]
            voidAdorn:Set[Void Etched Rune: Blinding Gleam]
            break
        case Stun
            empAdorn:Set[Empyral Rune: Adamant Defiance]
            voidAdorn:Set[Void Etched Rune: Adamant Defiance]
            break
        case Stifle
            empAdorn:Set[Empyral Rune: Adamant Resolve]
            voidAdorn:Set[Void Etched Rune: Adamant Resolve]
            break
        case Mez
            empAdorn:Set[Empyral Rune: Astral Dominion]
            voidAdorn:Set[Void Etched Rune: Astral Dominion]
            break
        default
            echo Usage: Run adorn Fear|Stun|Stifle|Mez
            return
    }
    while (!${Me.Equipment[Waist].IsItemInfoAvailable})
    {
         wait 10
    }
    curAdorn:Set[${Me.Equipment[Waist].ToItemInfo.Adornment[${Me.Equipment[Waist].ToItemInfo.NumAdornmentsAttached}]}]
    if ${Me.Equipment[Waist].ToItemInfo.Condition}!=100
    {
        oc ${Me.Name}'s waist is damaged, repair first.
    }
    elseif ${curAdorn.Equal[${voidAdorn}]}
    { 
        echo "Already using ${voidAdorn}"
    }
    elseif ${Me.Inventory[Query, Location =- "Inventory" && Name =- "${voidAdorn}"].InContainerID}
    {
	echo "Applying ${voidAdorn}"
        Me.Inventory[Query, Location =- "Inventory" && Name =- "${voidAdorn}"]:Use
        wait 10
        Me.Inventory[Query, Location =- "Inventory" && Name =- "${voidAdorn}"]:EnchantItem[${Me.Equipment[Waist].ID}]
        wait 40
        press esc
    }
    elseif ${curAdorn.Equal[${empAdorn}]}
    { 
        echo "Already using ${empAdorn}"
    }
    elseif ${Me.Inventory[Query, Location =- "Inventory" && Name =- "${empAdorn}"].InContainerID}
    {
	echo "Applying ${empAdorn}"
        Me.Inventory[Query, Location =- "Inventory" && Name =- "${empAdorn}"]:Use
        wait 10
        Me.Inventory[Query, Location =- "Inventory" && Name =- "${empAdorn}"]:EnchantItem[${Me.Equipment[Waist].ID}]
        wait 40
        press esc
    }
    else
    {
        oc ${Me.Name} does not have a ${Adorn} rune to apply.
    }
}