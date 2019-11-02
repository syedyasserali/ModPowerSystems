within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;

model Slack_RxLine_ZLoad
  ModPowerSystems.EmtThreePhase.Slack.Slack slack(Vnom = 400, phiV = 0.785398) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {0, 26})));
  ModPowerSystems.EmtThreePhase.Loads.ZLoad zLoad(Pnom = {5000, 5000, 5000}, Qnom = {2000, 2000, 2000}, Vnom = 400)  annotation(
    Placement(visible = true, transformation(extent = {{-10, -68}, {10, -48}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Connections.RxLine rxLine(length = 5) annotation(
    Placement(visible = true, transformation(origin = {0, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  ModPowerSystems.EmtThreePhase.Connections.BusBar N0(Vnom = 400) annotation(
    Placement(visible = true, transformation(origin = {0, -6}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Connections.BusBar N1(Vnom = 400) annotation(
    Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, 0}, {10, 20}}, rotation = 0)));
equation
  connect(rxLine.Plug1, N0.Plug1) annotation(
    Line(points = {{0, -8}, {0, 4}}));
  connect(slack.Plug1, N0.Plug1) annotation(
    Line(points = {{0, 16}, {0, 4}}));
  connect(rxLine.Plug2, N1.Plug1) annotation(
    Line(points = {{0, -28}, {0, -40}}));
  connect(zLoad.Plug1, N1.Plug1) annotation(
    Line(points = {{0, -48}, {0, -40}}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-06, Interval = 0.001),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Slack_RxLine_ZLoad;
