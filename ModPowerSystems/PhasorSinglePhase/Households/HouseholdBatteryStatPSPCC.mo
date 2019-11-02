within ModPowerSystems.PhasorSinglePhase.Households;
model HouseholdBatteryStatPSPCC
  "Household with battery storage - Static Peak-Shaving at PCC"
  extends
    ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGroundedInit(Vnom=Household_Vnom);

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
  parameter Boolean Bat_SystemOn = true "Battery system on/off";
  parameter Real Bat_StaticPeakShavingLimit = 50.0 "in percent of nominal power of pv system";

  // Make characteristic values available at household level
  Real P_PCC = -P "total active power of the household fed into the grid";
  Real Q_PCC = -Q "total reactive power of the household fed into the grid";
  Real P_PV = -PV.P "generated active power of the PV system";
  Real Q_PV = -PV.Q "generated reactive power of the PV system";
  Real P_Bat = Bat.P_bat "battery charging power";
  Real SOC_Bat = Bat.SOC "battery state of charge";

  Generation.SolarGenerator PV(
    Vnom=Household_Vnom,
    Pnom=PV_Pnom,
    profileFileName=PV_ProfileFileName,
    profileName=PV_ProfileName,
    ControllerType=PV_Controller,
    StatusOn=PV_SystemOn,
    CurtailLimit=PV_CurtailmentLimit,
    enableOutputPsolar=true)
    annotation (Placement(transformation(extent={{90,134},{110,154}})));
  ModPowerSystems.PhasorSinglePhase.Storage.BatteryIdeal Bat(
    Vnom=Household_Vnom,
    C_nom=Bat_Cnom,
    StatusOn=Bat_SystemOn) annotation (Placement(transformation(extent={{150,136},
            {170,156}})));
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoad PQ(Vnom=Household_Vnom,Pnom=Load_Pnom,Qnom=Load_Qnom,enableOutputPload=true) if Load_Type==1 annotation (Placement(transformation(extent={{50,134},
            {70,154}})));
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoadProfile PQProfile(Vnom=Household_Vnom,profileFileName=Load_ProfileFileName,profileName=Load_ProfileName,enableOutputPload=true) if Load_Type==2;
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoadNormProfile PQNormProfile(Vnom=Household_Vnom,Pnom=Load_Pnom,Qnom=Load_Qnom,profileFileName=Load_ProfileFileName,profileName=Load_ProfileName,enableOutputPload=true) if Load_Type==3;
  Storage.ChargingControllers.StaticPeakShaving staticPeakShaving(P_PSLimit=
        Bat_StaticPeakShavingLimit/100.0*PV_Pnom)
    annotation (Placement(transformation(extent={{120,112},{140,132}})));
equation
  connect(PV.Pin1, Pin1) annotation (Line(points={{100,154},{100,154},{100,240},
          {0,240},{0,100},{0,100}},
                 color={0,0,0}));
  connect(PQ.Pin1, Pin1) annotation (Line(points={{60,154},{60,196},{100,196},{
          100,240},{100,240},{0,240},{0,100},{0,100}},
                           color={0,0,0}));
  connect(PQProfile.Pin1, Pin1);
  connect(PQNormProfile.Pin1, Pin1);
  connect(Bat.Pin1, Pin1) annotation (Line(points={{160,156},{160,196},{100,196},
          {100,240},{100,240},{0,240},{0,100},{0,100}},
                           color={0,0,0}));
  connect(Bat.P_batIn, staticPeakShaving.P_Bat) annotation (Line(points={{150.5,
          143.5},{144,143.5},{144,122},{139,122}},
                                       color={0,0,127}));
  connect(PV.P_solarOut, staticPeakShaving.P_PV) annotation (Line(points={{108.5,
          143.9},{116,143.9},{116,124},{121,124}},
                                       color={0,0,127}));
  connect(PQ.P_loadOut, staticPeakShaving.P_Load) annotation (Line(points={{66.1,
          143.5},{84,143.5},{84,120},{121,120}},
                                              color={0,0,127}));
  connect(PQProfile.P_loadOut, staticPeakShaving.P_Load);
  connect(PQNormProfile.P_loadOut, staticPeakShaving.P_Load);
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
end HouseholdBatteryStatPSPCC;
