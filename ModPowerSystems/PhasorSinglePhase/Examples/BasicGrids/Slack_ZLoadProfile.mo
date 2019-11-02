within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_ZLoadProfile
  "Impedance changes according to a normalized profile"
  import ModPowerSystems;
  final parameter String LoadProfileFile = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/LoadNormProfile_I.txt");
  final parameter String LoadProfileName = "loadI";

  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ModPowerSystems.PhasorSinglePhase.Slack.Slack slack(Vnom=20e3)
    annotation (Placement(transformation(extent={{-10,30},{10,10}})));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N0(Vnom=20e3)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Loads.ZLoadProfile zLoadProfile(
    profileFileName = LoadProfileFile,
    profileName = LoadProfileName,
    Vnom=20e3,
    Pnom=5e6,
    Qnom=2e6) annotation (Placement(transformation(extent={{-10,-24},{10,-4}})));

equation
  connect(slack.Pin1, N0.Pin1)
    annotation (Line(points={{0,10},{0,0}},   color={0,0,0}));
  connect(zLoadProfile.Pin1, N0.Pin1)
    annotation (Line(points={{0,-4},{0,-4},{0,0}},    color={0,0,0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}})), experiment(StopTime=86400));
end Slack_ZLoadProfile;
