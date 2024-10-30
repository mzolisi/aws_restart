import random

print("Welcome to Guess the Number!")
print("The rules are simple. I will think of a number, and you will try to guess it.")
number = random.randint(1,10) # generate a random number between 1 and 10 by using the randint() function of the random module.
isGuessRight = False            # Track whether the user guessed your number by creating a variable called isGuessRight:

while isGuessRight != True:                                 #The while loop will repeat the code inside the loop until the number is guessed correctly, which is represented by the condition isGuessRight != True in the code.
    guess = input("Guess a number between 1 and 10: ")      #Accept a guess from the user
    if int(guess) == number:                                    #Check if the guess from the user matches the random number in the game
        print("You guessed {}. That is correct! You win!".format(guess))    #If the guess is right, print a winning message
        isGuessRight = True                                                 # Set the iSguessRight TRUE/FALSE tracking variable to TRUE, so that the next iteration knows that the user guessed correctly and the game is over
    else:
        print("You guessed {}. Sorry, that isn’t it. Try again.".format(guess)) #As long the user's guess is incorrect print a failure message so they can try again on the next iteration of the loop