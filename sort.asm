/*	File name:		test.asm
 *  Program:		Sort 10 numbers in ascending and descending order and store them
 *					separately without changing the original array.
 *	Assignment:		1
 *  Program:		8
 *  Author: Rohan Salvi
 *  Educational purposes only. Non production code & so further optimizable
 */ 

; include header					;
 .include "m64def.inc"				; or m128def.inc(for atmega128)
		
; definitions						;
.def count1	= r17 					;
.def count2	= r18 					;
.def temp	= r20					;
.def num1	= r21					;
.def num2	= r22					;


.cseg								; Code segment starts
.org 0

		LDI ZH, 0x10 				; Load memory addr where
		LDI ZL, 0x00				; data is stored in RAM
		
		LDI XH, 0x10				; Destination location for Ascending
		LDI XL, 0x13				; 0x1013 in RAM
	
		LDI count1,10


COPY:
		LD temp,Z+
		ST X+,temp					; Store it to RAM
		DEC count1					; Decrement counter
		BRNE COPY					; copy all 10 bytes
	
	
		;reset pointer X & count1
		LDI XH, 0x10 				; Load memory address 
		LDI XL, 0x13				; data stored on RAM								
		LDI count1,10				;
	
SORT:
		MOV YL,XL					; Load second pointer
		MOV YH,XH
		ADIW Y,1					; Increment Y pointer
		LD num1,X					; load first number
		MOV count2, count1			; load count2
		SUBI count2, 1				; Count2 = Count1-1
		BREQ DESCEND					;
	
AGAIN:
		LD num2,Y					; Load second number
		CP num1,num2 				; Compare them
		BRLO NEXT 					; Jump if num1<num2
		MOV temp,num2
		MOV num2,num1 				; swap if num1>num2 
		MOV num1,temp
		ST X,num1					; and store them on their
		ST Y,num2 					; respective locations

NEXT:
		ADIW Y,1					; Increment the address
		DEC count2 					; dec count2 for Y pointer
		BRNE AGAIN 					; check if count is zero
		ADIW X,1 					; increment Z pointer
		DEC count1 					; Dec count1 for Z pointer
		BRNE SORT					; finish if zero
	
	
; Descending

DESCEND:
		LDI XH, 0x10 				; Load memory address 
		LDI XL, 0x13				; data stored on RAM
		
		LDI YH, 0x10				; Destination location for Descending
		LDI YL, 0x26				; 0x1026 in RAM
		
		
		LDI count1,11
		ADIW X,10
	
LOOP:
		LD temp, X
		SBIW X,1
		
		ST Y, temp
		ADIW Y,1
		DEC count1
		BRNE LOOP
	
END: RJMP END						 ; Infinite Loop / super loop

; End of program

 
