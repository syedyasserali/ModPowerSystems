within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_HouseholdLoad
  final parameter String LoadProfileFile = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/LoadNormProfile_H.txt");
  final parameter String LoadProfileName = "loadH";

  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Slack.Slack slack(Vnom=400) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,10})));
  PhasorSinglePhase.Households.HouseholdLoad householdType1_1(
    Load_Type=3,
    Load_ProfileFileName=LoadProfileFile,
    Load_ProfileName=LoadProfileName,
    Load_Qnom=1000)
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));

equation
  connect(slack.Pin1, householdType1_1.Pin1)
    annotation (Line(points={{-1.33227e-015,0},{0,0},{0,-16}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=86400, Interval=60));
end Slack_HouseholdLoad;
