within ModPowerSystems.EmtThreePhase.Measurements;
model PowerMeasurementDQ
  Modelica.Blocks.Interfaces.RealInput V[3] annotation (
    Placement(visible = true, transformation(origin = {-72, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 28}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput I[3] annotation (
    Placement(visible = true, transformation(origin = {-76, -56}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

  Modelica.Blocks.Interfaces.RealOutput Pac annotation (
    Placement(visible = true, transformation(origin = {70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Qac annotation (
    Placement(visible = true, transformation(origin = {72, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
    Pac = (V[1]*I[1]+V[2]*I[2]);
    Qac = (V[2]*I[1]-V[1]*I[2]);
  annotation (
    Icon(graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}), Text(extent = {{-20, 12}, {-20, 12}}, textString = "Power dq domain")}, coordinateSystem(initialScale = 0.1)));
end PowerMeasurementDQ;
