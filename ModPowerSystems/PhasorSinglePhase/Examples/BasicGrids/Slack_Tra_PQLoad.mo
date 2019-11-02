within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_Tra_PQLoad
  import ModPowerSystems;

  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ModPowerSystems.PhasorSinglePhase.Slack.Slack slack
    annotation (Placement(transformation(extent={{-10,28},{10,8}})));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N0
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Transformers.Transformer transformer(
    Vnom1=110e3,
    Vnom2=20e3,
    URr=0.63,
    Ukr=12.04,
    Sr=10e6)                                    annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-14})));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N1(Vnom=20e3)
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Loads.PQLoad pQLoad(
    Vnom=20e3,
    Pnom=5e6,
    Qnom=2e6) annotation (Placement(transformation(extent={{-10,-54},{10,-34}})));
equation
  connect(slack.Pin1, N0.Pin1)
    annotation (Line(points={{0,8},{0,4},{0,0}},    color={0,0,0}));
  connect(transformer.Pin1, N0.Pin1)
    annotation (Line(points={{0,-4},{0,0}},  color={0,0,0}));
  connect(transformer.Pin2, N1.Pin1)
    annotation (Line(points={{0,-24},{0,-30}},
                                             color={0,0,0}));
  connect(N1.Pin1, pQLoad.Pin1)
    annotation (Line(points={{0,-30},{0,-34}},
                                             color={0,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})));
end Slack_Tra_PQLoad;
