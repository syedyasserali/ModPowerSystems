within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_CHP
  final parameter String CHPProfileFile = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/CHPProfile.txt");
  final parameter String CHPProfileName = "chp_profile";

  Slack.Slack slack(Vnom=400)
    annotation (Placement(transformation(extent={{-10,24},{10,4}})));
  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Generation.CHP cHP(
    profileFileName=CHPProfileFile,
    profileName=CHPProfileName,
    Vnom=400,
    redeclare Generation.ModelConstants.CHPs.RecordViessmannMFHHigh model_data
      "Viessmann MFH High Demand")
    annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
equation
  connect(slack.Pin1, cHP.Pin1)
    annotation (Line(points={{0,4},{0,4},{0,0}}, color={0,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), experiment(StopTime=86400, Interval=60));
end Slack_CHP;
