
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;1.c,18 :: 		interrupt()
;1.c,20 :: 		rr = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _rr+0
;1.c,21 :: 		switch(rr)
	GOTO       L_interrupt0
;1.c,23 :: 		case 'w':
L_interrupt2:
;1.c,25 :: 		portc.f0=~portc.f0;
	MOVLW      1
	XORWF      PORTC+0, 1
;1.c,26 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;1.c,27 :: 		portc.f2=~portc.f2;
	MOVLW      4
	XORWF      PORTC+0, 1
;1.c,28 :: 		portd.f0=0;
	BCF        PORTD+0, 0
;1.c,29 :: 		break;
	GOTO       L_interrupt1
;1.c,32 :: 		case 's':
L_interrupt3:
;1.c,34 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;1.c,35 :: 		portc.f1=~portc.f1;
	MOVLW      2
	XORWF      PORTC+0, 1
;1.c,36 :: 		portc.f2=0;
	BCF        PORTC+0, 2
;1.c,37 :: 		portd.f0=~portd.f0;
	MOVLW      1
	XORWF      PORTD+0, 1
;1.c,38 :: 		break;
	GOTO       L_interrupt1
;1.c,41 :: 		case 'a':
L_interrupt4:
;1.c,43 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;1.c,44 :: 		portc.f1=~portc.f1;
	MOVLW      2
	XORWF      PORTC+0, 1
;1.c,45 :: 		portc.f2=~portc.f2;
	MOVLW      4
	XORWF      PORTC+0, 1
;1.c,46 :: 		portd.f0=0;
	BCF        PORTD+0, 0
;1.c,47 :: 		break;
	GOTO       L_interrupt1
;1.c,50 :: 		case 'd':
L_interrupt5:
;1.c,52 :: 		portc.f0=~portc.f0;
	MOVLW      1
	XORWF      PORTC+0, 1
;1.c,53 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;1.c,54 :: 		portc.f2=0;
	BCF        PORTC+0, 2
;1.c,55 :: 		portd.f0=~portd.f0;
	MOVLW      1
	XORWF      PORTD+0, 1
;1.c,56 :: 		break;
	GOTO       L_interrupt1
;1.c,59 :: 		case 'i':
L_interrupt6:
;1.c,61 :: 		portd.f3=~portd.f3;
	MOVLW      8
	XORWF      PORTD+0, 1
;1.c,62 :: 		portd.f4=0;
	BCF        PORTD+0, 4
;1.c,63 :: 		break;
	GOTO       L_interrupt1
;1.c,66 :: 		case 'k':
L_interrupt7:
;1.c,68 :: 		portd.f3=0;
	BCF        PORTD+0, 3
;1.c,69 :: 		portd.f4=~portd.f4;
	MOVLW      16
	XORWF      PORTD+0, 1
;1.c,70 :: 		break;
	GOTO       L_interrupt1
;1.c,73 :: 		case 'l':
L_interrupt8:
;1.c,75 :: 		portd.f1=~portd.f1;
	MOVLW      2
	XORWF      PORTD+0, 1
;1.c,76 :: 		portd.f2=0;
	BCF        PORTD+0, 2
;1.c,77 :: 		break;
	GOTO       L_interrupt1
;1.c,80 :: 		case 'j':
L_interrupt9:
;1.c,82 :: 		portd.f1=0;
	BCF        PORTD+0, 1
;1.c,83 :: 		portd.f2=~portd.f2;
	MOVLW      4
	XORWF      PORTD+0, 1
;1.c,84 :: 		break;
	GOTO       L_interrupt1
;1.c,87 :: 		case 'm':
L_interrupt10:
;1.c,89 :: 		portd.f5=~portd.f5;
	MOVLW      32
	XORWF      PORTD+0, 1
;1.c,90 :: 		portd.f6=0;
	BCF        PORTD+0, 6
;1.c,92 :: 		break;
	GOTO       L_interrupt1
;1.c,95 :: 		case 'n':
L_interrupt11:
;1.c,97 :: 		portd.f5=0;
	BCF        PORTD+0, 5
;1.c,98 :: 		portd.f6=~portd.f6;
	MOVLW      64
	XORWF      PORTD+0, 1
;1.c,99 :: 		break;
	GOTO       L_interrupt1
;1.c,102 :: 		case 'r':
L_interrupt12:
;1.c,104 :: 		portd.f7=~portd.f7;
	MOVLW      128
	XORWF      PORTD+0, 1
;1.c,105 :: 		break;
	GOTO       L_interrupt1
;1.c,107 :: 		}
L_interrupt0:
	MOVF       _rr+0, 0
	XORLW      119
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt2
	MOVF       _rr+0, 0
	XORLW      115
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt3
	MOVF       _rr+0, 0
	XORLW      97
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt4
	MOVF       _rr+0, 0
	XORLW      100
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt5
	MOVF       _rr+0, 0
	XORLW      105
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt6
	MOVF       _rr+0, 0
	XORLW      107
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt7
	MOVF       _rr+0, 0
	XORLW      108
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt8
	MOVF       _rr+0, 0
	XORLW      106
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt9
	MOVF       _rr+0, 0
	XORLW      109
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt10
	MOVF       _rr+0, 0
	XORLW      110
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt11
	MOVF       _rr+0, 0
	XORLW      114
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt12
L_interrupt1:
;1.c,108 :: 		x=1;
	MOVLW      1
	MOVWF      _x+0
	MOVLW      0
	MOVWF      _x+1
;1.c,109 :: 		}
L_end_interrupt:
L__interrupt21:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;1.c,113 :: 		void main() {
;1.c,114 :: 		lcd_init();
	CALL       _Lcd_Init+0
;1.c,115 :: 		INTCON=0b11000000;
	MOVLW      192
	MOVWF      INTCON+0
;1.c,116 :: 		PIE1=0b00100000;
	MOVLW      32
	MOVWF      PIE1+0
;1.c,117 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;1.c,118 :: 		Delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
;1.c,119 :: 		adc_init();
	CALL       _ADC_Init+0
;1.c,121 :: 		trisd=0;
	CLRF       TRISD+0
;1.c,122 :: 		trisc=0b10000000;
	MOVLW      128
	MOVWF      TRISC+0
;1.c,123 :: 		portd=0;
	CLRF       PORTD+0
;1.c,124 :: 		portc=0;
	CLRF       PORTC+0
;1.c,126 :: 		for(;;)
L_main14:
;1.c,128 :: 		x=adc_read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _x+0
	MOVF       R0+1, 0
	MOVWF      _x+1
;1.c,129 :: 		if(x>100)
	MOVLW      128
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVF       R0+0, 0
	SUBLW      100
L__main23:
	BTFSC      STATUS+0, 0
	GOTO       L_main17
;1.c,131 :: 		lcd_out(1,1,"metal detected");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;1.c,132 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
	NOP
;1.c,133 :: 		uart1_write_text("Metal");
	MOVLW      ?lstr2_1+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;1.c,134 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;1.c,135 :: 		}
L_main17:
;1.c,136 :: 		if(x==1)
	MOVLW      0
	XORWF      _x+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      1
	XORWF      _x+0, 0
L__main24:
	BTFSS      STATUS+0, 2
	GOTO       L_main19
;1.c,138 :: 		lcd_chr_cp(rr);
	MOVF       _rr+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;1.c,139 :: 		x=0;
	CLRF       _x+0
	CLRF       _x+1
;1.c,140 :: 		}
L_main19:
;1.c,143 :: 		}
	GOTO       L_main14
;1.c,144 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
