within ModPowerSystems.EmtThreePhase.Control;
model DistributedCtrl
  Modelica.Blocks.Interfaces.RealInput Q1 annotation (
    Placement(visible = true, transformation(origin = {-174, 156}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-112, 60}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Q2 annotation (
    Placement(visible = true, transformation(origin = {-166, 88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-111, -19}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Q3 annotation (
    Placement(visible = true, transformation(origin = {-160, 26}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-113, -91}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput V annotation (
    Placement(visible = true, transformation(origin = {70, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant m1(k = 2.0e-4)  annotation (
    Placement(visible = true, transformation(origin = {-140, 186}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant m2(k = 2.0e-4)  annotation (
    Placement(visible = true, transformation(origin = {-130, 108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant m3(k = 2.0e-4)  annotation (
    Placement(visible = true, transformation(origin = {-130, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation (
    Placement(visible = true, transformation(origin = {-88, 142}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {-90, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation (
    Placement(visible = true, transformation(origin = {-90, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k1 = +1, k2 = -1)  annotation (
    Placement(visible = true, transformation(origin = {-38, 124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = +1, k2 = -1) annotation (
    Placement(visible = true, transformation(origin = {-42, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3 annotation (
    Placement(visible = true, transformation(origin = {-8, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(initType = Modelica.Blocks.Types.Init.InitialState, k = 1.5, y_start = 0)  annotation (
    Placement(visible = true, transformation(origin = {58, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 311.12)  annotation (
    Placement(visible = true, transformation(origin = {-10, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = -1)  annotation (
    Placement(visible = true, transformation(origin = {26, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4 annotation (
    Placement(visible = true, transformation(origin = {28, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(add4.y, V) annotation (
    Line(points={{39,58},{64,58},{64,58},{70,58}},          color = {0, 0, 127}));
  connect(const.y, add4.u2) annotation (
    Line(points={{1,32},{10,32},{10,52},{16,52},{16,52}},            color = {0, 0, 127}));
  connect(integrator1.y, add4.u1) annotation (
    Line(points={{69,92},{80,92},{80,72},{6,72},{6,64},{16,64},{16,64}},                color = {0, 0, 127}));
  connect(gain1.y, integrator1.u) annotation (
    Line(points={{37,92},{46,92},{46,92},{46,92}},          color = {0, 0, 127}));
  connect(add3.y, gain1.u) annotation (
    Line(points={{3,90},{8,90},{8,92},{14,92},{14,92}},            color = {0, 0, 127}));
  connect(add2.y, add3.u2) annotation (
    Line(points={{-31,60},{-28,60},{-28,84},{-20,84},{-20,84}},            color = {0, 0, 127}));
  connect(add3.u1, add1.y) annotation (
    Line(points={{-20,96},{-22,96},{-22,124},{-27,124},{-27,124}},            color = {0, 0, 127}));
  connect(add2.u2, product3.y) annotation (
    Line(points={{-54,54},{-62,54},{-62,48},{-79,48},{-79,48}},            color = {0, 0, 127}));
  connect(product1.y, add2.u1) annotation (
    Line(points={{-77,142},{-62,142},{-62,66},{-54,66},{-54,66}},            color = {0, 0, 127}));
  connect(product2.y, add1.u2) annotation (
    Line(points={{-79,98},{-66,98},{-66,118},{-50,118},{-50,118}},            color = {0, 0, 127}));
  connect(product1.y, add1.u1) annotation (
    Line(points={{-77,142},{-62,142},{-62,132},{-50,132},{-50,130}},            color = {0, 0, 127}));
  connect(product3.u2, Q3) annotation (
    Line(points = {{-102, 42}, {-114, 42}, {-114, 26}, {-160, 26}, {-160, 26}}, color = {0, 0, 127}));
  connect(m3.y, product3.u1) annotation (
    Line(points={{-119,56},{-112,56},{-112,56},{-102,56},{-102,54}},            color = {0, 0, 127}));
  connect(product2.u2, Q2) annotation (
    Line(points = {{-102, 92}, {-114, 92}, {-114, 88}, {-166, 88}, {-166, 88}}, color = {0, 0, 127}));
  connect(product2.u1, m2.y) annotation (
    Line(points={{-102,104},{-110,104},{-110,108},{-119,108},{-119,108}},            color = {0, 0, 127}));
  connect(m1.y, product1.u1) annotation (
    Line(points={{-129,186},{-116,186},{-116,148},{-100,148},{-100,148}},            color = {0, 0, 127}));
  connect(product1.u2, Q1) annotation (
    Line(points = {{-100, 136}, {-148, 136}, {-148, 156}, {-172, 156}, {-172, 156}, {-174, 156}}, color = {0, 0, 127}));
  annotation (
    Icon(graphics={  Text(origin = {-21, 43}, extent = {{-57, 59}, {111, -129}}, textString = "Distributed control"), Rectangle(origin = {-33, 29}, extent = {{-67, 73}, {133, -129}})}, coordinateSystem(extent = {{-200, -200}, {200, 200}}, initialScale = 0.1)),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    __OpenModelica_commandLineOptions = "");
end DistributedCtrl;
