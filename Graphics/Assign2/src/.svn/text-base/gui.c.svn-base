#include <GL/glut.h>
#include <stdlib.h>
#include <stdio.h>

#include "gui.h"

#include "global.h"
#include "keyboard.h"
#include "piece.h"
#include "square.h"

void panel(void)
{
	glColor3f (0.0, 0.0, 0.0);
	
	glRasterPos2i(465, 720);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "Next piece: ");
	glRasterPos2i(466, 720);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "Next piece: ");
	
	glRasterPos2i(420, 480);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "Number of Lines: ");
	glRasterPos2i(421, 480);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "Number of Lines: ");
	
	sprintf (lineNum, "%d", lines);
	glRasterPos2i(575, 480);
	glutBitmapString(GLUT_BITMAP_9_BY_15, lineNum);

	glRasterPos2i(470, 415);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "Score: ");
	glRasterPos2i(471, 415);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "Score: ");
	
	sprintf (scoreNum, "%d", score);
	glRasterPos2i(575, 415);
	glutBitmapString(GLUT_BITMAP_9_BY_15, scoreNum);
	
	glRasterPos2i(470, 350);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "Level: ");
	glRasterPos2i(471, 350);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "Level: ");
	
	sprintf (levelNum, "%d", level);
	glRasterPos2i(575, 350);
	glutBitmapString(GLUT_BITMAP_9_BY_15, levelNum);
	
	glRasterPos2i(440, 220);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "For quit, press 'q'");
	glRasterPos2i(441, 220);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "For quit, press 'q'");
	
	if(gameOver())
		glColor3f (194.0/255.0, 194.0/255.0, 194.0/255.0);
	
	glRasterPos2i(435, 260);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "For pause, press 'p'");
	glRasterPos2i(436, 260);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "For pause, press 'p'");
	
	glRasterPos2i(415, 120);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "For rotation, press 'Up'");
	glRasterPos2i(416, 120);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "For rotation, press 'Up'");
	
	glRasterPos2i(410, 70);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "N.B. Each press of 'Down'");
	
	glRasterPos2i(440, 50);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "accelerates more!");
	
	glRasterPos2i(410, 30);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "So don't keep pressing!!");
	
	if(!gameOver())
		glColor3f (194.0/255.0, 194.0/255.0, 194.0/255.0);
	else glColor3f (0.0, 0.0, 0.0);
	
	glRasterPos2i(420, 180);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "For new game, press 'g'");
	glRasterPos2i(421, 180);
	glutBitmapString(GLUT_BITMAP_9_BY_15, "For new game, press 'g'");
}

void drawLine(void)
{
	//glColor3f(140.0/255.0, 140.0/255.0, 140.0/255.0);
	glBegin ( GL_LINE );
	glVertex2i ( 400, 0 );
	glVertex2i ( 400, 800);
	glEnd ();
}

void delay(int x)
{
	int i=0, j=0;
	while (i<x)
	{
		while (j<x)
		{
			j++;
		}
		i++;
	}
}

int gameOver(void)
{
	int j=0;
	while(j<10)
	{
		if(tetrisBoard[j][19]!=NULL)
			return 1;
		j++;
	}
	return 0;
}

void lineErase(void)
{
	int i=0, j, full, numFull=1, a=0, k=0, temp=0;
	int rows [5];
	
	while (k<5)
	{
		//printf("into rows=-1\n");
		rows[k]=-1;
		k++;
	}
	
	while(i<20)
	{
		full=1;
		j=0;
		while(j<10)
		{
			if(tetrisBoard[j][i]==NULL || full==0)
			{
				//printf("into null\n");
				full=0;
				break;
			}
			j++;
		}
		
		if(full)
		{
			//printf("into fullllllllllllllllllll\n");
			k=0;
			lines+=1;
			//printf(" lines/10 = %d, level = %d\n", lines/10, level);
			if((lines/10)>=level)
			{
				if(timerNum>100)
				{
					timerNum-=100;
					level+=1;
					//printf(" timerNum = %d\n", timerNum);
				}
			}
			//printf("lines = %d\n", lines);
			while(k<5)
			{
				if(rows[k]==-1)
				{
					//printf("into making rows full\n");
					rows[k]=i;
					if(k>0)
						if(rows[k-1]==rows[k]-1)
							numFull++;
					break;
				}
				else k++;
			}
		}
		i++;
	}
	
	k=0;
	temp=numFull;
	while(k<5)
	{
		if(rows[k]!=-1)
		{
			//printf("k = %d and numFull = %d and KKK = %d and a= %d\n", rows[k],numFull, k, a);
			j=0;
			a=0;
			while(j<10)
			{
				//printf("into erase  and KKK = %d  and a = %d\n", k, a);
				//printf(" num full = % , rows[k] = %d, a = %d\n", numFull, rows[k], rows[k]+numFull);
				if(temp==1 && k>0)
					a=rows[k]-k;
				else a=rows[k];
				//free (tetrisBoard[j][a]);
				tetrisBoard[j][a]=tetrisBoard[j][a+numFull];
				//printBoard();
				//printf("\n");
				//printf(" z = %d\n", z);
				//printf(" while z< %d\n", 19-rows[k]-numFull);
				if (temp==1 && k>0)
					a=rows[k]+numFull-k;
				else a=rows[k]+numFull;			
				while(a<20-numFull)
				{
					//printf("boooooooooooooooo inside dropping!!!!!!!!  a = %d \n", a);
					//free(tetrisBoard[j][a]);
					tetrisBoard[j][a]=tetrisBoard[j][a+1];
					a++;
				}
				//printBoard();
				//printf("\n");
				j++;
				if(numFull<=1)
					numFull=1;
				else if(j>9)
					numFull--;
			}
			k++;	
		}
		else k++;
	}
}

void printBoard(void)
{
	int i=19, j=0;
	while ( i>=0 )
	{
		j=0;
		while ( j<10 )
		{
			if(tetrisBoard[j][i]!=NULL)
			{
				printf("#");
			}
			else printf("O");
			j++;
		}
		printf("\n");
		i--;
	}
}

void displayTetrisBoard(void)
 {
 	
	int i=19, j=0;
	while ( i>=0 )
	{
		j=0;
		while ( j<10 )
		{
			if(tetrisBoard[j][i]!=NULL)
			{
				drawSquare(tetrisBoard[j][i], j, i);
			}
			j++;
		}
		i--;
	}
 }
 
void addTetrisBoard()
{
 	//printf("entered addtetrisboard\n");
 	int z=0;
 	while (z<4)
 	{
 		if(falling_piece->pieceShape[z]!=NULL)
 		{
 			tetrisBoard[falling_piece->pieceShape[z]->x+falling_piece->x][falling_piece->pieceShape[z]->y+falling_piece->y]= falling_piece->pieceShape[z];
 		}
 		z++;
 	}
}

int checkBoundariesRotBottom(void)
{
	int z=3;
 	while (z>=0)
 	{	
		//printf("pieceShape[%d] pieceTurn %d \n",z, pieceTurn);
 		if(falling_piece->pieceShape[z]!=NULL)
 		{
			//printf("pos of next y pos %d       and real y pos in falling piece %d\n", next, falling_piece->pieceShape[z]->y-1);
			if(tetrisBoard[falling_piece->x-falling_piece->pieceShape[z]->y][falling_piece->pieceShape[z]->x-1+falling_piece->y]==NULL && falling_piece->pieceShape[z]->x-1+falling_piece->y>=0)
				z--;
			else 
			{
				//printf("STOPPPP\n");
				//printBoard();
				return 0;
			}
		}
		else z--;
 	}
 	return 1;
}

int checkBoundariesRotLeft(void)
{
 	int z=0;
 	while (z<4)
 	{
 		//printf("Z %d\n",z);
 		if(falling_piece->pieceShape[z]!=NULL)
 		{
 			//printf("pos Right %d\n", next);
 			if(tetrisBoard[falling_piece->x-falling_piece->pieceShape[z]->y-1][falling_piece->pieceShape[z]->x+falling_piece->y]==NULL && falling_piece->x-falling_piece->pieceShape[z]->y-1>=-1)
 				z++;
 			else return 0;
 		}
 		else z++;
 	}
 	return 1;
}

int checkBoundariesRotRight(void)
{
 	int z=0;
 	while (z<4)
 	{
 		//printf("Z %d\n",z);
 		if(falling_piece->pieceShape[z]!=NULL)
 		{
 			//printf("pos Right %d\n", next);
 			if(tetrisBoard[falling_piece->x-falling_piece->pieceShape[z]->y+1][falling_piece->pieceShape[z]->x+falling_piece->y]==NULL && falling_piece->x-falling_piece->pieceShape[z]->y+1<=10)
 				z++;
 			else return 0;
 		}
 		else z++;
 	}
 	return 1;
}

int checkBoundariesBottom(void)
{
	//printf("in check\n");
	int z=3; /*empty=0;
	while (z>=0)
	{
		if(falling_piece->pieceShape[z]==NULL)
			empty=1;
		else empty=0;
		z--;
	}
	if(empty)
		return 0;
	
	z=3;*/
 	while (z>=0)
 	{	
		//printf("pieceShape[%d] pieceTurn %d \n",z, pieceTurn);
		//printf("%d \n", falling_piece->pieceShape[z]!=NULL);
 		if(falling_piece->pieceShape[z]!=NULL)
 		{
			//printf("real y pos in falling piece %d\n", falling_piece->pieceShape[z]->y-1);
			if(tetrisBoard[falling_piece->pieceShape[z]->x+falling_piece->x][falling_piece->pieceShape[z]->y-1+falling_piece->y]==NULL && falling_piece->pieceShape[z]->y-1+falling_piece->y>=0)
				z--;
			else 
			{
				//printf("STOPPPP\n");
				//printBoard();
				return 0;
			}
		}
		else z--;
 	}
 	return 1;
}

int checkBoundariesLeft(void)
{	
 	int z=0;
 	while (z<4)
 	{
 		//printf("Z %d\n",z);
 		if(falling_piece->pieceShape[z]!=NULL)
 		{
 			//printf("pos Left %d\n", next);
 			/*if(pieceTurn==0 || pieceTurn==1)
 			{
 				if(tetrisBoard[falling_piece->pieceShape[z]->x-1+falling_piece->x][falling_piece->pieceShape[z]->y+falling_piece->y]==NULL && falling_piece->pieceShape[z]->x-1+falling_piece->x>=1)
 					z++;
 				else return 0;
			}*/
			//else 
			if(tetrisBoard[falling_piece->pieceShape[z]->x-1+falling_piece->x][falling_piece->pieceShape[z]->y+falling_piece->y]==NULL && falling_piece->pieceShape[z]->x-1+falling_piece->x>=0)
					z++;
				else return 0;
 		}
 		else z++;
 	}
 	return 1;
}

int checkBoundariesRight(void)
{
 	int z=0;
 	while (z<4)
 	{
 		//printf("Z %d\n",z);
 		if(falling_piece->pieceShape[z]!=NULL)
 		{
 			//printf("pos Right %d\n", next);
 			if(tetrisBoard[falling_piece->pieceShape[z]->x+1+falling_piece->x][falling_piece->pieceShape[z]->y+falling_piece->y]==NULL && falling_piece->pieceShape[z]->x+1+falling_piece->x<10)
 				z++;
 			else return 0;
 		}
 		else z++;
 	}
 	return 1;
}

void myTimer(int Value)
{
	start();
}
void timer(void)
{
	if(!newGame && !pause && !gameOver())
		glutTimerFunc ( timerNum - (num*100), myTimer, 1 );
}

void start ()
{
	if(checkBoundariesBottom())
	{
		if(!pause && !newGame)
		{
			dropping_piece_posy--;
			falling_piece->y=dropping_piece_posy;
		}
		//printf(" x pos of dropping piece = %d, y pos of dropping piece = %d\n", dropping_piece_posx, dropping_piece_posy);
		glutPostRedisplay ();
	
		timer();
	}
	else 
	{
		score=score + (level+lines)*13;
		addTetrisBoard();
		//printBoard();
		//printf("\n");
		lineErase();
		gameStart();
	}
	// printf("entered timer\n");
}

void myDisplay(void)
{
	glClear(GL_COLOR_BUFFER_BIT);
	drawLine();
	panel();
	//printf("entered my display\n");
	if(gameOver())
	{	
		displayTetrisBoard();
		glEnable (GL_BLEND);
		glColor4f (1.0, 1.0, 1.0, 0.9);
		glRecti(0, 0, width-240, height);
		glColor3f (0.0, 0.0, 0.0);
		glRasterPos2i(150, 400);
		glutBitmapString(GLUT_BITMAP_TIMES_ROMAN_24, "Game Over");
		glRasterPos2i(151, 400);
		glutBitmapString(GLUT_BITMAP_TIMES_ROMAN_24, "Game Over");
		glRasterPos2i(150, 401);
		glutBitmapString(GLUT_BITMAP_TIMES_ROMAN_24, "Game Over");
		//GLUT_BITMAP_TIMES_ROMAN_24
		//GLUT_BITMAP_HELVETICA_18
		//GLUT_BITMAP_9_BY_15
	}
	else 
	{
		displayTetrisBoard();
		displayPieceShape(falling_piece);
		displayPieceShape(next_piece);
		//printf("should Display\n");
		if(pause)
		{
			glEnable (GL_BLEND);
			glColor4f (1.0, 1.0, 1.0, 0.7);
			glRecti(0, 0, width-240, height);
			glColor3f(0, 0, 0);
			glRasterPos2i(170, 400);
			glutBitmapString(GLUT_BITMAP_TIMES_ROMAN_24, "Pause");
			glRasterPos2i(171, 400);
			glutBitmapString(GLUT_BITMAP_TIMES_ROMAN_24, "Pause");
		}
	}
	glutSwapBuffers ();
}
