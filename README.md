# openBook
openBook is a 3d printed laptop based on a eftpos-card sized SBC and 18650s. I should've been using git for this from the start ):  

I use this as my school, work, and hobby laptop however it is far from ideal for most people.  

It's thick, heavy and janky. I don't consider this a cyber_deck but it's no anyon_e either.  

It was made by me, niknabno. I made the models in openScad, as I found FreeCAD confusing. However I'm not a good programmer and the technical debt was insane.  

I made everything a literal and never got around to fixing it. PAIN. Utterly my fault, but nonetheless I'm looking at FOSS GUI CAD software now.  

Very little electronics knowledge was needed to design this, as it’s not component level. However I did still learn a lot.

Thanks to [Insert_name] for the Libre font used:

# Unique features:
  * In built power supply, use an IEC C13/14 cord to charge.
  * 18650 cells only charge to ~80% (not a bug a feature, trust)
  * Turn the laptop on with a key, you'll lose it in an instant but the coolness factor is worth it.
  * Shine through backlight with custom logo/writing.
  * Upgrade easily with a new SBC.
  * 18650s make for easy battery replacement/upgrade.

I printed this using Matte PETG filament. PLA would be OK too. Printing in black looks good, try other colours at your own risk, they can look tacky.
Printed on a 300x300mm printer, I needed to split into multiple parts then screw and plastic-weld them together. 

# Parts required:
  * 1kg filament. PETG, or otherwise.
  * 5V Eftpos sized SBC (I recommend rockPi 5B, due to its' built in M.2 slot and improved efficiency and performance than a Raspberry Pi5).
  * 3-6 18650s, of any capacity.
  * Panel Mount IEC C13 socket.
  * MeanWell IRM 12-60 ST power supply.
  * 2230 or 2242 M.2 SSD (Optional for improved performance)
  * 1080p IPS panel MODEL:
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
  * Mean as sunnies to complete the look


# Tools required:
  * Access to an adequately sized FDM 3d printer.
  * Soldering iron.
  * Basic Phillips & flathead screwdrivers.
  * Strong double sided tape.
  * Ability to pull off a matrix trench coat and sunnies.
