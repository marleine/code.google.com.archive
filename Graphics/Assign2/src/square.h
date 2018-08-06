#ifndef _SQUARE_H_
#define _SQUARE_H_

struct _square
{
	float red, green, blue;
	int x, y;
};

typedef struct _square square;

square* newSquare(float r, float g, float b, int px, int py);

void drawSquare(square* s, int x, int y);

#endif
