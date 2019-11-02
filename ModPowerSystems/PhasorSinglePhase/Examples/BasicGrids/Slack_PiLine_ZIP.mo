within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_PiLine_ZIP
  ModPowerSystems.PhasorSinglePhase.Slack.Slack slack1(Vnom = 33e3)  annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Loads.ZIPLoad zIPLoad1(P0 = 2e6, Q0 = 4e6, V0 = 33000, Vnom = 33000, a0 = 0, a1 = 0, a2 = 1, b0 = 0, b1 = 0, b2 = 1)  annotation(
    Placement(visible = true, transformation(origin = {54, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar busBar1(Vnom = 33e3)  annotation(
    Placement(visible = true, transformation(origin = {-38, 48}, extent = {{-10, 0}, {10, 20}}, rotation = -90)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar busBar2(Vnom = 33e3)  annotation(
    Placement(visible = true, transformation(origin = {28, 48}, extent = {{-10, 0}, {10, 20}}, rotation = -90)));
  ModPowerSystems.PhasorSinglePhase.Connections.PiLine piLine1(b = 0, g = 0, length = 100, r = 0.161, x = 0.29)  annotation(
    Placement(visible = true, transformation(origin = {0, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(piLine1.Pin1, busBar1.Pin1) annotation(
    Line(points = {{-10, 46}, {-28, 46}, {-28, 48}, {-28, 48}}));
  connect(piLine1.Pin2, busBar2.Pin1) annotation(
    Line(points = {{10, 46}, {38, 46}, {38, 48}, {38, 48}}));
  connect(zIPLoad1.Pin1, busBar2.Pin1) annotation(
    Line(points = {{54, 48}, {38, 48}}));
  connect(slack1.Pin1, busBar1.Pin1) annotation(
    Line(points = {{-70, 40}, {-70, 40}, {-70, 48}, {-28, 48}, {-28, 48}}));
end Slack_PiLine_ZIP;
