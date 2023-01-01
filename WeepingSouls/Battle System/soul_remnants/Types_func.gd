extends Node

func damage_after_types(Raw_Damage, move: MoveStats, type:SRstats):
	
var Move_type = move.type
var onDefense_type = type.type
var onDefense_type2 = type.type1

if Move_type == 0:
		pass
	elif Move_type == 1: #chaotic Attacking
		if onDefense_type == 1: #chaotic
			if onDefense_type2  == 0:       #Chaotic/None
				TMC_dam = raw_dam * (0.5)
			elif onDefense_type2  == 1:    #Chaotic/Chaotic
					pass
			elif onDefense_type2 == 2:     #Phantom/Chaotic
				TMC_dam = raw_dam * (0.5 * 0.5)
			elif onDefense_type2  == 3:    #Heat/Chaotic
				TMC_dam = raw_dam * (0.5 * 2 )
			elif onDefense_type2  == 4:    #Water/Chaotic
				TMC_dam = raw_dam * (0.5 * 2)
			elif onDefense_type2 == 5:     #Combat/Chaotic
				MC_dam = raw_dam * (0.5 * 0.5)
			elif onDefense_type2  == 6:    #Terra/Chaotic
				TMC_dam = raw_dam * (0.5 * 1)
			elif onDefense_type2  == 7:    #Corrosive/Chaotic
				TMC_dam = raw_dam * (0.5 * 1)
			elif onDefense_type2  == 8:    #Metallic/Chaotic
				TMC_dam = raw_dam * (0.5 * 1)
			elif onDefense_type2 == 9:      #Ice/Chaotic
				TMC_dam = raw_dam * (0.5* 0.5)
			elif onDefense_type2  == 10:    #Electric/Chaotic
				TMC_dam = raw_dam * (0.5* 1)
			elif onDefense_type2  == 11:    #Esper/Chaotic
				TMC_dam = raw_dam * (0.5* 2)
			elif onDefense_type2  == 12:    #Air/Chaotic
				TMC_dam = raw_dam * (0.5* 2)
	elif onDefense_type == 2:      #Phantom
		if onDefense_type2  == 0:  #None/Phantom
			TMC_dam = raw_dam * (0.5)
		elif onDefense_type2  == 1: #chaotic/Phantom
				pass
		elif onDefense_type2 == 2:  #Phantom/Phantom
			MC_dam = raw_dam * (0.5 * 0.5)
		elif onDefense_type2  == 3:  #Heat/Phantom
			TMC_dam = raw_dam * (0.5 * 1)
		elif onDefense_type2  == 4:   #Water/Phantom
			TMC_dam = raw_dam * (0.5 *)
		elif onDefense_type2 == 5:    #Combat/Phantom
			TMC_dam = raw_dam * (0.5 *)
		elif onDefense_type2  == 6:   #Terra/Phantom
			TMC_dam = raw_dam * (0.5 *)
		elif onDefense_type2  == 7:   #Corrosive/Phantom
			TMC_dam = raw_dam * (0.5 *)
		elif onDefense_type2  == 8:    #Metallic/Phantom
			TMC_dam = raw_dam * (0.5 *)
		elif onDefense_type2 == 9:     #Ice/Phantom
			TMC_dam = raw_dam * (0.5*)
		elif onDefense_type2  == 10:   #Electric/Phantom
			TMC_dam = raw_dam * (0.5*)
		elif onDefense_type2  == 11:   #Esper/Phantom
				TMC_dam = raw_dam * (0.5*)
			elif onDefense_type2  == 12:    #Air/Phantom
				TMC_dam = raw_dam * (0.5* )
	elif onDefense_type == 3: #Heat
		pass
	elif onDefense_type == 4: #Water
		pass
	elif onDefense_type == 5: #Combat
		pass
	elif onDefense_type == 6: #Terra
		pass
	elif onDefense_type == 7: #Corrosive
		pass
	elif onDefense_type == 8: #Metallic
		pass
	elif onDefense_type == 9: #Ice
		pass
	elif onDefense_type == 10: #Electric
		pass
	elif onDefense_type == 11: #Esper
		pass
	elif onDefense_type == 12: #Air
		pass
elif Move_type == 1:
	pass
elif Move_type == 1:
	pass
elif Move_type == 1:
	pass
elif Move_type == 1:
	pass
elif Move_type == 1:
	pass
elif Move_type == 1:
	pass
elif Move_type == 1:
	pass
elif Move_type == 1:
	pass
elif Move_type == 1:
	pass
elif Move_type == 1:
	pass	
