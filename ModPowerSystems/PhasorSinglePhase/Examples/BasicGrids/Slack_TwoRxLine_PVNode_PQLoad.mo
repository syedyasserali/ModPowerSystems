within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_TwoRxLine_PVNode_PQLoad
  import ModPowerSystems;
  inner ModPowerSystems.Base.System system annotation (
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  ModPowerSystems.PhasorSinglePhase.Slack.Slack slack(Vnom = 24e3, phiV(displayUnit = "rad") = 0) annotation (
    Placement(visible = true, transformation(extent = {{-10, 30}, {10, 10}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N0(Vnom = 24e3) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N1(Vnom = 24e3) annotation (
    Placement(visible = true, transformation(extent = {{-10, -40}, {10, -20}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Connections.RxLine L01(
    length=1,
    r=0.05,
    x=0.1,
    Vnom=24e3) annotation (Placement(visible=true, transformation(
        origin={0,-16},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  ModPowerSystems.PhasorSinglePhase.Generation.PVNode pVNode1(Pgen = 300e6, Vabs = 24e3 * 1.05, Vnom = 24e3) annotation (
    Placement(visible = true, transformation(origin={0,-78},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N2(Vnom = 24e3) annotation (
    Placement(visible = true, transformation(extent={{-10,-70},{10,-50}},      rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Connections.RxLine L12(
    length=1,
    r=0.05,
    x=0.1,
    Vnom=24e3) annotation (Placement(visible=true, transformation(
        origin={0,-44},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoad
               pQLoad(
    Vnom=24e3,
    Pnom=100e6,
    Qnom=0)
    annotation (Placement(transformation(extent={{22,-54},{42,-34}})));
equation
  connect(N1.Pin1, L01.Pin2) annotation (Line(points={{0,-30},{0,-26}}));
  connect(N0.Pin1, L01.Pin1) annotation (Line(points={{0,0},{0,-6}}));
  connect(slack.Pin1, N0.Pin1) annotation (
    Line(points = {{0, 10}, {0, 10}, {0, 0}}));
  connect(N2.Pin1, pVNode1.Pin1)
    annotation (Line(points={{0,-60},{0,-64},{0,-68}}, color={0,0,0}));
  connect(N1.Pin1, L12.Pin1)
    annotation (Line(points={{0,-30},{0,-30},{0,-34}}, color={0,0,0}));
  connect(L12.Pin2, N2.Pin1)
    annotation (Line(points={{0,-54},{0,-60}}, color={0,0,0}));
  connect(N1.Pin1, pQLoad.Pin1)
    annotation (Line(points={{0,-30},{32,-30},{32,-34}}, color={0,0,0}));
  annotation (
    Placement(transformation(extent = {{-10, 32}, {10, 12}})),
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end Slack_TwoRxLine_PVNode_PQLoad;
