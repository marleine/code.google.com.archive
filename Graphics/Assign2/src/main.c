#include <GL/glut.h>

#include "global.h"
#include "init.h"
#include "keyboard.h"
#include "gui.h"

int main(int argc, char** argv)
{
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE);
	glutInitWindowSize(width,height);
	glutInitWindowPosition(100, 150);
	glutCreateWindow("Marly Tetris");
	glutDisplayFunc(myDisplay);
	glutSpecialFunc(mySpecial);
	glutKeyboardFunc(myKeyboard);
		myInit();

	glutMainLoop();
	return 0;
}
