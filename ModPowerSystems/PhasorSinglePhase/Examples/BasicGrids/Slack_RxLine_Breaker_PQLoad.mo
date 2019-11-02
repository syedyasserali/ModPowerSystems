within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;

model Slack_RxLine_Breaker_PQLoad
  import ModPowerSystems;
  inner ModPowerSystems.Base.System system annotation(
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  ModPowerSystems.PhasorSinglePhase.Slack.Slack slack annotation(
    Placement(visible = true, transformation(extent = {{-10, 58}, {10, 38}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N0 annotation(
    Placement(visible = true, transformation(extent = {{-10, 18}, {10, 38}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoad pQLoad(is_connected = false)  annotation(
    Placement(visible = true, transformation(extent = {{-10, -80}, {10, -60}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N1 annotation(
    Placement(visible = true, transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Connections.RxLine rxLine annotation(
    Placement(visible = true, transformation(origin = {0, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  ModPowerSystems.PhasorSinglePhase.Switches.Breaker breaker1(is_closed = false)  annotation(
    Placement(visible = true, transformation(origin = {0, -16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N2 annotation(
    Placement(visible = true, transformation(origin = {0, -46}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
equation
  connect(pQLoad.Pin1, N2.Pin1) annotation(
    Line(points = {{0, -60}, {0, -36}}));
  connect(breaker1.Pin2, N2.Pin1) annotation(
    Line(points = {{0, -26}, {0, -26}, {0, -36}, {0, -36}}));
  connect(breaker1.Pin1, N1.Pin1) annotation(
    Line(points = {{0, -6}, {0, -6}, {0, -6}, {0, -6}, {0, 2.98024e-07}, {0, 2.98024e-07}}));
  connect(N1.Pin1, rxLine.Pin2) annotation(
    Line(points = {{0, -1.49012e-07}, {0, -1.49012e-07}, {0, -1.49012e-07}, {0, -1.49012e-07}, {0, 4}, {-8.88178e-16, 4}, {-8.88178e-16, 4}, {-1.77636e-15, 4}}));
  connect(N0.Pin1, rxLine.Pin1) annotation(
    Line(points = {{0, 28}, {0, 28}, {0, 28}, {0, 28}, {0, 26}, {0, 26}, {0, 24}}));
  connect(slack.Pin1, N0.Pin1) annotation(
    Line(points = {{0, 38}, {0, 38}, {0, 38}, {0, 38}, {0, 33}, {0, 33}, {0, 28}}));
  annotation(
    Placement(transformation(extent = {{-10, 32}, {10, 12}})),
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end Slack_RxLine_Breaker_PQLoad;
