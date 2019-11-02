within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_SolarGenerator_CurtailPlant
  final parameter String SolarProfileFile = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/SolarProfile.txt");
  final parameter String SolarProfileName = "SolarProfile";

  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Slack.Slack slack(Vnom=400)
    annotation (Placement(transformation(extent={{-10,24},{10,4}})));
  Generation.SolarGenerator solarGenerator(Vnom=400, profileFileName=SolarProfileFile, profileName=SolarProfileName,
    ControllerType=2,
    CurtailLimit=40)
    annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
equation
  connect(slack.Pin1, solarGenerator.Pin1)
    annotation (Line(points={{0,4},{0,4},{0,0}},          color={0,0,0}));
  annotation (experiment(StopTime=86400));
end Slack_SolarGenerator_CurtailPlant;
