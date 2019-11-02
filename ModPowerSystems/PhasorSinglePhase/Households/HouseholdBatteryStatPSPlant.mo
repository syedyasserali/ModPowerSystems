within ModPowerSystems.PhasorSinglePhase.Households;
model HouseholdBatteryStatPSPlant
  "Household with battery storage - Static Peak-Shaving at Plant"
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGroundedInit(Vnom=Household_Vnom);

  parameter Real Household_Vnom = 400 "nominal voltage of household";
  parameter Integer Load_Type(min=1,max=3) annotation(choices(choice=1
        "Constant P and Q values",                                                               choice=2
        "P and Q of load profile",                                                                                                   choice=3
        "Nominal values for P and Q and weighting profile"));
  parameter Real Load_Pnom = 2000.0 "nominal active power of PQ load";
  parameter Real Load_Qnom = 0.0 "nominal reactive power of PQ load";
  parameter String Load_ProfileFileName = "NoName"
    "File where load profile is stored"                                                annotation (Dialog(
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  parameter String Load_ProfileName = "NoName"
    "Table name on load profile file";
  parameter Real PV_Pnom = 5000 "nominal power of pv system";
  parameter String PV_ProfileFileName = "NoName" "file where matrix is stored" annotation (Dialog(
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  parameter String PV_ProfileName = "NoName" "table name on file";
  parameter Integer PV_Controller = 0
    "0 = None, 1 = Q provision, 2 = P curtailment";
  parameter Boolean PV_SystemOn = true "PV system on/off";
  parameter Real PV_CurtailmentLimit = 70.0
    "only effective for controller type 2";
  parameter Real Bat_Cnom = 5000 "usable battery capacity in Wh";
parameter Real Bat_StaticPeakShavingLimit = 50.0 "in percent of nominal power of pv system";

  // Make characteristic values available at household level
  Real P_PCC = -P "total active power of the household fed into the grid";
  Real Q_PCC = -Q "total reactive power of the household fed into the grid";
  Real P_PV = -PV.P "generated active power of the PV system";
  Real Q_PV = -PV.Q "generated reactive power of the PV system";
  Real P_Bat = Bat.P_bat "battery charging power";
  Real SOC_Bat = Bat.SOC "battery state of charge";

  Modelica.Blocks.Math.Add Add(k2=-1)    annotation (Placement(transformation(extent={{88,98},
            {108,118}})));
  Generation.SolarGenerator PV(
    Vnom=Household_Vnom,
    Pnom=PV_Pnom,
    profileFileName=PV_ProfileFileName,
    profileName=PV_ProfileName,
    ControllerType=PV_Controller,
    StatusOn=PV_SystemOn,
    CurtailLimit=PV_CurtailmentLimit,
    enableOutputPsolar=true)
    annotation (Placement(transformation(extent={{90,154},{110,174}})));
  ModPowerSystems.PhasorSinglePhase.Storage.BatteryIdeal Bat(Vnom=Household_Vnom, C_nom=Bat_Cnom)
    annotation (Placement(transformation(extent={{130,180},{150,200}})));
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoad PQ(Vnom=Household_Vnom,Pnom=Load_Pnom,Qnom=Load_Qnom) if Load_Type==1 annotation (Placement(transformation(extent={{50,154},
            {70,174}})));
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoadProfile PQProfile(Vnom=Household_Vnom,profileFileName=Load_ProfileFileName,profileName=Load_ProfileName) if Load_Type==2;
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoadNormProfile PQNormProfile(Vnom=Household_Vnom,Pnom=Load_Pnom,Qnom=Load_Qnom,profileFileName=Load_ProfileFileName,profileName=Load_ProfileName) if Load_Type==3;

  Modelica.Blocks.Sources.Constant const(k=Bat_StaticPeakShavingLimit/100)
    annotation (Placement(transformation(extent={{24,100},{44,120}})));
  Modelica.Blocks.Sources.Constant const1(k=PV_Pnom)
    annotation (Placement(transformation(extent={{24,70},{44,90}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{58,86},{78,106}})));
equation
  connect(const.y, product.u1) annotation (Line(points={{45,110},{50,110},{50,102},{56,102}},
                               color={0,0,127}));
  connect(const1.y, product.u2) annotation (Line(points={{45,80},{50,80},{50,90},{56,90}},
                               color={0,0,127}));
  connect(product.y, Add.u2) annotation (Line(points={{79,96},{82,96},{82,102},{86,102}},
                           color={0,0,127}));
  connect(PV.P_solarOut, Add.u1) annotation (Line(points={{108.5,163.9},{116,163.9},{116,128},
          {76,128},{76,114},{86,114}},         color={0,0,127}));
  connect(Add.y, Bat.P_batIn) annotation (Line(points={{109,108},{118,108},{124,108},{124,187.5},
          {130.5,187.5}},         color={0,0,127}));
  connect(PV.Pin1, Pin1) annotation (Line(points={{100,174},{100,174},{100,240},{100,240},{
          0,240},{0,100},{0,100}},
                 color={0,0,0}));
  connect(PQ.Pin1, Pin1) annotation (Line(points={{60,174},{60,220},{100,220},{100,240},{0,
          240},{0,100},{0,100}},
                           color={0,0,0}));
  connect(PQProfile.Pin1, Pin1);
  connect(PQNormProfile.Pin1, Pin1);
  connect(Bat.Pin1, Pin1) annotation (Line(points={{140,200},{140,220},{100,220},{100,240},
          {0,240},{0,100},{0,100}},
                           color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{0,60},{200,240}}),
                                                                graphics={
        Rectangle(
          extent={{40,60},{160,160}},
          lineColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{40,160},{100,220},{160,160},{40,160}},
          lineColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Line(points={{4,100},{38,100},{40,100}},     color={0,0,0})}),
                                                       Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{0,60},{200,240}})));
end HouseholdBatteryStatPSPlant;
