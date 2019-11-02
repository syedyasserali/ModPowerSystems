within ModPowerSystems.PhasorSinglePhase.Generation;
model CHP
  import ModPowerSystems;
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGroundedInit;

  outer ModPowerSystems.Base.System system;

    // Solar generation constants for model
  replaceable ModPowerSystems.PhasorSinglePhase.Generation.ModelConstants.CHPs.RecordViessmannSFH model_data constrainedby
    ModPowerSystems.PhasorSinglePhase.Generation.ModelConstants.CHPs.BaseRecord
                                                                                           annotation(choices(choice(redeclare ModPowerSystems.PhasorSinglePhase.Generation.ModelConstants.CHPs.RecordViessmannSFH model_data "Viessmann SFH"),choice(redeclare ModPowerSystems.PhasorSinglePhase.Generation.ModelConstants.CHPs.RecordViessmannMFHLow model_data "Viessmann MFH Low Demand"),choice(redeclare ModPowerSystems.PhasorSinglePhase.Generation.ModelConstants.CHPs.RecordViessmannMFHHigh model_data "Viessmann MFH High Demand")));

  parameter Real ctrl = 0 "kind of control (0->according to thermal demand, 1->according to input)";
  parameter Real ctrl_ut = 0 "utilization of CHP [0,1], to be replaced by input!";
  parameter String profileFileName = "NoName" "file where matrix is stored" annotation (Dialog(
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  parameter String profileName = "NoName" "table name on file";

  Real E_th(start=0) "stored thermal energy [Wh]";
  SI.ActivePower P_el(start=0) "generated real power";
  SI.ReactivePower Q_el(start=0) "generated reactive power";
  SI.Power P_th(start=0) "generated thermal power";
  SI.Power P_c(start=0) "power of combustion engine";
  Real P_rel "active power relative to nominal power";
  Real PF "power factor";

  Modelica.Blocks.Sources.CombiTimeTable chpProfile(
    tableOnFile = true,
    tableName = profileName,
    fileName = profileFileName,
    table = fill(0.0, 0, 2),
    extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic);
  SI.Power P_th_dem = chpProfile.y[1] "thermal power demand";

equation
    if noEvent(ctrl == 0) then
      if noEvent(P_th_dem > model_data.Pr * model_data.eff_th) then
        P_th = model_data.Pr * model_data.eff_th;
      else
        P_th = P_th_dem;
      end if;
    else
      if noEvent(ctrl_ut < 0) then
        P_c = 0;
      elseif noEvent(ctrl_ut > 1) then
        P_c = model_data.Pr;
      else
        P_c = ctrl_ut * model_data.Pr;
      end if;
    end if;

    P_th = P_c * model_data.eff_th;
    P_el = P_c * model_data.eff_el;
    P_rel = P_el /(model_data.Pr * model_data.eff_el);

    // Calculation of reactive power (Reactive power provision according to VDE AR-N 4105)
    if noEvent(P_c * model_data.eff_el>3600 and P_c * model_data.eff_el<=13800 and P_rel>0.5) then
      PF = -0.1*P_rel + 1.05;
      Q = (P_el/PF)*sin(acos(PF));
    elseif noEvent(P_c * model_data.eff_el>13800 and P_rel>0.5) then
      PF = -0.2*P_rel + 1.1;
      Q = (P_el/PF)*sin(acos(PF));
    else
      PF = 1;
      Q = 0;
    end if;

    if noEvent(P_th - P_th_dem < 0) then
      if noEvent(E_th > 0) then
        der(E_th) = P_th - P_th_dem;
      else
        der(E_th) = 0;
      end if;
    elseif noEvent(P_th - P_th_dem > 0) then
      if noEvent(E_th < model_data.C_th) then
        der(E_th) = P_th - P_th_dem;
      else
        der(E_th) = 0;
      end if;
    else
      der(E_th) = 0;
    end if;

    P = -P_el;
    Q = -Q_el;
  annotation (Icon(graphics={
        Line(
          points={{0,98},{0,48}},
          color={0,0,0}),
        Ellipse(
          extent={{-50,48},{50,-52}}),
        Text(
          extent={{-30,28},{30,-32}},
          textString="CHP",
          lineColor={0,0,0}),
        Text(
          extent={{-100,-100},{100,-60}},
          lineColor={0,0,0},
          textString="%name")}));
end CHP;

