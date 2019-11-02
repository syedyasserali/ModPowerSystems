within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;
model Microgrid
  ModPowerSystems.EmtThreePhase.Connections.RxLine rxLine1(length = 1, r = {{0.3, 0, 0}, {0, 0.3, 0}, {0, 0, 0.3}}, x = {{13.4, 0, 0}, {0, 13.4, 0}, {0, 0, 13.4}}) annotation (
    Placement(visible = true, transformation(origin={28,6},     extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  ModPowerSystems.EmtThreePhase.Connections.RxLine rxLine2(length = 1, r = {{0.3, 0, 0}, {0, 0.3, 0}, {0, 0, 0.3}}, x = {{13.4, 0, 0}, {0, 13.4, 0}, {0, 0, 13.4}}) annotation (
    Placement(visible = true, transformation(origin={28,-56},   extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  ModPowerSystems.EmtThreePhase.Examples.BasicGrids.DER_Feeder test_grid3
    annotation (Placement(visible=true, transformation(
        origin={-28, -174},
        extent={{-40,-40},{40,40}},
        rotation=0)));
  ModPowerSystems.EmtThreePhase.Control.DistributedCtrl distributedCtrl3
    annotation (Placement(visible=true, transformation(
        origin={106,-150},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  ModPowerSystems.EmtThreePhase.Control.DistributedCtrl distributedCtrl2
    annotation (Placement(visible=true, transformation(
        origin={114,-20},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  ModPowerSystems.EmtThreePhase.Control.DistributedCtrl distributedCtrl1
    annotation (Placement(visible=true, transformation(
        origin={116,56},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  ModPowerSystems.EmtThreePhase.Examples.BasicGrids.DER_Feeder test_grid1
    annotation (Placement(visible=true, transformation(
        origin={-34, 52},
        extent={{-40,-40},{40,40}},
        rotation=0)));
  ModPowerSystems.EmtThreePhase.Examples.BasicGrids.DER_Feeder test_grid2
    annotation (Placement(visible=true, transformation(
        origin={-28, -84},
        extent={{-40,-40},{40,40}},
        rotation=0)));
equation
  connect(test_grid1.Vi, distributedCtrl1.V) annotation(
    Line(points = {{-57, 162}, {-152, 162}, {-152, 90}, {133.562, 90}, {133.562, 55.8}, {127, 55.8}}, color = {0, 255, 255}, pattern = LinePattern.DashDotDot, thickness = 0.75, arrow = {Arrow.Open, Arrow.None}));
  connect(distributedCtrl1.Q1, test_grid1.Q_VCVSI) annotation(
    Line(points = {{104.8, 62}, {-90, 62}, {-90, 120}, {-60, 120}}, color = {0, 0, 255}, pattern = LinePattern.Dash));
  connect(test_grid1.plug1, rxLine1.Plug2) annotation(
    Line(points = {{-19, 144}, {26.1, 144}, {26.1, 25.8}, {28, 25.8}, {28, 16}}, color = {255, 0, 0}, thickness = 1));
  connect(distributedCtrl2.Q2, test_grid1.Q_VCVSI) annotation(
    Line(points = {{102.9, -21.9}, {-90, -21.9}, {-90, 120}, {-60, 120}}, color = {0, 0, 255}, pattern = LinePattern.Dash));
  connect(distributedCtrl3.Q3, test_grid1.Q_VCVSI) annotation(
    Line(points = {{94.7, -159.1}, {-90, -159.1}, {-90, 120}, {-60, 120}}, color = {0, 0, 255}, pattern = LinePattern.Dash));
  connect(test_grid2.plug1, rxLine2.Plug2) annotation(
    Line(points = {{-13, 8}, {23.6, 8}, {23.6, -34.2}, {28, -34.2}, {28, -46}}, color = {255, 0, 0}, thickness = 1));
  connect(test_grid2.Q_VCVSI, distributedCtrl1.Q2) annotation(
    Line(points = {{-54, -16}, {-54, 54}, {104.9, 54}, {104.9, 54.1}}, color = {0, 0, 255}, pattern = LinePattern.Dash));
  connect(distributedCtrl2.V, test_grid2.Vi) annotation(
    Line(points = {{125, -20.2}, {146, -20.2}, {146, -6}, {-54, -6}, {-54, 26}, {-51, 26}}, color = {0, 255, 255}, pattern = LinePattern.Dash, thickness = 0.75));
  connect(distributedCtrl2.Q1, test_grid2.Q_VCVSI) annotation(
    Line(points = {{102.8, -14}, {25.4, -14}, {25.4, -16}, {-54, -16}}, color = {0, 0, 255}, pattern = LinePattern.Dash));
  connect(distributedCtrl3.Q2, test_grid2.Q_VCVSI) annotation(
    Line(points = {{94.9, -151.9}, {-54, -151.9}, {-54, -16}}, color = {0, 0, 255}, pattern = LinePattern.Dash));
  connect(test_grid3.plug1, rxLine2.Plug1) annotation(
    Line(points = {{-13, -82}, {6.5, -82}, {6.5, -66}, {28, -66}}, color = {255, 0, 0}, thickness = 1));
  connect(test_grid3.Vi, distributedCtrl3.V) annotation(
    Line(points = {{-51, -64}, {-130, -64}, {-130, -132}, {127.812, -132}, {127.812, -150.2}, {117, -150.2}}, color = {0, 255, 255}, pattern = LinePattern.DashDot, thickness = 0.75, arrow = {Arrow.Open, Arrow.None}));
  connect(distributedCtrl3.Q1, test_grid3.Q_VCVSI) annotation(
    Line(points = {{94.8, -144}, {-90, -144}, {-90, -84}, {-54, -84}, {-54, -106}}, color = {0, 0, 255}, pattern = LinePattern.Dash));
  connect(distributedCtrl2.Q3, test_grid3.Q_VCVSI) annotation(
    Line(points = {{102.7, -29.1}, {-90, -29.1}, {-90, -84}, {-54, -84}, {-54, -106}}, color = {0, 0, 255}, pattern = LinePattern.Dash));
  connect(distributedCtrl1.Q3, test_grid3.Q_VCVSI) annotation(
    Line(points = {{104.7, 46.9}, {-90, 46.9}, {-90, -84}, {-54, -84}, {-54, -106}}, color = {0, 0, 255}, pattern = LinePattern.Dash));
  connect(rxLine2.Plug2, rxLine1.Plug1) annotation (
    Line(points={{28,-46},{28,-4}},     color = {255, 0, 0}, thickness = 1));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, initialScale = 0.1)),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    __OpenModelica_commandLineOptions = "");
end Microgrid;
