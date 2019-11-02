within ModPowerSystems.EmtThreePhase.Transforms;
model ABCtoQD0_Krause

  Modelica.Blocks.Interfaces.RealInput f_abc[3] annotation (
    Placement(visible = true, transformation(origin = {-114, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput f_qd0[3] annotation (
    Placement(visible = true, transformation(origin = {112, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput theta annotation (
    Placement(visible = true, transformation(origin = {-116, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
  f_qd0 =Transforms.Functions.ABCtoQD0_Krause(f_abc, theta);
annotation (
    Icon(graphics={  Rectangle(origin = {0, 1}, extent = {{-100, 99}, {100, -101}}), Text(origin = {3, 4}, extent = {{-55, 32}, {55, -32}}, textString = "ABC to DQ")}, coordinateSystem(initialScale = 0.1)));
end ABCtoQD0_Krause;
