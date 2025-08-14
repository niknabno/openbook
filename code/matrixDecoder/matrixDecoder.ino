//copied/inspired by Frank Adam's keyboard matrix decoder. Made to work on the Rasbery Pi Pico
//I believe Mr. Adams has a Python equivlent of this, however I find c++ more convnient.
//Also, there is a high likley hood Mr. Adams might make one of these himself, but I don't believe
//he has at the time of writting

//1: open and focus a text editor
//2: press each key on by one
//3: this will form a matrix for your specfic keyboard

//#include "pico/stdlib.h" //standard lib
#include "tusb.h"; //tinyUSB library for USB HID

uint8_t LED_PIN = 25; //led pin on the pico

//this array contains pins on pico that correspond to FPC pins in order.
uint8_t pico_pins[] = {};

uint8_t MAX_PIN = 30; //how many pins your FPC cable has
uint8_t MIN_PIN = 1;

uint8_t key_1 = 0x1E;
uint8_t key_2 = 0x1F;
uint8_t key_3 = 0x20;
uint8_t key_4 = 0x21;
uint8_t key_5 = 0x22;
uint8_t key_6 = 0x23;
uint8_t key_7 = 0x24;
uint8_t key_8 = 0x25;
uint8_t key_9 = 0x26;
uint8_t key_0 = 0x27;
uint8_t KEY_TAB = 0x2B;
uint8_t KEY_DOWN = 0x51;

//array stores all the keycodes. Index 0 = keycode 0. Index 1 = keycode 1 - etc
uint8_t keyArr[] = {





};

//func to send a keypress
void sendKey(uint8_t keycode) {
    tud_hid_keyboard_report(0, 0, &keycode);
}

//function to set a pin as an input w/pullup so it's high unless grounded by a keypress
void setInput(uint8_t pin)
{
    _gpio_init(pin);
    gpio_set_dir(pin, GPIO_IN); //set pin as input
    gpio_pull_up(pin); //enable pull-up resistor
}

//func to set a pin as output and drive it to a logic low (0v)
void setOutput(uint8_t pin)
{

}

//func to send numbers for display on an editor
void displayNum(uint8_t num)
{
	tusb_init(); //init usb emu
        tud_task(); //tinyUSB task

	sendKey(keyArr[num]);
        sleep_ms(100); //vroom vroom
	sendKey(KEY_TAB); //tab over to the next pos for the next key
	sleep_ms(100);
}

//send down arrow to text editor with correct delays n' stuff
void downArrow(void)
{
	sendKey(KEY_DOWN);
	delay(20);
}

void setup()
{
	for (uint8_t i = 0; i < MAX_PIN; i++)
	{
		setInput(pico_pin[i]); //set each pin as input w/pullip
	}
	delay(15000); //wait for host to connect to pico as a kb.
}


//---start main loop---//
void loop()
{
	//---bottom up test---//
	for(uint8_t i = MIN_PIN-1; i<MAX_PIN-1; i++)
	{
		setOutput(picoPins[i]); //make the outer loop pin an output and set to low
		for(uint8_t j=i+1; j < MAX_PIN; j++)
		{
			delayMicroSeconds(10); //give time for signals to settle out
			if(!digitalRead(picoPins[j])) //check for connection between inner and outter pins
			{
				displayNum(i);
				displayNum(j);
				downArrow();
				while(!digitalRead(picoPins[j])) {}; //if two pins shorted the code hangs here
			}
		}

		setInput(picoPins[i]); //
	}

	//---top down test---//
}
