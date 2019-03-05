/*	File name:		test.asm
 *  Program:		Calculate the sum for 20 Bytes of data block and store two’s complement of the answer
 *	Assignment:		1	
 *  Program:		4
 *  Author: Rohan Salvi
 *	Parting gift
 */ 

; include	header					;
 .include "m128def.inc"				;
		
; definitions						;
.def XH=R27							;
.def XL=R26							; 
.def datareg=R18					;
.def sum=r2							;
.def comp=r17 						;
.def cnt=r16						;
		
; main								;
			ldi XH,$01				;
			ldi XL,$00				;
			ldi cnt,19				;
			ldi comp,$00			;
			
			ld sum,X+               ;
addition:	ld r1,X+            	;
			adc sum,r1              ;
			brvs compadd            ;
					
up:			dec cnt                 ;
			brne addition           ;
			st X,sum                ;
			st Y,comp               ;
			jmp end					;
compadd: 	inc comp		    	;
			jmp up			        ;
		
; infinite loop						;
end:rjmp end						;

