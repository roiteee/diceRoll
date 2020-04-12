extends Node2D

var diceOutput	# variable to hold the random output of the dice
var isRolling = false	# if the rolling animation is playing this will be true
	
#This is the function that starts the rolling if the dice is 
#not already rolling
func rollDice():
	if not isRolling:
		#randomize() function allows for different random everytime
		randomize()
		#randi() function built in function which returns a random integer
		#here %6 returns the remainder of the random generated number
		#after divided by 6. So the number is from 0 and 5. We add 1
		#so that the output is from 1 to 6
		diceOutput = randi()%6+1
		#print for testing. It won't be shown on screen only for debugging.
		print(diceOutput)
		#The diceOutput is already calculated. We have to show that the 
		#dice is rolling and then the number had come, when in fact even
		#before playing rolling animation, we know the answer.
		playRollDice()
	
#this function plays the rolling animation, after the animation is finished
#playing a signal is given which plays the showOutput() function
func playRollDice():
	isRolling = true
	print("I am playing")
	$AnimatedSpriteRoll.visible=true
	$AnimatedSpriteRoll.play("roll")
	
#this function is run after the rolling animation is finished.
#Here we have to send the rolling animation to frame 0, otherwise next time
#the animation will not run since the animation is already on the last frame.
#Also we have to set playing to false, otherwise the animation will keep
#playing and the debug text "Test" shows again and again.
func showOutput():
	isRolling = false
	$AnimatedSpriteRoll.frame = 0
	$AnimatedSpriteRoll.playing = false
	$AnimatedSpriteRoll.visible = false
	print("Test")
	#show the correct dice according to diceOutput.
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
	
#this function allows to play the roll if spacebar or Enter is pressed.
func _input(event):
	if Input.is_action_pressed("ui_accept"):
		rollDice()

#this function plays when the signal of animation finished is given.
func _on_AnimatedSpriteRoll_animation_finished():
	showOutput()
