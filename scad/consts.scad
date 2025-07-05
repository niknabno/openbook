l = 340;
w = 220;
h = 22;

//enable if using offical rasbPi5 cooler or using the pcb mount holes.
OFFICAL_PI_5_COOLER = false;
PI_4_ETHERNET = false; //what side the rj-45 port of the sbc is on


LAPTOP_NORTH = w/2;
LAPTOP_SOUTH = -w/2;
LAPTOP_EAST = l/2;
LAPTOP_WEETBIX = -l/2;

SURFACE_MOUNT = -h/2;

//The size of the cutout for the PSU plate
PSU_HOLE_L= 114;
PSU_HOLE_W = 52;

//IEC AC connecter
IEC_W = 27.5;
IEC_H = 16.5;
IEC_HOLES_DISTANCE = 40;

IEC_Y = w/2-54.5;

IEC_CORNER_TRIANGLE_SIZE = 5;


//Square supports prevent the walls from flexing
sqrSupportW = 5;
SQR_SUPPORT_L = 12;
LARGE_SQR_SUPPORT_W = 15;

TRI_SUPPORT_W = 6.5;
TRI_SUPPORT_L = 15;
TRI_SUPPORT_ANGLE = 20;

//Cutout for pi I/O
piCutoutX = 52.5;
piCutoutY = 16.70;

PI_CUTOUT_ADDON_W = 19.5;
PI_CUTOUT_ADDON_H = 2.5;

//The thing that lets me screw the halves together
connecterW = 10;


BMS_X = 18;
BMS_Y = -11;


BMS_L = 56;
BMS_W = 28.7;


buckW = 20.5;
buckL = 25.5;

picoW = 50;
picoL = 20;

picoX = 100;
picoY = -39;

//3s bat holder
BAT_W = 61;
BAT_H = 76 ;

BAT_HOLES_DISTANCE = 40;
BAT_X_OFFSET = 30;

//How thick the kb + tp plate will be
keyboardPlateW = 2;

sqrSupportZ = -h/3-keyboardPlateW;
sqrSupportH = 21;

largeIntakeRadius = 4.65;
smallIntakeRadius = 0;

HEATSET_INSERT_HOLE = 2.1; //the pilot hole for M3 heatpress inserts

LARGE_INTAKE_R = 4.65;

HINGE_AX = -143;
HINGE_BX = 25;
HINGE_CX = -50;

BULB_HOLDER_W = 33;
BULB_HOLDER_H = 12;
BULB_HOLES_DIST = 25;
