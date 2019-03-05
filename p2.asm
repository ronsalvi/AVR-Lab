/*	File name:		test.asm
 *  Program:		Calculate the sum for 20 Bytes of data block and store two’s complement of the answer
 *	Assignment:		1	
 *  Program:		4
 *  Author: Rohan Salvi
 *	Parting gift. Wish you best luck for future endeavours 
 */ 

; include	header					;
.include "m128def.inc"				;
		
; definitions						;
.def num1=R18						;
.def num2=R19						;
.def max=R20						;
		
; main								;
		;init						; Not required
		
		;input processing
		ldi num1,$10				;
		ldi num2,$20				;

		;logic
		clc							; clear carry
		cp num1,num2				; Compare num1 with num2
		brcs carry					; Branch if num1 < num2
		mov max,num1				;
		jmp end						;

		;output processing			; you may not see a separate o/p processing as you are placing your result in max register
carry:	mov max,num2				; logic & output processing could be combined
		jmp end						;

end:rjmp end						; infinite loop


//=================
// Write a pseudo C code here to help u recollect your logic or
// write a pseudo C code first & then try to come up with assembly


//=================


