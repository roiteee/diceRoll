extends Node

# The big button is on the whole screen. When pressed it gets the node 'Dice'
# and executes its function rollDice()
func _on_Button_pressed():
	$Dice.rollDice()
