extends Node2D

var diceOutput
var isRolling = false
	
func rollDice():
	if not isRolling:
		randomize()
		diceOutput = randi()%6+1
		print(diceOutput)
		playRollDice()
	
func playRollDice():
	isRolling = true
	print("I am playing")
	$AnimatedSpriteRoll.visible=true
	$AnimatedSpriteRoll.play("roll")
	
	
func showOutput():
	isRolling = false
	$AnimatedSpriteRoll.frame = 0
	$AnimatedSpriteRoll.visible = false
	print("Test")
	if diceOutput == 1:
		$AnimatedSprite.play("one")
	elif diceOutput == 2:
		$AnimatedSprite.play("two")
	elif diceOutput == 3:
		$AnimatedSprite.play("three")
	elif diceOutput == 4:
		$AnimatedSprite.play("four")
	elif diceOutput == 5:
		$AnimatedSprite.play("five")
	elif diceOutput == 6:
		$AnimatedSprite.play("six")
	

	
func _input(event):
	if Input.is_action_pressed("ui_accept"):
		rollDice()


func _on_AnimatedSpriteRoll_animation_finished():
	showOutput()
