/*	File name:		test.asm
 *  Program:		Write instructions to load two numbers in registers. Add the numbers
 *	Assignment:		1	
 *  Program:		1
 *  Author: 		Rohan Salvi
 *	Parting gift. Wish you best luck for future endeavours 
 */ 

; include	header				;
.include "m128def.inc"			;
	
; definitions					; Always use definitions to improve program readability
.def XH=R27						; Using this definitions for X pointer so that we program correctly 
.def XL=R26						; & avoid human error
.def num1=R18					; 
.def num2=R19					;

; main
main:
		;initialization
		ldi XH,$01				; Initializing X pointer
		ldi XL,$00				;
		
		;input processing
		ldi num1,$10			; Data fetched immediately
		ldi num2,$20			; Data fetched immediately	

		;logic
		adc num1,num2			; Result goes to num1
		
		;output processing
		st X,num1				; Store the result using X pointer


end:rjmp end					; infinite loop



//=================
// Write a pseudo C code here to help u recollect your logic or
// write a pseudo C code first & then try to come up with assembly
//Demo
/* include files like #include <avr/io.h>

	int main()
	{
		int *x;
		int num1 = 10;
		int num2 = 20;
		
		num1 += num2;
		
		*x = num1;
	}
*/
//=================
