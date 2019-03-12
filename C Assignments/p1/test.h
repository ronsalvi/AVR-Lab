/*
 * test.h
 * Created: 16-03-2015 12:07:11
 * Author: Rohan Salvi 
 * LED and SWITCHES
 */


#include <avr/io.h>

typedef unsigned int uInt2;
typedef unsigned short int uInt1;

#define F_CPU 16000000

//system includes
#include <util/delay.h>


//user defined macros

//	Switches
#define SWITCH12_DIR	DDRD
#define SWITCH34_DIR	DDRE
#define SWITCH12_PORT	PORTD
#define SWITCH34_PORT	PORTE

#define SWITCH1			(PIND&0x40)
#define SWITCH2			(PIND&0x80)
#define SWITCH3			(PINE&0x40)
#define SWITCH4			(PINE&0x80)
//	Leds
#define LEDPORT_DIR		DDRC
#define LED_PORT		PORTC

#define LED_12			0xFC
#define LED_34			0xF3
#define LED_56			0xCF
#define LED_78			0x3F

//user defined global variables
enum dly
{
	DLY_1MS		=1,
	DLY_2MS		=2,
	DLY_3MS		=3,
	DLY_4MS		=4,
	DLY_5MS		=5,
	DLY_6MS		=6,
	DLY_7MS		=7,
	DLY_8MS		=8,
	DLY_9MS		=9,
	DLY_10MS	=10,
	DLY_1SEC	=1000,
	DLY_2SEC	=2000,
	DLY_5SEC	=5000,
};


//user defined function declarations
void portInit();
void debounceDly();
void delay();
void timer_Init();

void delay_ms();
void delay_sec();
void delay(uInt2 Dly);
