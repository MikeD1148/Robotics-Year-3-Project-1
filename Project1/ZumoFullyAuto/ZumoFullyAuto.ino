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
#include "TurnSensor.h"

// Change Speed
int speed = 150;
// Directions
String directions = "Instructions to get to body: ";
int bodies = 1;

// Get Degrees from turn angle
int32_t getAngle() {
  return (((int32_t)turnAngle >> 16) * 360) >> 16;
}

void setup()
{
  // Setup Xbee communication
  Serial1.begin(9600);
  // Setup Gyro
  turnSensorSetup();
  delay(500);
  turnSensorReset();
  // Setup Sensors
  proxSensors.initThreeSensors();
  lineSensors.initThreeSensors();
}

void loop()
{
    // Check proximity sensors
    proxSensors.read();
    if(proxSensors.countsLeftWithRightLeds()>=6 && proxSensors.countsRightWithLeftLeds()>=6)
    {
      // Approach Body
      motors.setSpeeds(speed, speed);
      delay(600);

      Serial1.println("I have found body number: " + String(bodies));
      Serial1.println(directions);
      Serial1.println("\n\n");
      bodies++;

      // Turn the robot to the right to avoid object
      motors.setSpeeds(speed, -speed);
      // Keep turning until the robot has turned 90 degrees to the right
      while (getAngle() > -90) {
        turnSensorUpdate();
      }
      // Gyro back to 0
      turnSensorReset();
      // Go forward
      motors.setSpeeds(speed, speed);
      delay(1200);

      // Turn left
      motors.setSpeeds(-speed, speed);
        // Keep turning until the robot has turned 90 degrees to the left
        while (getAngle() < 90) {
          turnSensorUpdate();
        }
      // Gyro back to 0
      turnSensorReset();

      // Go forward
      lineSensors.read(lineSensorValues);
      while(lineSensorValues[0] < QTR_THRESHOLD && lineSensorValues[1] < QTR_THRESHOLD && lineSensorValues[2] < QTR_THRESHOLD)
      {
        lineSensors.read(lineSensorValues);
        motors.setSpeeds(speed, speed);
      }

    }

    else 
    {
      lineSensors.read(lineSensorValues);
      // Forwards
      if (lineSensorValues[0] > QTR_THRESHOLD && lineSensorValues[2] < QTR_THRESHOLD)
      {
        motors.setSpeeds(speed + 10, speed);
        // Add Direction data
        if (directions.charAt(directions.length()-2) != 'd')
          directions += "Go Forward ";
      }

      // Left Turn
      if (lineSensorValues[0] < QTR_THRESHOLD && lineSensorValues[2] < QTR_THRESHOLD)
      {
        motors.setSpeeds(0,speed);
        if (directions.charAt(directions.length()-2) != 'n')
          directions += "Left Turn ";
      }

      // Right Turn
      if (lineSensorValues[0] > QTR_THRESHOLD && lineSensorValues[2] > QTR_THRESHOLD)
      {
        delay(145);
        // Turn the robot to the right
        motors.setSpeeds(speed, -speed);
        // Keep turning until the robot has turned 90 degrees to the right
        while (getAngle() > -90) {
          turnSensorUpdate();
        }
        // Gyro back to 0
        turnSensorReset();
        if (directions.charAt(directions.length()-2) != 't')
          directions += "Turn Right ";
      }
    }
  

}
