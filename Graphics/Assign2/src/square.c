#include <GL/glut.h>
#include <stdlib.h>
#include <stdio.h>

#include "square.h"

#include "global.h"

square* newSquare(float r, float g, float b, int px, int py)
{
	//printf("creating new square with x = %d y = %d\n", px, py);
	square* x= malloc ( sizeof ( square ));
 		x->red=r;
 		x->green=g;
 		x->blue=b;
 		x->x=px;
 		x->y=py;
 		return x;	
}

void drawSquare(square* s, int x, int y)
 {
 	//printf("should draw: %d, %d\n", x, y);
 	glColor3f ( s->red, s->green, s->blue );
	glRecti ( x*squareSize+1, y*squareSize+1, (x+1)*squareSize-1, (y+1)*squareSize-1 );
 }
 



