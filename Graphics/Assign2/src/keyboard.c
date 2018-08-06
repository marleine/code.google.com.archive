#include <GL/glut.h>
#include <stdio.h>

#include "keyboard.h"

#include "global.h"
#include "gui.h"

int press=-1;

void mySpecial(int key, int x, int y)
{
	if(key== GLUT_KEY_LEFT)
	{
		if(!pause && checkBoundariesLeft())
		{
			dropping_piece_posx--;
			falling_piece->x=dropping_piece_posx;
		}
	}
	
	if(key== GLUT_KEY_RIGHT)
	{
		if(!pause && checkBoundariesRight())
		{
			dropping_piece_posx++;
			falling_piece->x=dropping_piece_posx;
		}
	}
	
	if(key== GLUT_KEY_DOWN)
	{
		if(!pause && (timerNum - ((num+1)*100))>0)
			num++;
		else 
		{
			if(!pause && checkBoundariesBottom())
			{
				dropping_piece_posy--;
				falling_piece->y=dropping_piece_posy;
			}
		}
		//printf ( "incresed speed   %d\n", num );
	}
	
	if(key== GLUT_KEY_UP)
	{
		if(!pause)
		{
			rotatePiece();
		}
		//printf ( "rotated \n");
	}

	glutPostRedisplay();
}

void myKeyboard(unsigned char key, int x, int y)
{	
	if(key == 'p')
	{
		if(press==-1)
		{
			press=0;
			pause=1;
		}
		else 
		{
			//printf("pause = 0\n");
			press=-1;
			pause=0;
			start();
		}
	}
	
	if(key == 'q')
	{
		glutLeaveMainLoop();
	}
	
	if(key== 'g')
	{
		if(gameOver())
		{
			newGame=1;
			myInit();
		}
	}
}     
