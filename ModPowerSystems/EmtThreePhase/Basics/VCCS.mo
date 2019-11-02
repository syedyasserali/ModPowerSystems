within ModPowerSystems.EmtThreePhase.Basics;
model VCCS
 extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePort;

  parameter SI.Angle phiV = 0 "Initial Voltage Angle";

  constant SI.Angle[3] phaseShift = (0:2)*2*pi/3 "phase shift";

  ModPowerSystems.Base.System system;

  Modelica.Blocks.Interfaces.RealInput Vi annotation (
    Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
     i[1] = Vi*cos(system.theta + phiV - phaseShift[1]);
     i[2] = Vi*cos(system.theta + phiV - phaseShift[2]);
     i[3] = Vi*cos(system.theta + phiV - phaseShift[3]);

annotation (
    Icon(graphics={  Ellipse(origin = {1, 1}, extent = {{-37, 39}, {37, -39}}, endAngle = 360), Line(origin = {-66, 0}, points = {{-30, 0}, {30, 0}, {30, 0}}), Line(origin = {67, 0}, points = {{29, 0}, {-29, 0}}), Line(origin = {-0.255164, 70}, points = {{0.255164, 30}, {0.255164, -30}}), Line(origin = {1.23095, -0.24619}, points = {{-20, 0}, {20, 0}}), Line(origin = {-13.9446, -1.13226}, rotation = 180, points = {{-3.70892, 6.0137}, {4.29108, -1.98627}, {-3.70892, -9.98627}})}, coordinateSystem(initialScale = 0.1)));
end VCCS;

