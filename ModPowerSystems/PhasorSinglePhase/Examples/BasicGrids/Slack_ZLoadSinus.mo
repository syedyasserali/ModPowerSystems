within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_ZLoadSinus
  "Impedance changes according to a normalized profile"
  import ModPowerSystems;

  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ModPowerSystems.PhasorSinglePhase.Slack.Slack slack
    annotation (Placement(transformation(extent={{-10,30},{10,10}})));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N0
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  Loads.ZLoadSinus zLoadSinus
    annotation (Placement(transformation(extent={{-10,-26},{10,-6}})));
equation
  connect(slack.Pin1, N0.Pin1)
    annotation (Line(points={{0,10},{0,0}},   color={0,0,0}));
  connect(zLoadSinus.Pin1, N0.Pin1)
    annotation (Line(points={{0,-6},{0,0}}, color={0,0,0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}})), experiment(StopTime=86400));
end Slack_ZLoadSinus;
