within ModPowerSystems.EmtThreePhase.Measurements;
class PLLIdeal
  parameter Modelica.SIunits.Frequency freq_nom = 50;
  Real omega;
  Modelica.Blocks.Interfaces.RealOutput theta annotation (
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  omega = 2*pi*freq_nom;
  theta = omega*time;

annotation (
    Icon(graphics={  Rectangle(origin = {80, -1}, extent = {{-60, 41}, {20, -39}}), Text(origin = {63, 38}, extent = {{15, -30}, {-3, 2}}, textString = "PLL", fontSize = 8), Text(origin = {55, 6}, extent = {{15, -30}, {-3, 2}}, textString = "Output=Theta", fontSize = 8)}));
end PLLIdeal;
