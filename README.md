# two-o-player-math-game

## Description

Create a 2-Player math game where players take turns to answer simple math addition problems. A new math question is generated for each turn by picking two numbers between 1 and 20. The player whose turn it is is prompted the question and must answer correctly or lose a life.

## Details

Both players start with 3 lives. They lose a life if they mis-answer a question. At the end of every turn, the game should output the new scores for both players, so players know where they stand.

The game doesn’t end until one of the players loses all their lives. At this point, the game should announce who won and what the other player’s score is.

## Design

```
main
- Game.new.start
- exit

class Game
- data
  - players[]
  - current_player
- methods
  - constructor
    - init game name, players, current_player
    - welcome message
  - start()
    - main loop
      - new Turn with current player
      - turn.go()
      - loop with next player if current player not dead
    - output final results
    - say goodbye
    - return

class Turn
- data
  - player, question
- methods
  - constructor(player)
    - init player, new question
  - go()
    - display current player
    - ask question
    - display results
    - update lives, score appropriately

class Player
- data
  - name, lives, score
- methods
  - constructor
    - initialize name, lives, score
  - is_dead
    - return lives == 0

class Question
- data
  - attr_reader value1, value2
- methods
  - constructor
    - generates random numbers to add
  - ask
    - display question
    - wait for answer
    - return answer correct boolean
```
