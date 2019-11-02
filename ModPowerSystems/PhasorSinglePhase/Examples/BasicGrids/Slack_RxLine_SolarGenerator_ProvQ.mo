within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_RxLine_SolarGenerator_ProvQ
  final parameter String SolarProfileFile = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/SolarProfile.txt");
  final parameter String SolarProfileName = "SolarProfile";

  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Slack.Slack slack(Vnom=400)
    annotation (Placement(transformation(extent={{-10,24},{10,4}})));
  Generation.SolarGenerator solarGenerator(Vnom=400, profileFileName=SolarProfileFile, profileName=SolarProfileName,
    ControllerType=1)
    annotation (Placement(transformation(extent={{-10,-54},{10,-34}})));
  Connections.RxLine                                   rxLine annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-16})));
  Connections.BusBar                                   N0(Vnom=400)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Connections.BusBar                                   N1(Vnom=400)
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
equation
  connect(rxLine.Pin1, N0.Pin1)
    annotation (Line(points={{1.77636e-015,-6},{0,-6},{0,0}}, color={0,0,0}));
  connect(slack.Pin1, N0.Pin1)
    annotation (Line(points={{0,4},{0,2},{0,0}}, color={0,0,0}));
  connect(solarGenerator.Pin1, N1.Pin1)
    annotation (Line(points={{0,-34},{0,-34},{0,-30}}, color={0,0,0}));
  connect(rxLine.Pin2, N1.Pin1)
    annotation (Line(points={{0,-26},{0,-28},{0,-30}}, color={0,0,0}));
  annotation (experiment(StopTime=86400));
end Slack_RxLine_SolarGenerator_ProvQ;
