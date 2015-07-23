int x=0;
char rr;
int i;
sbit LCD_RS at RB7_bit;
sbit LCD_EN at RB6_bit;
sbit LCD_D4 at RB5_bit;
sbit LCD_D5 at RB4_bit;
sbit LCD_D6 at RB3_bit;
sbit LCD_D7 at RB2_bit;

sbit LCD_RS_Direction at TRISB7_bit;
sbit LCD_EN_Direction at TRISB6_bit;
sbit LCD_D4_Direction at TRISB5_bit;
sbit LCD_D5_Direction at TRISB4_bit;
sbit LCD_D6_Direction at TRISB3_bit;
sbit LCD_D7_Direction at TRISB2_bit;

interrupt()
{
rr = UART1_Read();
switch(rr)
{
case 'w':
   {
    portc.f0=~portc.f0;
    portc.f1=0;
    portc.f2=~portc.f2;
    portd.f0=0;
    break;
    }
 //****************************************************
  case 's':
   {
    portc.f0=0;
    portc.f1=~portc.f1;
    portc.f2=0;
    portd.f0=~portd.f0;
    break;
   }
 //****************************************************
   case 'a':
   {
    portc.f0=0;
    portc.f1=~portc.f1;
    portc.f2=~portc.f2;
    portd.f0=0;
    break;
   }
 //****************************************************
      case 'd':
   {
    portc.f0=~portc.f0;
    portc.f1=0;
    portc.f2=0;
    portd.f0=~portd.f0;
    break;
   }
 //*****************************************************
      case 'i':
   {
     portd.f3=~portd.f3;
    portd.f4=0;
    break;
   }
 //****************************************************
      case 'k':
   {
     portd.f3=0;
    portd.f4=~portd.f4;
    break;
   }
 //*****************************************************
    case 'l':
   {
    portd.f1=~portd.f1;
    portd.f2=0;
    break;
   }
//****************************************************
      case 'j':
   {
    portd.f1=0;
    portd.f2=~portd.f2;
    break;
   }
//****************************************************
   case 'm':
   {
    portd.f5=~portd.f5;
    portd.f6=0;
    
    break;
   }
 //***************************************************
    case 'n':
   {
    portd.f5=0;
    portd.f6=~portd.f6;
    break;
   }
//*****************************************************
   case 'r':
   {
    portd.f7=~portd.f7;
    break;
   }
   }
x=1;
  }



void main() {
lcd_init();
INTCON=0b11000000;
PIE1=0b00100000;
UART1_Init(9600);               // Initialize UART module at 9600 bps
Delay_ms(300);
adc_init();
//lcd_out(1,1,"hello");
trisd=0;
trisc=0b10000000;
portd=0;
portc=0;
//uart1_write_text("ready");
for(;;)
{
x=adc_read(1);
if(x>100)
 {
  lcd_out(1,1,"metal detected");
  delay_ms(1000);
  uart1_write_text("Metal");
  lcd_cmd(_LCD_CLEAR);
 }
 if(x==1)
 {
 lcd_chr_cp(rr);
 x=0;
 }


}
}