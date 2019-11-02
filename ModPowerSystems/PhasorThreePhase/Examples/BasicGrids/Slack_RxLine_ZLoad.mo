within ModPowerSystems.PhasorThreePhase.Examples.BasicGrids;
model Slack_RxLine_ZLoad
  ModPowerSystems.PhasorThreePhase.Slack.Slack slack(Vnom=110e3)
   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,34})));
  ModPowerSystems.PhasorThreePhase.Connections.BusBar busBar(Vnom=110e3)
    annotation (Placement(transformation(extent={{-10,8},{10,28}})));
  ModPowerSystems.PhasorThreePhase.Connections.RxLine rxLine
   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,0})));
  ModPowerSystems.PhasorThreePhase.Connections.BusBar busBar1(Vnom=110e3)
    annotation (Placement(transformation(extent={{-10,-26},{10,-6}})));
  ModPowerSystems.PhasorThreePhase.Loads.ZLoad zLoad(Vnom=110e3)
    annotation (Placement(transformation(extent={{-10,-46},{10,-26}})));
equation
  connect(busBar1.Plug1, zLoad.Plug1)
    annotation (Line(points={{0,-16},{0,-16},{0,-26}}, color={0,0,0}));
  connect(rxLine.Plug1, busBar1.Plug1)
    annotation (Line(points={{0,-10},{0,-13},{0,-16}}, color={0,0,0}));
  connect(rxLine.Plug2, busBar.Plug1)
    annotation (Line(points={{0,10},{0,18}}, color={0,0,0}));
  connect(slack.Plug1, busBar.Plug1)
    annotation (Line(points={{0,24},{0,21},{0,18}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Slack_RxLine_ZLoad;
