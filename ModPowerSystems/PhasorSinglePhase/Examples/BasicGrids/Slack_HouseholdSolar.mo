within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_HouseholdSolar
  final parameter String LoadProfileFile = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/LoadNormProfile_H.txt");
  final parameter String LoadProfileName = "loadH";
  final parameter String SolarProfileFile = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/SolarProfile.txt");
  final parameter String SolarProfileName = "SolarProfile";

  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Slack.Slack slack(Vnom=400) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,10})));

  Households.HouseholdSolar householdSolar(Load_ProfileFileName=LoadProfileFile,
      Load_ProfileName=LoadProfileName,
    PV_ProfileFileName=SolarProfileFile,
    PV_ProfileName=SolarProfileName,
    Vnom=400,
    Load_Type=3)
    annotation (Placement(transformation(extent={{0,-20},{20,-2}})));
equation
  connect(slack.Pin1, householdSolar.Pin1)
    annotation (Line(points={{-1.33227e-015,0},{-1.33227e-015,-16},{0,-16}},
                                                    color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Slack_HouseholdSolar;
