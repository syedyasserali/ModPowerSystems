within ModPowerSystems.PhasorSinglePhase.Generation;
model WindGenerator
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGroundedInit;

  parameter Modelica.SIunits.ActivePower Pnom = 500e3 "peak power";
  parameter Real v_s = 5 "start wind speed";
  parameter Real v_r = 10 "rated wind speed";
  parameter Real v_c = 17 "cut wind speed";
  parameter Real turbineHeight = 135; // turbine height
  parameter String profileFileName = "NoName" "File where matrix is stored"
    annotation (Dialog(
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  parameter String profileName = "NoName" "Table name on file";

  Modelica.Blocks.Sources.CombiTimeTable windProfile(
    tableOnFile = true,
    tableName = profileName,
    fileName = profileFileName,
    table = fill(0.0, 0, 2),
    extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic);

  // Adaption of altitude according to "Regenerative Energiesysteme" by Volker Quaschning
  Real dataSetHeight = 10 "height of dataset";
  Real d0 = 0 "boundary layer parameter";
  Real z0 = 0.25 "roughness parameter";
  Real windSpeedDataSet = windProfile.y[1];
  Real windSpeed = windSpeedDataSet * (log((turbineHeight-d0)/z0)/log((dataSetHeight-d0)/z0));

  // Calculate coefficients for power to wind speed curve
  Real a = -(2*Pnom)/(v_r - v_s)^3;
  Real b = (3*(Pnom*v_r + Pnom*v_s))/(v_r - v_s)^3;
  Real c = -(6*Pnom*v_r*v_s)/(v_r - v_s)^3;
  Real d = (v_s^2*(3*Pnom*v_r - Pnom*v_s))/((v_r - v_s)*(v_r^2 - 2*v_r*v_s + v_s^2));

  SI.ActivePower P_gen "generated active power";
  SI.ReactivePower Q_gen "generated reactive power";
  Real P_rel "generated active power relative to nominal power";
  Real PF "power factor";

equation
  // Calculation of active power
  if noEvent(windSpeed >= v_s and windSpeed < v_r) then
    P_gen = a*windSpeed^3 + b*windSpeed^2 + c*windSpeed + d;
  elseif noEvent(windSpeed >= v_r and windSpeed < v_c) then
    P_gen = Pnom;
  else
    P_gen = 0;
  end if;
  P_rel = P_gen/Pnom;

  // Calculation of reactive power (Reactive power provision according to VDE AR-N 4105)
  if noEvent(Pnom>3600 and Pnom<=13800 and P_rel>0.5) then
    PF = -0.1*P_rel + 1.05;
    Q = (P_gen/PF)*sin(acos(PF));
  elseif noEvent(Pnom>13800 and P_rel>0.5) then
    PF = -0.2*P_rel + 1.1;
    Q = (P_gen/PF)*sin(acos(PF));
  else
    PF = 1;
    Q = 0;
  end if;

    P = -P_gen;
    Q = -Q_gen;
  annotation (
  Documentation(
          info="<html>
<p>
Wind Turbine which uses polynomial function to approximate wind - power curve.
</p>
</html>"),
  Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-140},{100,100}},
        grid={2,2}),
        graphics={
          Polygon(
            points={{-62,-90},{-60,88},{-50,60},{-45,40},{-45,20},{-49,6},{-61,0},
              {-73,-6},{-77,-20},{-77,-40},{-72,-60},{-62,-90}},
            fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{64,50},{-36,-50}},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-58,60},{82,-60}},
          lineThickness=0.5,
          fillPattern=FillPattern.Solid,
          textString="~"),
        Text(
          extent={{-100,-100},{100,-140}},
          lineColor={0,0,0},
          textString="%name"),
        Rectangle(
          extent={{-62,2},{-36,-2}},
          lineThickness=1,
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(points={{0,100},{0,48}}, color={0,0,0})}),
    Diagram(coordinateSystem(extent={{-100,-140},{100,100}})));
end WindGenerator;
