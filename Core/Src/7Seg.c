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
	{BOTTOM_O, TOP_O   , TOP_O	 , BOTTOM_O},
	{NONE	 , NONE	   , D_SHAPE , P_SHAPE },
	{NONE	 , D_SHAPE , P_SHAPE , NONE	   },
	{Q_SHAPE , BOTTOM_O, BOTTOM_O, P_SHAPE }
};

const int threeDraw[4][4] =
{
	{D_SHAPE, TOP_O		, TOP_O	  , B_SHAPE},
	{NONE	, B_R_CORNER, BOTTOM_O, P_SHAPE},
	{NONE	, T_R_CORNER, TOP_O	  , B_SHAPE},
	{Q_SHAPE, BOTTOM_O	, BOTTOM_O, P_SHAPE}
};

const int fourDraw[4][4] =
{
	{NONE	, NONE	  , D_SHAPE	, ALL_SEVEN},
	{NONE	, D_SHAPE , NONE	, ALL_SEVEN},
	{D_SHAPE, BOTTOM_O, BOTTOM_O, ALL_SEVEN},
	{NONE	, NONE	  , NONE	, ALL_SEVEN}
};

const int fiveDraw[4][4] =
{
	{ALL_SEVEN,	TOP_O	, TOP_O	  , TOP_O	  },
	{ALL_SEVEN,	BOTTOM_O, BOTTOM_O, B_L_CORNER},
	{BOTTOM_O ,	NONE	, NONE	  , TOP_O	  },
	{Q_SHAPE  ,	BOTTOM_O, BOTTOM_O, P_SHAPE   }
};

const int sixDraw[4][4] =
{
	{D_SHAPE  ,	P_SHAPE	, Q_SHAPE , B_SHAPE	  },
	{ALL_SEVEN,	BOTTOM_O, BOTTOM_O, B_L_CORNER},
	{ALL_SEVEN,	NONE	, NONE	  , ALL_SEVEN },
	{Q_SHAPE  ,	BOTTOM_O, BOTTOM_O, P_SHAPE	  }
};

const int sevenDraw[4][4] =
{
	{TOP_O, TOP_O	 , TOP_O  , ALL_SEVEN},
	{NONE ,	NONE	 , D_SHAPE, NONE	 },
	{NONE ,	ALL_SEVEN, NONE   , NONE	 },
	{NONE ,	ALL_SEVEN, NONE   , NONE	 }
};

const int eightDraw[4][4] =
{
	{D_SHAPE , TOP_O   , TOP_O   , B_SHAPE },
	{TOP_O 	 , BOTTOM_O, BOTTOM_O, TOP_O   },
	{BOTTOM_O, TOP_O   , TOP_O   , BOTTOM_O},
	{Q_SHAPE , BOTTOM_O, BOTTOM_O, P_SHAPE }
};

const int nineDraw[4][4] =
{
	{D_SHAPE   , TOP_O  , TOP_O  , B_SHAPE  },
	{ALL_SEVEN , NONE	, NONE   , ALL_SEVEN},
	{T_R_CORNER, TOP_O  , TOP_O  , ALL_SEVEN},
	{Q_SHAPE   , B_SHAPE, D_SHAPE, P_SHAPE  }
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
    {0x30, 0x28, 0x08, 0x10, 0x31, 0x29, 0x09, 0x11, 0x34, 0x32, 0x2a, 0x0a, 0x12, 0x33, 0x2b, 0x0b, 0x13},
    {0x38, 0x20, 0x18, 0x00, 0x39, 0x21, 0x19, 0x01, 0x3b, 0x3a, 0x22, 0x1a, 0x02, 0x3b, 0x23, 0x1b, 0x03},
    {0x58, 0x50, 0x68, 0x60, 0x59, 0x51, 0x69, 0x61, 0x5b, 0x5a, 0x52, 0x6a, 0x62, 0x5b, 0x53, 0x6b, 0x63},
    {0x40, 0x48, 0x70, 0x78, 0x41, 0x49, 0x71, 0x79, 0x44, 0x42, 0x4a, 0x72, 0x7a, 0x43, 0x4b, 0x73, 0x7b}
};

int lastDisplayState[4][17] = {};

int displayState[4][17] = {};

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
    int pOut = (displayState[row][col] << 8) | ((displayAddresses[row][col] & 0b1110000) << 1) | (displayAddresses[row][col] &  0b0001111);
    uint16_t pA = pOut & (0b1110011111101111);
	uint16_t pB = pOut & ~(0b1110011111101111);
	GPIOA->ODR = pA;
	GPIOB->ODR = pB;

    HAL_Delay(5);

    pOut |= (1<<2);
    pA = pOut & (0b1110011111101111);
	pB = pOut & ~(0b1110011111101111);
	GPIOA->ODR = pA;
	GPIOB->ODR = pB;

    HAL_Delay(5);
}

void setDisplay()
{
    for (int i = 0; i < 17; i++)
    {
        for (int j = 0; j < 4; j++)
        {
            //if (displayState[j][i] != lastDisplayState[j][i])
            //{
                setDisplayCell(j, i);
                lastDisplayState[j][i] = displayState[j][i];
            //}
        }
    }
    return;
}