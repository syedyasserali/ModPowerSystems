within ModPowerSystems.PhasorSinglePhase.Households;
model HouseholdSolar "Household with load and solar generation"
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
  parameter Real PV_Pnom = 5000 "nominal power of pv system";
  parameter String PV_ProfileFileName = "NoName" "file where matrix is stored" annotation (Dialog(
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  parameter String PV_ProfileName = "NoName" "table name on file";
  parameter Integer PV_Controller = 0
    "0 = None, 1 = Q provision, 2 = P curtailment at plant, 3 = P curtailment at PCC";
  parameter Boolean PV_SystemOn = true "PV system on/off";
  parameter Real PV_CurtailmentLimit = 70.0
    "only effective for controller type 2 and 3";

  // Make characteristic values available at household level
  Real P_PCC = -P "total active power of the household fed into the grid";
  Real Q_PCC = -Q "total reactive power of the household fed into the grid";
  Real P_PV = -PV.P "generated active power of the PV system";
  Real Q_PV = -PV.Q "generated reactive power of the PV system";

  ModPowerSystems.PhasorSinglePhase.Loads.PQLoad PQ(Vnom=Household_Vnom,Pnom=Load_Pnom,Qnom=Load_Qnom,enableOutputPload=true) if Load_Type==1 annotation (Placement(transformation(extent={{70,128},
            {90,148}})));
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoadProfile PQProfile(Vnom=Household_Vnom,profileFileName=Load_ProfileFileName,profileName=Load_ProfileName,enableOutputPload=true) if Load_Type==2;
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoadNormProfile PQNormProfile(Vnom=Household_Vnom,Pnom=Load_Pnom,Qnom=Load_Qnom,profileFileName=Load_ProfileFileName,profileName=Load_ProfileName,enableOutputPload=true) if Load_Type==3;
  Generation.SolarGenerator PV(
    Vnom=Household_Vnom,
    Pnom=PV_Pnom,
    profileFileName=PV_ProfileFileName,
    profileName=PV_ProfileName,
    ControllerType=PV_Controller,
    StatusOn=PV_SystemOn,
    CurtailLimit=PV_CurtailmentLimit,
    enableInputPload=true)
    annotation (Placement(transformation(extent={{114,128},{134,148}})));
equation

  connect(Pin1, PQ.Pin1) annotation (Line(points={{0,100},{0,100},{0,200},{100,200},
          {100,180},{80,180},{80,148}},         color={0,0,0}));
  connect(Pin1, PQProfile.Pin1);
  connect(Pin1, PQNormProfile.Pin1);

  connect(PV.Pin1, PQ.Pin1) annotation (Line(points={{124,148},{124,148},{124,180},
          {80,180},{80,148}}, color={0,0,0}));
  connect(PV.Pin1, PQProfile.Pin1);
  connect(PV.Pin1, PQNormProfile.Pin1);


  connect(PQ.P_loadOut, PV.P_loadIn) annotation (Line(points={{86.1,137.5},{100.05,
          137.5},{100.05,137.9},{115.5,137.9}}, color={0,0,127}));
  connect(PQProfile.P_loadOut, PV.P_loadIn);
  connect(PQNormProfile.P_loadOut, PV.P_loadIn);

    annotation (Placement(transformation(extent={{110,128},{130,148}})),
                                                             Icon(coordinateSystem(preserveAspectRatio=false, extent={
            {0,60},{200,240}}),                                                                               graphics={
        Rectangle(
          extent={{40,60},{160,160}},
          lineColor={0,0,0},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{40,160},{100,220},{160,160},{40,160}},
          lineColor={0,0,0},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Line(points={{4,100},{38,100},{40,100}},     color={0,0,0})}),
                                                       Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{0,60},{200,240}})));
end HouseholdSolar;
