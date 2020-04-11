extends Node2D

var diceOutput

func _ready():
	rollDice()
	
func rollDice():
	randomize()
	diceOutput = randi()%6+1
	print(diceOutput)
	
func _input(event):
	if Input.is_action_pressed("ui_accept"):
		rollDice()
