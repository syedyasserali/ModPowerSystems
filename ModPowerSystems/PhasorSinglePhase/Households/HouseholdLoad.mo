within ModPowerSystems.PhasorSinglePhase.Households;
model HouseholdLoad "Household with specific load profile"
  extends
    ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGroundedInit(Vnom=Household_Vnom);

  parameter Real Household_Vnom = 400 "nominal voltage of household";
  parameter Integer Load_Type(min=1,max=3) annotation(choices(choice=1
        "Constant P and Q values",                                                               choice=2
        "P and Q of load profile",                                                                                                   choice=3
        "Nominal values for P and Q and weighting profile"));
  parameter Real Load_Pnom = 2000.0 "nominal active power of PQ load" annotation(Dialog(enable=not Load_Type==2));
  parameter Real Load_Qnom = 0.0 "nominal reactive power of PQ load" annotation(Dialog(enable=not Load_Type==2));
  parameter String Load_ProfileFileName = "NoName"
    "File where load profile is stored"                                                annotation (Dialog(
      enable=not Load_Type==1,
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  parameter String Load_ProfileName = "NoName"
    "Table name on load profile file"
    annotation (Dialog(enable=not Load_Type==1));

  ModPowerSystems.PhasorSinglePhase.Loads.PQLoad PQ(Vnom=Household_Vnom,Pnom=Load_Pnom,Qnom=Load_Qnom) if Load_Type==1 annotation (Placement(transformation(extent={{90,160},
            {110,180}})));
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoadProfile PQProfile(Vnom=Household_Vnom,profileFileName=Load_ProfileFileName,profileName=Load_ProfileName) if Load_Type==2;
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoadNormProfile PQNormProfile(Vnom=Household_Vnom,Pnom=Load_Pnom,Qnom=Load_Qnom,profileFileName=Load_ProfileFileName,profileName=Load_ProfileName) if Load_Type==3;

equation
  connect(PQ.Pin1, Pin1) annotation (Line(points={{100,180},{100,180},{100,220},
          {0,220},{0,100}}, color={0,0,0}));
  connect(Pin1, PQProfile.Pin1);
  connect(Pin1, PQNormProfile.Pin1);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{0,60},{200,
            260}}),                                             graphics={
        Rectangle(
          extent={{40,60},{160,160}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{40,160},{100,220},{160,160},{40,160}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Line(points={{4,100},{38,100},{40,100}},     color={0,0,0})}),
                                                       Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{0,60},{200,260}})));
end HouseholdLoad;
