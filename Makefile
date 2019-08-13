DEBUGFLAGS= -Wall -pedantic-errors -g  
OPTFLAGS= -Wall -pedantic-errors -O2 -O3

2048: Game.o Board.o GameInput.o 2048_play.o Tile.o Display.o randomNum.o AIinput.o
	g++ $(OPTFLAGS) Game.o Board.o GameInput.o 2048_play.o Tile.o Display.o randomNum.o AIinput.o -o 2048 -lncurses

2048-debug: Game_d.o Board_d.o GameInput_d.o 2048_play_d.o Tile_d.o Display_d.o randomNum_d.o
	g++ $(DEBUGFLAGS) Game_d.o Board_d.o GameInput_d.o 2048_play_d.o Tile_d.o Display_d.o randomNum_d.o -o 2048-debug -lncurses

2048-AI: Game.o Board.o AIinput.o 2048_AI.o Tile.o Display.o randomNum.o
	g++ $(OPTFLAGS) Game.o Board.o AIinput.o 2048_AI.o Tile.o Display.o randomNum.o -o 2048-AI -lncurses

2048_play.o: 2048_play.cpp
	g++ $(OPTFLAGS) -c 2048_play.cpp

2048_AI.o: 2048_AI.cpp
	g++ $(OPTFLAGS) -c 2048_AI.cpp

stats.o: stats.cpp
	g++ $(OPTFLAGS) -c stats.cpp

stats_d.o: stats.cpp
	g++ $(DEBUGFLAGS) -c stats.cpp -o stats_d.o

NoDisplay.o: NoDisplay.cpp NoDisplay.h
	g++ $(OPTFLAGS) -c NoDisplay.cpp

mainMenu.o: mainMenu.cpp mainMenu.h
	g++ $(OPTFLAGS) -c mainMenu.cpp

mainMenu_d.o: mainMenu.cpp mainMenu.h
	g++ $(DEBUGFLAGS) -c mainMenu.cpp -o mainMenu_d.o

Move.o: Move.cpp Move.h
	g++ $(OPTFLAGS) -c Move.cpp

Move_d.o: Move.cpp Move.h
	g++ $(DEBUGFLAGS) -c Move.cpp -o Move_d.o

Game.o: Game.cpp Game.h
	g++ $(OPTFLAGS) -c Game.cpp

Game_d.o: Game.cpp Game.h
	g++ $(DEBUGFLAGS) -c Game.cpp -o Game_d.o

GameInput.o: GameInput.cpp GameInput.h
	g++ $(OPTFLAGS) -c GameInput.cpp -lncurses 

GameInput_d.o: GameInput.cpp GameInput.h
	g++ $(DEBUGFLAGS) -c GameInput.cpp -o GameInput_d.o -lncurses

AIinput.o: AIinput.cpp AIinput.h GameInput.h
	g++ $(OPTFLAGS) -c AIinput.cpp

AIinput_d.o: AIinput.cpp AIinput.h GameInput.h
	g++ $(DEBUGFLAGS) -c AIinput.cpp -o AIinput_d.o

Board.o: Board.cpp Board.h Move.h
	g++ $(OPTFLAGS) -c Board.cpp 
	
Board_d.o: Board.cpp Board.h Move.h
	g++ $(DEBUGFLAGS) -c Board.cpp -o Board_d.o

Display.o: Display.cpp Display.h
	g++ $(OPTFLAGS) -c Display.cpp -lncurses

Display_d.o: Display.cpp Display.h
	g++ $(DEBUGFLAGS) -c Display.cpp -o Display_d.o -lncurses

Tile.o: Tile.cpp Tile.h
	g++ $(OPTFLAGS) -c Tile.cpp Tile.h 

Tile_d.o: Tile.cpp Tile.h
	g++ $(DEBUGFLAGS) -c Tile.cpp -o Tile_d.o

 randomNum.o: randomNum.cpp randomNum.h
	g++ $(OPTFLAGS) -c randomNum.cpp

randomNum_d.o: randomNum.cpp randomNum.h
	g++ $(DEBUGFLAGS) -c randomNum.cpp -o randomNum_d.o

main.o: main.cpp	
	g++ $(OPTFLAGS) -c main.cpp 

main_d.o: main.cpp
	g++ $(DEBUGFLAGS) -c main.cpp -o main_d.o

clean-obj:
	rm -rf *.o 2048

