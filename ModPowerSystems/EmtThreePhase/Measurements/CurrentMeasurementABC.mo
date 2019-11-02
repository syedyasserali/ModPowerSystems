within ModPowerSystems.EmtThreePhase.Measurements;
model CurrentMeasurementABC
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePort;
  Modelica.Blocks.Interfaces.RealOutput i_abc[3] annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  v = zeros(3);
  i_abc[:] = i[:];
  annotation (
    Icon(graphics={  Ellipse(origin = {1, 1}, extent = {{-11, 11}, {11, -11}}, endAngle = 360), Line(origin = {42.0266, 47.9977}, points = {{58, 0}, {-42, 0}}), Line(origin = {0, 30}, points = {{0, 18}, {0, -18}, {0, -18}}), Line(origin = {-83, 0}, points = {{-17, 0}, {73, 0}}), Line(origin = {12, 0}, points = {{0, 0}}), Line(origin = {14, 0}, points = {{0, 0}}), Line(origin = {56.1708, 1.17082}, points = {{-44.1708, -1.17082}, {39.8292, -1.17082}, {43.8292, 0.82918}}), Text(extent = {{-2, 6}, {4,-2}}, textString = "A")}, coordinateSystem(initialScale = 0.1)));
end CurrentMeasurementABC;
