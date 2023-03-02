#include <Wire.h>
#include <Zumo32U4.h>

// Initialise sensors, speed, cooldown, and body count/location
Zumo32U4Motors motors;
Zumo32U4ProximitySensors proxSensors;
char action;
int speed = 100;
bool proxLeftActive;
bool proxFrontActive;
bool proxRightActive;
unsigned long sensorWaitTime = 0;
int bodyCooldown = 500;
int bodies = 1;
String directions = "Instructions to get to body: ";

void setup()
{
  // Setup communication and sensors
  Serial1.begin(9600);
  proxSensors.initThreeSensors();
}

void loop()
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
      case 'e':
        // slight turn right
        motors.setLeftSpeed(speed);
        motors.setRightSpeed(0);
        directions += "Turn Slightly Right ";
        break; 
      case 'q':
        // slight turn left
        motors.setLeftSpeed(0);
        motors.setRightSpeed(speed);
        directions += "Turn Slightly Left ";
        break;
      case 'x':
        // slight turn left back
        motors.setLeftSpeed(-speed);
        motors.setRightSpeed(0);
        directions += "Make a Reverse Left Turn";
        break;
      case 'z':
        // slight turn right back
        motors.setLeftSpeed(0);
        motors.setRightSpeed(-speed);
        directions += "Make a Reverse Right Turn";
        break;            
      default:
        motors.setLeftSpeed(0);
        motors.setRightSpeed(0);
    }
  }

  // Check proximity sensors every 0.5 seconds
  if (millis() - sensorWaitTime >= bodyCooldown)
  {
    bodyCooldown += 500;
    proxSensors.read();
    if(proxSensors.countsLeftWithRightLeds()>=1 && proxSensors.countsRightWithLeftLeds()>=1)
    {
      Serial1.println("I have found body number: " + String(bodies) + ".");
      Serial1.println(directions + ".");
      Serial1.println("\n\n.");
      bodyCooldown += 6000;
      bodies++;
    }
  
  }
}
