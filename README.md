# openBook
openBook is a 3d printed laptop based on a eftpos-card sized SBC and 18650s.  
Soon I plan to reinforce the lid with sheet aluminium. Perhaps laser-cut or somethin'  

I use this as my school, work, and hobby laptop however it is far from ideal for most people.  
It's thick, heavy and janky. I don't consider this a cyber_deck but it's no anyon_e either.  

It was made by me, niknabno. I made the models in openScad, as I found FreeCAD confusing. However I'm not a good programmer and the technical debt was insane.  
I made everything a literal and never got around to fixing it. PAIN. Utterly my fault, but nonetheless I'm looking at FOSS GUI CAD software now.  

Very little electronics knowledge was needed to design this, as it’s not component level. However I did still learn a lot.


# Unique features:
  * In built power supply, use an IEC C13/14 cord to charge.
  * 18650 cells only charge to ~80% (not a bug a feature, trust)
  * Turn the laptop on with a key, you'll lose it in an instant but the coolness factor is worth it.
  * Shine through backlight with custom logo/writing.
  * Upgrade easily with a new SBC.
  * 18650s make for easy battery replacement/upgrade.
  * Decent I/O compared to most modern laptops.
  * Scary looking volto-metre
  * Incandecent charging indicator (lol)
I printed this using Matte PETG filament. PLA would be OK too. Printing in black looks good, try other colours at your own risk, they can look tacky.  
I plan to use some white aswell in the future.  
Printed on a 300x300mm printer, I needed to split into multiple parts then screw and plastic-weld them together. 100% Infill is utter over kill, but that's what I used.  
Slicer: PrusaSlicer (Flatpak).

# Parts required:
  * 1kg filament. PETG, or otherwise.
  * Eftpos sized SBC. ^See footnote
  * 3-6 18650s, of any capacity.
  * Panel Mount IEC C13 socket.
  * MeanWell IRM 12-60 ST power supply.
  * 2230 or 2242 M.2 SSD (Optional for improved performance, rockPi only accepts 2230)
  * Low profile heatsink and M.2 adapter.
  * 1080p IPS panel MODEL: N140HCA-EAB
  * 30P EDP CABLE ~15CM
  * Panel mount HDMI port LINK:
  * Panel mount USB-C breakout.
  * M3 Heat Press threaded inserts LINK:
  * Lots of M3, M2.5 & M4 screws, along with nuts. LINK:
  * SPST key switch. LINK:
  * SPST Momentary nuclear launch button. LINK:
  * Super Short and thin Micro HDMI > HDMI cable. LINK:
  * Short and thin Micro HDMI > HDMI cable. LINK:
  * HDMI > EDP adapter board. However, I'm aware that a DP > EDP is better. LINK:
  * M3 hex standoffs for above board. LINK:
  * HDMI > MINI HDMI ADAPTOR. Mini hdmi cables of the right sort are hard to find. LINK:
  * Stiff (non laptop) hinges. LINK:
  * Handle, I have no specific model, so if unsure leave out.
  * 3S balanced BMS w/screw mounts. LINK:
  * 3S 18650 holder * 2. LINK:
  * Adjustable switching buck converter. LINK:
  * FPC breakout board. Link:
  * RbPi Pico
  * Panel mount voltometre if you don't want to use the SBC to monior bats. (Voltometre also looks cooler)
  * Incandecent Bulb and holder. 
  * Mean as sunnies to complete the look


# Tools required:
  * Access to an adequately sized FDM 3d printer.
  * Soldering iron.
  * Basic Phillips & flathead screwdrivers.
  * Strong double sided tape.
  * OK with computers and Linux, or willing to learn
  * Ability to pull off a matrix trench coat and sunnies.

# Arm, Is it enough?
No. I remote desktop into my x86 void-linux PC using sunshine and moonlight. Arm is overrated.  
Luckily the pi has amazing Wi-Fi.  

# Current Issues
Remeber, work in progress.
The diode used the prevent the 18650s from feeding back into the PSU and then the charging indicator will last only a few days before needing to be replaced  
It runs at like 80-100c and is very unsafe. It also causes substantual voltage drop and decreases the max capacity of the cells.  
The hinges are way too stiff... And the screen is at immense risk of shattering. Need to use aluminium to reinforce the lid.  


# Foot note:
Frankly, despite what the tech 'tubers will tell you, you're best off with an actuall rPi-5 (or 4).  
Too many people see SBCs as nothing but cheap compute. Because an old laptop just isn't sexy enough  
This means alot of SBCs that seem compatabile with the rasberry pi "standard", are actually a nightmare to intergrate.  
An x86 N100 Mini PC is NOT a Pi replacement; if it is then you must be rather dull person.  
There needs to be a middle ground between mini pc and SoM.  
The closest alt SBC I found was the RockPi 5B, but sadly a lack of wifi was too much of a head ache for me.  
