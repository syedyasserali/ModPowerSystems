within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_Tra_Line_PQLoadimport ModPowerSystems;inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ModPowerSystems.PhasorSinglePhase.Connections.PiLine piLine(
    r=0.207,
    x=0.121,
    g=0.0,
    b=0,
    length=10) 
   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-44})));
  ModPowerSystems.PhasorSinglePhase.Slack.Slack slack
    annotation (Placement(transformation(extent={{-10,28},{10,8}})));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N0(Vnom=110e3)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Transformers.Transformer transformer(
    Vnom1=110e3,
    Vnom2=20e3,
    URr=0.63,
    Ukr=12.04,
    Sr=20e6)                                    
   annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-14})));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N1(Vnom=20e3)
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N2(Vnom=20e3)
    annotation (Placement(transformation(extent={{-10,-74},{10,-54}})));
  Loads.PQLoad pQLoad(
    Vnom=20e3,
    Pnom=5e6,
    Qnom=2e6)
    annotation (Placement(transformation(extent={{-10,-88},{10,-68}})));
equation
  connect(slack.Pin1, N0.Pin1)
    annotation (Line(points={{0,8},{0,4},{0,0}},    color={0,0,0}));
  connect(transformer.Pin2, piLine.Pin1)
    annotation (Line(points={{0,-24},{0,-34}},
                                             color={0,0,0}));
  connect(transformer.Pin1, N0.Pin1)
    annotation (Line(points={{0,-4},{0,0}},  color={0,0,0}));
  connect(piLine.Pin1, N1.Pin1) 
   annotation (Line(points={{1.77636e-015,-34},{0,-34},
          {0,-30}},color={0,0,0}));
  connect(transformer.Pin2, N1.Pin1)
    annotation (Line(points={{0,-24},{0,-30}},
                                             color={0,0,0}));
  connect(piLine.Pin2, N2.Pin1) 
   annotation (Line(points={{-1.77636e-015,-54},{
          -1.77636e-015,-64},{0,-64}}, color={0,0,0}));
  connect(N2.Pin1, pQLoad.Pin1)
    annotation (Line(points={{0,-64},{0,-64},{0,-68}}, color={0,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}})));
end Slack_Tra_Line_PQLoad;
