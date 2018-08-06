#include <GL/glut.h>
#include <stdlib.h>

#include "piece.h"
#include <stdio.h>
#include "global.h"
#include "square.h"

void pieceShapeInit(piece* p)
{
	int i=0;
	while ( i<4)
	{
		p->pieceShape[i]=NULL;
		i++;
	}
}

void displayPieceShape(piece* p)
 {
 	//printf("entered displayPieceShape\n");
 	int i=0;
	while ( i<4 )
	{
		//printf("should enter in condtion to enter drawSquare\n");
		if(p->pieceShape[i]!=NULL)
		{
			//printf("in condtion to enter drawSquare\n");
			drawSquare( p->pieceShape[i], p->x+p->pieceShape[i]->x, p->y+p->pieceShape[i]->y );
		}
		i++;
	}
 }

piece* newPiece(int type, float r, float g, float b, int px, int py)
{
	//printf("creating new piece with x = %d y = %d, type = %d\n", px, py, type);
	piece* x = malloc ( sizeof ( piece ));
		x->type=type;
 		x->red=r;
 		x->green=g;
 		x->blue=b;
 		x->x=px;
 		x->y=py;
 		 		
 		if(type == 0) //I
 		{
 			x->pieceShape[0] = newSquare(r, g, b, 0.0, 0.0);
 			x->pieceShape[1] = newSquare(r, g, b, 0.0-1.0, 0.0);
 			x->pieceShape[2] = newSquare(r, g, b, 0.0+1.0, 0.0);
 			x->pieceShape[3] = NULL;
 			//printf("booooooooooooooooooooooo\n");
 		}
 		else if(type == 1) //T
 		{
 			x->pieceShape[0] = newSquare(r, g, b, 0, 0);
 			x->pieceShape[1] = newSquare(r, g, b, 0-1, 0);
 			x->pieceShape[2] = newSquare(r, g, b, 0+1, 0);
 			x->pieceShape[3] = newSquare(r, g, b, 0, 0+1);;
 		}
 		else if(type == 2) //O
 		{
 			x->pieceShape[0] = newSquare(r, g, b, 0, 0);
 			x->pieceShape[1] = newSquare(r, g, b, 0+1, 0);
 			x->pieceShape[2] = newSquare(r, g, b, 0, 0+1);
 			x->pieceShape[3] = newSquare(r, g, b, 0+1, 0+1);
 		}
 		else if(type == 3) //L
 		{
 			x->pieceShape[0] = newSquare(r, g, b, 0, 0);
 			x->pieceShape[1] = newSquare(r, g, b, 0+1, 0);
 			x->pieceShape[2] = newSquare(r, g, b, 0, 0+1);
 			x->pieceShape[3] = NULL;
 		}
 		else if(type == 4) //J
 		{
 			x->pieceShape[0] = newSquare(r, g, b, 0, 0);
 			x->pieceShape[1] = newSquare(r, g, b, 0, 0-1);
 			x->pieceShape[2] = newSquare(r, g, b, 0+1, 0);
 			x->pieceShape[3] = NULL;
 		}
 		else if(type == 5) //S
 		{
 			x->pieceShape[0] = newSquare(r, g, b, 0, 0);
 			x->pieceShape[1] = newSquare(r, g, b, 0+1, 0);
 			x->pieceShape[2] = newSquare(r, g, b, 0+1, 0-1);
 			x->pieceShape[3] = newSquare(r, g, b, 0, 0+1);
  		}
 		else if(type == 6) //Z
 		{
 			x->pieceShape[0] = newSquare(r, g, b, 0, 0);
 			x->pieceShape[1] = newSquare(r, g, b, 0-1, 0);
 			x->pieceShape[2] = newSquare(r, g, b, 0-1, 0-1);
 			x->pieceShape[3] = newSquare(r, g, b, 0, 0+1);
 		}
 		return x;
}

void initFallingPieces(void)
{
	//printf("Entered drawPieces\n");

	if(pieceTurn == 0)
	{
		//printf("in condition\n");
		falling_piece = newPiece(0, 1.0, 0.0, 0.0, dropping_piece_posx, dropping_piece_posy);
	}
	else if(pieceTurn == 1)
	{
		falling_piece = newPiece(1, 194.0/255.0, 194.0/255.0, 194.0/255.0, dropping_piece_posx, dropping_piece_posy);
	}
	else if(pieceTurn == 2)
	{
		falling_piece = newPiece(2, 135.0/255.0, 206.0/255.0, 250.0/255.0, dropping_piece_posx, dropping_piece_posy);
	}
	else if(pieceTurn == 3)
	{
		falling_piece = newPiece(3, 1.0, 1.0, 0.0, dropping_piece_posx, dropping_piece_posy);
	}
	else if(pieceTurn == 4)
	{
		falling_piece = newPiece(4, 224.0/255.0, 102.0/255.0, 255.0/255.0, dropping_piece_posx, dropping_piece_posy);
	}
	else if(pieceTurn == 5)
	{
		falling_piece = newPiece(5, 0.0, 0.0, 1.0, dropping_piece_posx, dropping_piece_posy);
	}
	else if(pieceTurn == 6)
	{
		falling_piece = newPiece(6, 0.0, 1.0, 0.0, dropping_piece_posx, dropping_piece_posy);
	}
	displayPieceShape(falling_piece);
}


void initNextPieces(void)
{
	//printf("Entered drawPieces\n");

	if(nextPieceTurn == 0)
	{
		//printf("in condition\n");
		next_piece = newPiece(0, 1.0, 0.0, 0.0, nextPiece_posx+1, nextPiece_posy);
	}
	else if(nextPieceTurn == 1)
	{
		next_piece = newPiece(1, 194.0/255.0, 194.0/255.0, 194.0/255.0, nextPiece_posx+1, nextPiece_posy);
	}
	else if(nextPieceTurn == 2)
	{
		next_piece = newPiece(2, 135.0/255.0, 206.0/255.0, 250.0/255.0, nextPiece_posx, nextPiece_posy);
	}
	else if(nextPieceTurn == 3)
	{
		next_piece = newPiece(3, 1.0, 1.0, 0.0, nextPiece_posx, nextPiece_posy);
	}
	else if(nextPieceTurn == 4)
	{
		next_piece = newPiece(4, 224.0/255.0, 102.0/255.0, 255.0/255.0, nextPiece_posx, nextPiece_posy);
	}
	else if(nextPieceTurn == 5)
	{
		next_piece = newPiece(5, 0.0, 0.0, 1.0, nextPiece_posx, nextPiece_posy);
	}
	else if(nextPieceTurn == 6)
	{
		next_piece = newPiece(6, 0.0, 1.0, 0.0, nextPiece_posx+1, nextPiece_posy);
	}
	displayPieceShape(next_piece);
}

void rotatePiece(void)
{
	int z=0, oldx;
	if(falling_piece->type!=2  && checkBoundariesBottom() && checkBoundariesRotLeft() && checkBoundariesRotRight())
	while(z<4)
	{
		if(falling_piece->pieceShape[z]!=NULL)
		{
			oldx=falling_piece->pieceShape[z]->x;
			falling_piece->pieceShape[z]->x=-falling_piece->pieceShape[z]->y;
			falling_piece->pieceShape[z]->y=oldx;
		}
		z++;
	}
}
