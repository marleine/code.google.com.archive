#ifndef _GLOBAL_H_
#define _GLOBAL_H_

#include "square.h"
#include "piece.h"

#define displacement 40

#define squareSize 40

//panel width 240
#define width 640
#define height 800

#define initial_posx 4
#define initial_posy 20

#define nextPiece_posx 12
#define nextPiece_posy 15

int num;

int newGame;

int lines, level, score;

char lineNum [4];
char levelNum [2];
char scoreNum [5];

int timerNum;

int dropping_piece_posx, dropping_piece_posy;

int pieceTurn, nextPieceTurn;

piece* falling_piece;

piece* next_piece;

int pause;

int done;

square* tetrisBoard [10][22];

#endif
