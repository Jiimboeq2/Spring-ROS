function main()
{
;add Wreck Havok to cast stack with tag wreckhavok.  
    do
    {
	while ${Me.InCombat} 
        {
			if ${Me.Ability[id,1169247006].TimeUntilReady} <= 1
				{
				 OgreBotAPI:ChangeCastStackListBoxItemByTag[${Me.Name},WreckHavok,False]
				}
			if ${Me.Ability[id,1169247006].TimeUntilReady} > 1
				{
				OgreBotAPI:ChangeCastStackListBoxItemByTag[${Me.Name},WreckHavok,True]
				}
		wait 10 
		}
        
		
	wait 50	
    }
	
    while 1
}