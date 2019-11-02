within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_PiLine_PQLoadimport ModPowerSystems;inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ModPowerSystems.PhasorSinglePhase.Slack.Slack slack
    annotation (Placement(transformation(extent={{-10,30},{10,10}})));
  ModPowerSystems.PhasorSinglePhase.Connections.PiLine piLine 
   annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-14})));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N0
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Loads.PQLoad pQLoad
    annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N1
    annotation (Placement(transformation(extent={{-10,-38},{10,-18}})));
equation
  connect(piLine.Pin1,N0.Pin1)
    annotation (Line(points={{0,-4},{0,-4},{0,0}},     color={0,0,0}));
  connect(pQLoad.Pin1, piLine.Pin2)
    annotation (Line(points={{0,-30},{0,-24}},color={0,0,0}));
  connect(pQLoad.Pin1, N1.Pin1)
    annotation (Line(points={{0,-30},{0,-28}},
                                             color={0,0,0}));
  connect(slack.Pin1, N0.Pin1)
    annotation (Line(points={{0,10},{0,10},{0,0}}, color={0,0,0}));
    annotation (Placement(transformation(extent={{-10,32},{10,12}})),
                Placement(transformation(extent={{-100,80},{-80,100}})),
              Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})));
end Slack_PiLine_PQLoad;
