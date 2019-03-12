/*
 * test.c
 * Created: 16-03-2015 12:07:11
 *  Author: Rohan Salvi
 *	LED and SWITCHES
 */ 


#include "test.h"

void portInit()
{
	SWITCH12_DIR	= 0x00;		
	SWITCH34_DIR	= 0x00;		
	SWITCH12_PORT	= 0xff;		
	SWITCH34_PORT	= 0xff;		
	//
	LEDPORT_DIR		= 0xff;		
	LED_PORT		= 0xff;		
}

void debounceDly()
{
	_delay_ms(10);
}

void timer_Init()
{
	TIFR	= 0xff;
}

void delay(uInt2 Dly)
{
	int i;
	for(i=0; i<Dly; i++)
	{
		delay_ms();
	}
}

void delay_ms()
{
	TCNT1	= 0XFFF0;	// 1m sec
	TCCR1B	= 0X05;
	while(1)
	{
		if((TIFR&0X04)==0x04)
		break;
	}
	TIFR	= 0xff;
}

void delay_sec()
{
	//	TCNT1	= 0XC26F;	// 1 sec
	TCNT1	= 49775;	// 1 sec
	TCCR1B	= 0X05;
	while(1)
	{
		if((TIFR&0X04)==0x04)
		break;
	}
}


int main(void)
{
	//all initialization routines needed for your application
	//typically we call it as system initialization
	portInit();
	timer_Init();
	
	//infinite loop
	//Note that we made a core logic as a part of infinite loop as we wish to monitor switch status continuously
	while(1)
    {
	   	if(SWITCH4==0x00)
	   	{
	    	debounceDly();
	    	if(SWITCH4==0x00)
	    	LED_PORT = LED_78;
			delay(DLY_1SEC);
			LED_PORT = 0xFF;
	   	}
	   	else if(SWITCH3==0x00)
	   	{
	    	debounceDly();
	    	if(SWITCH3 == 0x00)
	    	LED_PORT = LED_56;
			delay(DLY_1SEC);
			LED_PORT = 0xFF;
	   	}
	   	
	   	else if(SWITCH2==0x00)
	   	{
	    	debounceDly();
	    	if(SWITCH2 == 0x00)
	    	LED_PORT = LED_34;
			delay(DLY_1SEC);
			LED_PORT = 0xFF;
	   	}
	   	else if(SWITCH1==0x00)
	   	{
	    	debounceDly();
	    	if(SWITCH1 == 0x00)
	    	LED_PORT = LED_12;
			delay(DLY_1SEC);
			LED_PORT = 0xFF;
	   	}
    }
}

