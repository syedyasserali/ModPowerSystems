within ModPowerSystems.EmtThreePhase.Transforms;

model DQtoABC
  Modelica.Blocks.Interfaces.RealInput v_dq[2] annotation (
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v_abc[3] annotation (
    Placement(visible = true, transformation(origin = {112, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput theta annotation (
    Placement(visible = true, transformation(origin = {-116, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
  v_abc =Transforms.Functions.DQtoABC(v_dq, theta);
annotation (
    Icon(graphics={  Rectangle(origin = {0, 10}, extent = {{-100, 90}, {100, -90}}), Text(origin = {0, 9}, extent = {{12, -19}, {-8, 13}}, textString = "DQ to ABC", fontSize = 15)}));
end DQtoABC;
