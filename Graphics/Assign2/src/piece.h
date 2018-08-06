#ifndef _PIECE_H_
#define _PIECE_H_

#include "square.h"

struct _piece
{
	int type;
	float red, green, blue;
	int x, y;
	square *pieceShape[4];
};

typedef struct _piece piece;

void pieceShapeInit(piece* p);

void displayPieceShape(piece* p);

piece* newPiece(int type, float r, float g, float b, int px, int py);

void initFallingPieces(void);

void initNextPieces(void);

void rotatePiece(void);

#endif
