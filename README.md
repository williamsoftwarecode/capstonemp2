# Capstone MP2
Wireless Patient Monitoring System

Project: MP2 - Wireless Patient Monitoring System 

Programs to install: 
1. Arduino
2. Python-Matplotlib
3. TightVNCServer
4. XTightVNCViewer
- Command: 'sudo apt-get install <program_name>'

To set up wireless communication:
- Set up ad hoc WiFi access point for Raspberry Pi. 
- Set up static IP address for Raspberry Pi's ad hoc WiFi access point. 
- Set up VNC server on Raspberry Pi using TightVNCServer
- Set up boot_mp2.sh and pi.sh. Both shell files are used to automate processes in Linux. 
   boot_mp2.sh - sets up TightVNCServer on Raspberry Pi
 pi.sh - runs a new vnc server at 1920x1080
- Use xtightvncviewer to view from another Raspberry Pi. 

To set up Arduino and sensors: 
- Compiled code for XC-4494 thermistor onto Arduino Uno. 
- Readings on Serial Monitor between ranges of 430~500.
- Values are not calibrated but heating with finger increases output value. 
- Temperature sensing using thermistor requires further calibration. 
- Initial concern that Raspberry Pi might not be able to provide sufficient power for Arduino Uno. 
- Upon testing with multiple sketch uploads, Arduino Uno performs normally. 
- Used duinotech's XC-4494 datasheet (Temperature Sensor Module).
- Arduino Uno without shields or motors should be able to be fully supported by Raspberry Pi without power concerns. 
- Mouse, keyboard, and Arduino Uno were connected together at time of test. 
- To do: Calibrate temperature sensor (in degree Celcius). 
- To do: Save Arduino Uno output values into database. Database to be created. 

To redirect Arduino output to shell:
- Python needed to interface between Arduino Uno serial input and SQL database. 
- Since the data visualisation programs are all local applications, SQLite fits as a more appropriate database than MySQL. 
- Store data in text file, retrieve, and plot (with live update). Requires FIFO pattern for storing data. 
- Redirect Arduino Uno serial output to terminal using bash. 
- Python script and successfully redirected Arduino Uno serial output to terminal window. 
- Add Python file called plot.py. 

To plot real-time update graph:
- Plot graph of Arduino Uno temperature sensor output with live update using Matplotlib. 
- serial_to_db.py must run first and gather data set of specified size first, before running plot.py.
- For plot.py, there is a small reliability issue if the dimension of x,y values do not match. 
- To do: Revise serial_to_db.py to remove serial input that is inconsistent with expected format.

- To do: Check memory capacity when running VNC Viewer. 
- To do: Hypothesis testing and statistical analysis of Raspberry Pi reliability for:
 1. Transmission
 2. Processing
 3. Memory
 4. Temperature
 5. Current/Power Consumption - Battery Concerns

- To do: Set up battery and DC-DC voltage converter and check current limit. 
- May use duinotech's XC-4512 (5V DC to DC Converter Module).
