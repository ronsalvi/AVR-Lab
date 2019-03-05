/*	File name:		test.asm
 *  Program:		Add a block of 10 Data Bytes and store the result in the memory
 *	Assignment:		1	
 *  Program:		3
 *  Author: Rohan Salvi
 *	Parting gift. Wish you best luck for future endeavours 
 */ 

 
//Try to add comments as per your understanding
//In real life no one will spoon feed :D

 
; include	header						;
.include "m128def.inc"					;
			
; definitions							;
.def XH=R27								;
.def XL=R26								; 
.def datareg=R18						;
.def sum=r2								;
.def carry=r17 							;
.def cnt=r16							;

;main									;
			ldi XH,$01					;
			ldi XL,$00					;
			ldi cnt,$09					;
			ldi carry,$00				;
	
			ld sum,X+                   ;
label:		ld r1,X+              		;
			adc sum,r1                  ;
			brcs carryadd               ;
	
up:			dec cnt                  	;
			brne label                  ;
			st X,sum                    ;
			st Y,carry                  ;

carryadd:   inc carry       			;
			jmp up			            ;

end:rjmp end				; infinite loop