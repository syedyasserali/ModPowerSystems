within ModPowerSystems.PhasorSinglePhase.Examples.BasicGrids;
model Slack_HouseholdBatteryStatPSPlant
  final parameter String LoadProfileFile = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/LoadNormProfile_H.txt");
  final parameter String LoadProfileName = "loadH";
  final parameter String SolarProfileFile = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/SolarProfile.txt");
  final parameter String SolarProfileName = "SolarProfile";

  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Slack.Slack slack(Vnom=400)
                      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,10})));

  Households.HouseholdBatteryStatPSPlant householdBatteryStatPSPlant(
    Load_ProfileFileName=LoadProfileFile,
    Load_ProfileName=LoadProfileName,
    PV_ProfileFileName=SolarProfileFile,
    PV_ProfileName=SolarProfileName,
    Load_Type=3,
    Bat_StaticPeakShavingLimit=20)
    annotation (Placement(transformation(extent={{0,-20},{20,-2}})));
equation
  connect(slack.Pin1, householdBatteryStatPSPlant.Pin1)
    annotation (Line(points={{-1.22125e-015,0},{0,0},{0,-16}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Slack_HouseholdBatteryStatPSPlant;
