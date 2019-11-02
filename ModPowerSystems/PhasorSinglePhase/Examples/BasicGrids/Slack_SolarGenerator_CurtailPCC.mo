within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_SolarGenerator_CurtailPCC
  final parameter String SolarProfileFile = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/SolarProfile.txt");
  final parameter String SolarProfileName = "SolarProfile";
  final parameter String LoadProfileFile = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/LoadNormProfile_H.txt");
  final parameter String LoadProfileName = "loadH";

  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Slack.Slack slack(Vnom=400)
    annotation (Placement(transformation(extent={{-10,24},{10,4}})));
  Generation.SolarGenerator solarGenerator(Vnom=400, profileFileName=SolarProfileFile, profileName=SolarProfileName,
    ControllerType=3,
    enableInputPload=true,
    CurtailLimit=30)
    annotation (Placement(transformation(extent={{8,-20},{28,0}})));
  Loads.PQLoadNormProfile pQNormProfile(profileFileName=LoadProfileFile,
      profileName=LoadProfileName,
    enableOutputPload=true,
    Pnom=2000,
    Qnom=1000)
    annotation (Placement(transformation(extent={{-30,-20},{-10,0}})));
equation
  connect(slack.Pin1, solarGenerator.Pin1)
    annotation (Line(points={{0,4},{0,0},{18,0}},         color={0,0,0}));
  connect(pQNormProfile.Pin1, solarGenerator.Pin1)
    annotation (Line(points={{-20,0},{18,0}}, color={0,0,0}));
  connect(pQNormProfile.P_loadOut, solarGenerator.P_loadIn) annotation (Line(
        points={{-13.9,-10.5},{-1.95,-10.5},{-1.95,-10.1},{9.5,-10.1}}, color={0,
          0,127}));
  annotation (experiment(StopTime=86400));
end Slack_SolarGenerator_CurtailPCC;
