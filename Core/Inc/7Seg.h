
#define TOP_LEFT	0b00000001
#define CENTER 		0b00000010
#define TOP 		0b00000100
#define TOP_RIGHT	0b00001000
#define DEC_POINT	0b00010000
#define BOT_RIGHT	0b00100000
#define BOTTOM		0b01000000
#define BOT_LEFT	0b10000000

#define NONE		0b00000000
#define ALL_EIGHT	TOP | TOP_LEFT | TOP_RIGHT | CENTER | BOT_LEFT | BOT_RIGHT | BOTTOM | DEC_POINT
#define ALL_SEVEN	TOP | TOP_LEFT | TOP_RIGHT | CENTER | BOT_LEFT | BOT_RIGHT | BOTTOM

#define P_SHAPE		TOP | TOP_LEFT | TOP_RIGHT | CENTER | BOT_LEFT
#define Q_SHAPE		TOP | TOP_LEFT | TOP_RIGHT | CENTER | BOT_RIGHT
#define D_SHAPE		TOP_RIGHT | CENTER | BOT_LEFT | BOT_RIGHT | BOTTOM
#define B_SHAPE		TOP_LEFT | CENTER | BOT_LEFT | BOT_RIGHT | BOTTOM

#define TOP_O		TOP | TOP_LEFT | TOP_RIGHT | CENTER
#define BOTTOM_O	CENTER | BOT_LEFT | BOT_RIGHT | BOTTOM

#define T_R_CORNER	TOP | TOP_RIGHT
#define T_L_CORNER	TOP | TOP_LEFT
#define B_R_CORNER	BOTTOM | BOT_RIGHT
#define B_L_CORNER	BOTTOM | BOT_LEFT




void updateDisplayCell(int data, int row, int col);
void updateDisplayWithTime(int hr, int min);
void setDisplayCell(int row, int col);
void setDisplay();
void setDisplayForce();