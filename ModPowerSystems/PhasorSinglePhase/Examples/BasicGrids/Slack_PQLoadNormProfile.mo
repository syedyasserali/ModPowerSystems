within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_PQLoadNormProfile
  import ModPowerSystems;
  final parameter String LoadProfileFile = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/LoadNormProfile_H.txt");
  final parameter String LoadProfileName = "loadH";

  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ModPowerSystems.PhasorSinglePhase.Slack.Slack slack
    annotation (Placement(transformation(extent={{-10,30},{10,10}})));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar N0
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Loads.PQLoadNormProfile pQNormProfile(profileFileName=LoadProfileFile,
      profileName=LoadProfileName)
    annotation (Placement(transformation(extent={{-10,-24},{10,-4}})));
equation
  connect(slack.Pin1, N0.Pin1)
    annotation (Line(points={{0,10},{0,0}},   color={0,0,0}));
  connect(pQNormProfile.Pin1, N0.Pin1)
    annotation (Line(points={{0,-4},{0,0}},  color={0,0,0}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
            -100},{100,100}})));
end Slack_PQLoadNormProfile;
