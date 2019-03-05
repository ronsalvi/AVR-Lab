/*	File name:		test.asm
 *  Program:		Multiply two 8-bit data without using MUL instruction 
 *	Assignment:		1	
 *  Program:		5
 *  Author:			Rohan Salvi
 *	Parting gift. Wish you best luck for future endeavours 
 */ 

; include	header			;
.include "m128def.inc"		;

; definitions				; Always use definitions to improve program readability
.def XH=R27					; Using this definitions for X pointer so that we program correctly
.def XL=R26					; & avoid human error 
.def num1=r18				;
.def num2=r19				;
.def result=r20 			;



; main						;
		;initialization
		CLR result			; one must clear the registers to avoid garbage ; never assume anything ;
		CLC					; clear carry if your logic is carry sensitive
		
		;input processing
		LDI num1,5			;
		LDI num2,10			;

		;logic & output processing
SUM: 	ADC result,num2		;
		DEC num1			;
		BRNE SUM			;



end:rjmp end				;

//=================
// Write a pseudo C code here to help u recollect your logic or
// write a pseudo C code first & then try to come up with assembly
// Demo
/* include files like #include <avr/io.h>

	int main()
	{
		int num1 = 10;
		int num2 = 20;
		int result;
		
		result = 0;
		for(i=0; i<num2; i++)
		{
			num1+=num1;
		}		
		result=num1;
	}
*/
//=================
