#include <Wire.h>
#include <Zumo32U4.h>

#define QTR_THRESHOLD     1500  // microseconds

// Initialising Sensors
Zumo32U4Motors motors;
Zumo32U4ProximitySensors proxSensors;
Zumo32U4IMU imu;
Zumo32U4LineSensors lineSensors;
#define NUM_SENSORS 3
unsigned int lineSensorValues[NUM_SENSORS];
bool proxLeftActive;
bool proxFrontActive;
bool proxRightActive;

// Change Speed
int speed = 100;
// Directions
String directions = "Instructions to get to body: ";
int bodies = 1;
// Mode Switch
bool switchMode = 0;
// Button action
char action;

void setup()
{
  // Setup Xbee communication
  Serial1.begin(9600);
  // Setup Sensors
  proxSensors.initThreeSensors();
  lineSensors.initThreeSensors();
}

void loop()
{

  if (switchMode == 1)
  {
    if (Serial1.available() > 0) 
  { 
    action = Serial1.read();  

    switch (action)
    {
      case 'w':
        // go forwards
        motors.setSpeeds (speed, speed);
        directions += "Go Straight ";
        break; 
      case 's':
        // go backwards
        motors.setSpeeds(-speed, -speed);
        directions += "Go Backwards ";
        break;  
      case 'a':
        // turn left
        motors.setLeftSpeed(-speed);
        motors.setRightSpeed(speed);
        directions += "Turn Left ";
        break;   
      case 'd':
        // turn right
        motors.setLeftSpeed(speed);
        motors.setRightSpeed(-speed);
        directions += "Turn Right ";
        break;
      case 'k':
        // Switch to auto
        switchMode = 0;
        Serial1.println("Switching back to automated control");
        break;         
      default:
        motors.setLeftSpeed(0);
        motors.setRightSpeed(0);
    }
  }
  }
  else
  {
    // Check proximity sensors
    proxSensors.read();
    if(proxSensors.countsLeftWithRightLeds()>=6 && proxSensors.countsRightWithLeftLeds()>=6)
    {
      // Approach Body
      motors.setSpeeds(speed, speed);
      delay(600);

      // Display Message
      Serial1.println("I have found body number: " + String(bodies));
      Serial1.println(directions);
      Serial1.println("\n\n");
      bodies++;
    }

    else 
    {
      lineSensors.read(lineSensorValues);
      // Forwards
      if (lineSensorValues[0] > QTR_THRESHOLD && lineSensorValues[2] < QTR_THRESHOLD)
      {
        motors.setSpeeds(speed, speed);
        // Add Direction data
        if (directions.charAt(directions.length()-2) != 'd')
          directions += "Go Forward ";
      }

      // Left Turn
      if (lineSensorValues[0] < QTR_THRESHOLD && lineSensorValues[2] < QTR_THRESHOLD)
      {
        motors.setSpeeds(0, 0);
        Serial1.println("I think I have reached a corner returning to manual mode");
        switchMode = 1;
        if (directions.charAt(directions.length()-2) != 'n')
          directions += "Left Turn ";
      }

      // Right Turn
      if (lineSensorValues[0] > QTR_THRESHOLD && lineSensorValues[2] > QTR_THRESHOLD)
      {
        motors.setSpeeds(0, 0);
        Serial1.println("I think I have reached a corner returning to manual mode");
        switchMode = 1;
        if (directions.charAt(directions.length()-2) != 't')
          directions += "Turn Right ";
      }
    }
  }

}
