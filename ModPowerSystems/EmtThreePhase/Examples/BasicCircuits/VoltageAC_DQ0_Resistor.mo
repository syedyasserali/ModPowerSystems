within ModPowerSystems.EmtThreePhase.Examples.BasicCircuits;

model VoltageAC_DQ0_Resistor
  ModPowerSystems.EmtThreePhase.Basics.VoltageAC_DQ0 voltageAC_DQ01 annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.Resistor resistor1 annotation(
    Placement(visible = true, transformation(origin = {-2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {24, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Base.System system annotation(
    Placement(visible = true, transformation(origin = {-58, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageAC_DQ01.Plug2, resistor1.Plug1) annotation(
    Line(points = {{-30, 0}, {-12, 0}}));
  connect(resistor1.Plug2, ground2.Plug1) annotation(
    Line(points = {{8, 0}, {24, 0}}));
  connect(ground1.Plug1, voltageAC_DQ01.Plug1) annotation(
    Line(points = {{-60, 0}, {-50, 0}, {-50, 0}, {-50, 0}}));

end VoltageAC_DQ0_Resistor;
