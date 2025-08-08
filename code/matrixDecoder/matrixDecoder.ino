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

uint8_t max_pin = 30; //how many pins your FPC cable has

uint8_t key_1 = 0;
uint8_t key_2 = 0;
uint8_t key_3 = 0;
uint8_t key_4 = 0;
uint8_t key_5 = 0;
uint8_t key_6 = 0;
uint8_t key_7 = 0;
uint8_t key_8 = 0;
uint8_t key_9 = 0;
uint8_t key_0 = 0;
uint8_t key_tab = 0;
uint8_t key_down = 0;

//array stores all the keycodes. Index 0 = keycode 0. Index 1 = keycode 1 - etc
uint8_t key_arr[] = {





};

//func to send a keypress
void send_key(uint8_t keycode) {
    tud_hid_keyboard_report(0, 0, &keycode);
}

//function to set a pin as an input w/pullup so it's high unless grounded by a keypress
void a(uint8_t pin)
{
    _gpio_init(pin);
    gpio_set_dir(pin, GPIO_IN); //set pin as input
    gpio_pull_up(pin); //enable pull-up resistor
}

//func to send numbers for display on an editor
void display_numb(uint8_t num)
{
	tusb_init(); //init usb emu
        tud_task(); //tinyUSB task

	send_key(key_arr[num]);
        sleep_ms(100); //vroom vroom
}

//send down arrow to text editor with correct delays n' stuff
void down_arrow(void)
{

}
