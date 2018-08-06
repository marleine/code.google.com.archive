#include <GL/glut.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <sys/time.h>

#include "init.h"

#include "global.h"
#include "piece.h"

void initVariables(void)
{
	num=0;
	pieceTurn=nextPieceTurn;
	nextPieceTurn=rnd(7);
	done=0;
	dropping_piece_posx = initial_posx;
	dropping_piece_posy = initial_posy;
}

void tetrisBoardInit()
{
	int i=0, j=0;
	while ( i<20 )
	{
		j=0;
		while ( j<10 )
		{
			tetrisBoard[j][i]=NULL;
			j++;
		}
		i++;
	}
}

int rnd(int n)
{
	//printf( "random = %d\n", abs ((time(NULL)*rand())%(n)));
	return abs ((time(NULL)*rand())%(n));
}

void gameStart(void)
{
	initVariables();
	
	pieceShapeInit(falling_piece);

	pieceShapeInit(next_piece);

	//printf("pT = %d, nT = %d\n", pieceTurn, nextPieceTurn);
	//printf("random = %d\n", rnd(7));
	//printf ( "Position of drawing %d %d\n", dropping_piece_posx, dropping_piece_posy );
	start ();
	if(!gameOver())
		initFallingPieces();
	initNextPieces();
}

void myInit(void)
{
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	glClearColor(1.0,1.0,1.0,0.0);
	glPointSize(4.0);
	tetrisBoardInit();
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluOrtho2D(0.0, width, 0.0, height);
	
	newGame=0;
	
	initVariables();
	
	nextPieceTurn=rnd(7);
	
	next_piece = malloc(sizeof(piece));
	
	falling_piece = malloc(sizeof(piece));
	
	timerNum=800;
	
	lines=0;
	level=1;
	score=0;
	
	gameStart();
}
