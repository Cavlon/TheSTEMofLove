extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Submit.hide()
	$Clear.hide()
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Element_pressed(letter):
	var last_element
	var text = $Guess.text
	var last_index
	var number
	if len(text) > 0:
		last_index = len(text) - 1
		while ord(text[last_index]) < 60:
			last_index -= 1
		if last_index != len(text) -1:
			number = int(text.substr(last_index + 1, len(text)))
		else:
			number = 1
		if ord(text[last_index]) > 90:
			last_element = text.substr(last_index - 1, 2)
		else:
			last_element = text[last_index]
	if last_element == letter:
		number += 1
		text = text.substr(0, last_index + 1)
		text = text + str(number)
	else:
		text = text + letter
	$Guess.text = text
	$Guess.update()

var chemicals = {"methane": "CH4",
				"ethane": "C2H6",
				"propane": "C3H8",
				"butane": "C4H10",
				"octane": "C8H18",
				"ethene": "C2H4",
				"propene": "C3H6",
				"methanol": "CH3OH",
				"ethanol": "C2H3OH",
				"propanol": "C3H8",
				"calcium carbonate": "CaCO3",
				"hydrochloric acid": "HCl",
				"sulphuric acid": "H2SO4",
				"phosphoric acid": ".H3PO4",
				"nitric acid": "HNO3",
				"ammonia": "NO3",
				"acetic acid": "CH3CO2H",
				"carbon dioxide": "CO2",
				"hydrogen peroxide": "H2O2",
				"serotonin": "C10H12N2O",
				"oxytocin": "C43H66N12O12S2",
				"dopamine": "C8H11NO2",
				"magnesium oxide": "MgO",
				"aluminium oxide": "Al2O3",
				"Rhubidium chloride": "RbCl",
				"Magnesium Flouride": "MgF2",
				"Manganese sulphide": "MgS",
				"berilium carbonate": "BeCO3",
				"copper sulphate": "CuSO4",
				"sodium chloride": "NaCl",
				"potassium bromide": "KBr",
				"formaldehyde": "CH2O",
				"hydrogen cynide": "HCN",
				"water": "H2O",
				"lithium hydroxide": "LiOH",
				"Iron oxide": "Fe2O3", 
				"bauxite": "Al2H2O4",
				"silver nitrate": "AgNO3",
				"magnesium sulphate": "MgSO4",
				"caesium iodide": "CsI",
				"sodium iodide": "NaI",
				"glucose": "C6H12O6",
				}
var arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

func _on_Start_pressed():
	$Start.hide()
	$Submit.show()
	$Clear.show()
	var chemicals_list = chemicals.keys()
	print(len(chemicals_list))
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	for i in range(10):
		var x = rng.randi_range(0,31)
		print(x)
		var chem = chemicals_list[x]
		arr[i] = (chem)
		chemicals_list.remove(x)
		print(len(chemicals_list))
	print(arr)
	$Question.text = arr[0]
	$Question.update()

func _on_Submit_pressed(i, score):
	if len(arr) == 0:
		print(score)
	else:
		var ansKey = arr[0]
		print(ansKey)
		arr.remove(ansKey)
		var ans = chemicals[ansKey]
		print(ans)
		if ans == $Guess.text:
			score += 1
			$Score.text = str(int($Score.text)+1)
		if i < 9 and len(arr) > 0:
			print(i +1)
			$Question.text = str(arr[0])
			$Question.update()
		$Guess.text = ""
		$Guess.update()
		
		
func _on_Clear_pressed():
	$Guess.text = ""

	
		




