within ModPowerSystems.EmtThreePhase.Measurements;
class PLL
  Modelica.Blocks.Continuous.PI PI(T = 0.01, initType = Modelica.Blocks.Types.Init.NoInit, k = 20, x(fixed = false), x_start = 0, y_start = 0)  annotation (
    Placement(visible = true, transformation(origin = {-54, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator1(initType = Modelica.Blocks.Types.Init.NoInit,k = 1,outMax = 2 * pi * 50, outMin = -2 * pi * 50, y(start = 0), y_start = 0)  annotation (
    Placement(visible = true, transformation(origin = {42, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vd annotation (
    Placement(visible = true, transformation(origin = {-126, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-126, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput theta annotation (
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(PI.u, Vd) annotation (
    Line(points = {{-66, 0}, {-126, 0}}, color = {0, 0, 127}));
  connect(PI.y, limIntegrator1.u) annotation (
    Line(points = {{-43, 0}, {30, 0}}, color = {0, 0, 127}));
   connect(limIntegrator1.y, theta) annotation (
    Line(points = {{53, 0}, {110, 0}}, color = {0, 0, 127}));
annotation (
    Diagram(graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {-2, 58}, extent = {{-48, 18}, {48, -18}}, textString = "PLL")}),
    Icon(graphics={  Rectangle(origin = {0, 26}, extent = {{-100, 74}, {100, -126}}), Text(origin = {-12, 28}, extent = {{-42, 14}, {66, -58}}, textString = "PLL")}, coordinateSystem(initialScale = 0.1)));
end PLL;
