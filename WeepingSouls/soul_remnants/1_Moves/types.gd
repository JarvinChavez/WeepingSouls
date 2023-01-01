extends Node
func damage_after_types(Raw_Damage, attackMoveType: MoveStats, defenseType1: SRstats, defenseType2: SRstats) -> int:
	
	var Move_type = attackMoveType.type # attack
	var onDefense_type1 = defenseType1.type # defense
	var onDefense_type2 = defenseType2.type
	var TMC_dam = 0
	
					# defend:
	var type_advantages = [#fire    water electric symbiotic ice   combat   terra  esper   phantom  metallic   corrosive  chaotic  air   # attack:
							[0.5,    0.5,    1.0,     2.0,    2.0,   1.0,    1.0,   1.0,      1.0,     2.0,       1.0,       2.0,   2.0], # fire 
		
							[2.0,    0.5,    1.0,     0.5,    1.0,   1.0,    2.0,   1.0,      1.0,     1.0,       2.0,       1.0,   0.5], # water

							[0.5,    2.0,    0.5,     0.5,    1.0,   1.0,    0.0,   1.0,      1.0,     1.0,       0.5,       1.0,   2.0], # electric

							[0.5,    2.0,    1.0,     0.5,    1.0,   1.0,    2.0,   1.0,      1.0,     0.5,       0.5,       2.0,   0.5], # symbiotic

							[0.5,    0.5,    1.0,     2.0,    0.5,   1.0,    2.0,   1.0,      1.0,     0.5,       0.5,       1.0,   2.0], # ice

							[1.0,    1.0,    1.0,     1.0,    2.0,   2.0,    1.0,   0.5,      0.0,     2.0,       1.0,       2.0,   0.5], # combat

							[2.0,    1.0,    2.0,     0.5,    1.0,   1.0,    0.5,   1.0,	  1.0,     2.0,       2.0,       1.0,   0.0], # terra

							[1.0,    1.0,    1.0,     1.0,	  1.0,   2.0,    1.0,   0.5,	  2.0,     0.5,       2.0,       0.5,   1.0], # Esper

							[1.0,    1.0,    1.0,     1.0,	  1.0,   2.0,    0.5,   0.5,	  0.5,     0.5,       1.0,       0.5,   0.5], # phantom
			
							[1.0,    1.0,    1.0,     2.0,	  2.0,   0.5,    0.5,   1.0,	  0.5,     0.5,       1.0,       1.0,   0.5], # metallic

							[0.5,    2.0,    0.5,     2.0,	  1.0,   2.0,    0.0,   1.0,	  0.0,     2.0,       0.0,       1.0,   0.5], # corrosive

							[2.0,    2.0,    2.0,     1.0,	  0.5,   0.5,    1.0,   2.0,	  0.5,     1.0,       1.0,       0.5,   2.0], # chaotic

							[1.0,    0.5,    0.5,     2.0,    1.0,   2.0,    1.0,   1.0,      0.5,     0.5,       1.0,       1.0,   0.0] # air
						]
						
	TMC_dam = Raw_Damage * type_advantages[Move_type][onDefense_type1] # first check
	
	if defenseType2.type != SRstats.none:
		TMC_dam = TMC_dam * type_advantages[Move_type][onDefense_type2] # second check if the defending pokemon has 2 types
	
	return TMC_dam
	
