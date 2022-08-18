#include "7Seg.h"
#include "stm32g4xx_hal.h"
#include <stm32g441xx.h>

const int oneDraw[4][4] =
{
	{NONE, D_SHAPE , ALL_SEVEN, NONE	},
	{NONE, NONE	   , ALL_SEVEN, NONE	},
	{NONE, NONE	   , ALL_SEVEN, NONE	},
	{NONE, BOTTOM_O, ALL_SEVEN, BOTTOM_O}
};

const int twoDraw[4][4] =
{
    {NONE, D_SHAPE, TOP_O, B_SHAPE},
    {NONE, NONE, NONE, ALL_SEVEN},
    {NONE, D_SHAPE, P_SHAPE, T_L_CORNER},
    {NONE, ALL_SEVEN, BOTTOM_O, BOTTOM_O}
	// {BOTTOM_O, TOP_O   , TOP_O	 , BOTTOM_O},
	// {NONE	 , NONE	   , D_SHAPE , P_SHAPE },
	// {NONE	 , D_SHAPE , P_SHAPE , NONE	   },
	// {Q_SHAPE , BOTTOM_O, BOTTOM_O, P_SHAPE }
};

const int threeDraw[4][4] =
{
	{NONE, TOP_O		, TOP_O	  , B_SHAPE},
	{NONE	, B_R_CORNER, BOTTOM_O, P_SHAPE},
	{NONE	, T_R_CORNER, TOP_O	  , B_SHAPE},
	{NONE, BOTTOM_O	, BOTTOM_O, P_SHAPE}
};

const int fourDraw[4][4] =
{
	{NONE	, ALL_SEVEN	  , NONE	, ALL_SEVEN},
	{NONE	, ALL_SEVEN , NONE	, ALL_SEVEN},
	{NONE, TOP_O, TOP_O, ALL_SEVEN},
	{NONE	, NONE	  , NONE	, ALL_SEVEN}
};

const int fiveDraw[4][4] =
{
	{NONE,	ALL_SEVEN	, TOP_O	  , TOP_O	  },
	{NONE,	ALL_SEVEN, BOTTOM_O, B_L_CORNER},
	{NONE ,	BOTTOM_O	, NONE	  , ALL_SEVEN },
	{NONE  ,	Q_SHAPE, BOTTOM_O, P_SHAPE   }
};

const int sixDraw[4][4] =
{
	{NONE  ,	D_SHAPE	, Q_SHAPE , B_SHAPE	  },
	{NONE,	ALL_SEVEN, BOTTOM_O, B_L_CORNER},
	{NONE,	ALL_SEVEN	, NONE	  , ALL_SEVEN },
	{NONE  ,	Q_SHAPE, BOTTOM_O, P_SHAPE	  }
};

const int sevenDraw[4][4] =
{
	{NONE, TOP_O	 , TOP_O  , ALL_SEVEN},
	{NONE ,	NONE	 , D_SHAPE, NONE	 },
	{NONE ,	ALL_SEVEN, NONE   , NONE	 },
	{NONE ,	ALL_SEVEN, NONE   , NONE	 }
};

const int eightDraw[4][4] =
{
	{NONE , D_SHAPE   , TOP_O   , B_SHAPE },
	{NONE 	 , Q_SHAPE, BOTTOM_O, P_SHAPE   },
	{NONE, D_SHAPE   , TOP_O   , B_SHAPE},
	{NONE , Q_SHAPE, BOTTOM_O, P_SHAPE }
};

const int nineDraw[4][4] =
{
	{NONE   , D_SHAPE  , TOP_O  , B_SHAPE  },
	{NONE , ALL_SEVEN	, NONE   , ALL_SEVEN},
	{NONE, T_R_CORNER  , TOP_O  , ALL_SEVEN},
	{NONE   , BOTTOM_O, D_SHAPE, P_SHAPE  }
};

const int zeroDraw[4][4] =
{
	{D_SHAPE   , TOP_O  , TOP_O  , B_SHAPE  },
	{ALL_SEVEN , NONE	, NONE   , ALL_SEVEN},
	{ALL_SEVEN , NONE   , NONE   , ALL_SEVEN},
	{Q_SHAPE   , B_SHAPE, D_SHAPE, P_SHAPE  }
};

const int (* numDraws[10])[4][4] = {&zeroDraw, &oneDraw, &twoDraw, &threeDraw, &fourDraw, &fiveDraw, &sixDraw, &sevenDraw, &eightDraw, &nineDraw};

const int displayAddresses[4][17] = {
    // 0     1    2      3      4    5     6     7     8     9    10     11    12    13   14     15    16
    {0x30, 0x28, 0x08, 0x10, 0x31, 0x29, 0x09, 0x11, 0x34, 0x32, 0x2a, 0x0a, 0x12, 0x33, 0x2b, 0x0b, 0x13}, // 0
    {0x38, 0x20, 0x18, 0x00, 0x39, 0x21, 0x19, 0x01, 0x3c, 0x3a, 0x22, 0x1a, 0x02, 0x3b, 0x23, 0x1b, 0x03}, // 1
    {0x58, 0x50, 0x68, 0x60, 0x59, 0x51, 0x69, 0x61, 0x5c, 0x5a, 0x52, 0x6a, 0x62, 0x5b, 0x53, 0x6b, 0x63}, // 2
    {0x40, 0x48, 0x70, 0x78, 0x41, 0x49, 0x71, 0x79, 0x44, 0x42, 0x4a, 0x72, 0x7a, 0x43, 0x4b, 0x73, 0x7b}  // 3
};

const int secretOrder[2][68] = 
{
    {3, 7,12,16, 2, 6,11,15, 3, 7,12,16, 2, 6,11,15, 1, 5,10,14, 1, 5,10,14, 0, 4, 9,13, 8, 0, 4, 9,13, 8, 0, 4, 9,13, 8, 1, 5,10,14, 1, 5,10,14, 0, 4, 9,13, 8, 3, 7,12,16, 2, 6,11,15, 2, 6,11,15, 3, 7,12,16},
    {1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3}
};

int lastDisplayState[4][17] = { 
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
    {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
 };

int displayState[4][17] = { 0 };

void updateDisplayCell(int data, int row, int col)
{
    displayState[row][col] = data;
}

void updateDisplayWithTime(int hr, int min)
{
    for (int i = 0; i < 4; i++)
    {
        for (int j = 0; j < 4; j++)
        {
            int data = (*numDraws[hr / 10])[j][i];
            updateDisplayCell(data, j, i);
        }
    }
    for (int i = 4; i < 8; i++)
    {
        for (int j = 0; j < 4; j++)
        {
            int data = (*numDraws[hr % 10])[j][i - 4];
            updateDisplayCell(data, j, i);
        }
    }
    
    updateDisplayCell(0x00, 0, 8);
    updateDisplayCell(DEC_POINT, 1, 8);
    updateDisplayCell(DEC_POINT, 2, 8);
    updateDisplayCell(0x00, 3, 8);

    for (int i = 9; i < 13; i++)
    {
        for (int j = 0; j < 4; j++)
        {
            int data = (*numDraws[min / 10])[j][i - 9];
            updateDisplayCell(data, j, i);
        }
    }
    for (int i = 13; i < 17; i++)
    {
        for (int j = 0; j < 4; j++)
        {
            int data = (*numDraws[min % 10])[j][i - 13];
            updateDisplayCell(data, j, i);
        }
    }
}

/* This is what will change with different computing units*/
void setDisplayCell(int row, int col)
{
    int pOut = (displayState[row][col] << 0) | ((displayAddresses[row][col] << 9));
    //uint16_t pA = pOut & (0b0000000000000000);
	uint16_t pB = pOut & (0b1111111011111111);
	//GPIOA->ODR = pA;
    GPIOB->ODR = pB;

    HAL_Delay(4);

    pOut |= (0b0000111000000000);
    //pA = pOut & (0b1110011111101111);
	pB = pOut & (0b1111111011111111);
	//GPIOA->ODR = pA;
	GPIOB->ODR = pB;

    HAL_Delay(4);
}

void setDisplayForce()
{
    for (int i = 0; i < 68; i++)
    {
        //for (int j = 0; j < 4; j++)
        //{
            int r = secretOrder[1][i];
            int c = secretOrder[0][i];
            setDisplayCell(r, c);
            lastDisplayState[r][c] = displayState[r][c];

        //}
    }
    return;
}

void setDisplay()
{
    for (int i = 0; i < 68; i++)
    {
        //for (int j = 0; j < 4; j++)
        //{
            int r = secretOrder[1][i];
            int c = secretOrder[0][i];
            if (displayState[r][c] != lastDisplayState[r][c])
            {
                setDisplayCell(r, c);
                lastDisplayState[r][c] = displayState[r][c];
            }
        //}
    }

    // WORKAROUND THAT IS STUPID AND IM SORRY BUT IM TIRED AND IT WORKS CONSISTENTLY
    setDisplayCell(2, 15);
    // END WORKAROUND
    return;
}