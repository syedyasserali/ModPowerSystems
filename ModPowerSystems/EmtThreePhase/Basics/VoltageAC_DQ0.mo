within ModPowerSystems.EmtThreePhase.Basics;
model VoltageAC_DQ0
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePort;

  parameter Modelica.SIunits.Voltage Vpeak = 10 "Peak value of sinusoidal voltage";
  parameter SI.Angle phiV = 0 "Initial Voltage Angle";

  outer ModPowerSystems.Base.System system;
  
  // dq0 variables
  Real v_d;
  Real v_q;
  Real v_0;
  Real i_d;
  Real i_q;
  Real i_0;
  
equation 
  // variable transformation
  {v_d, v_q, v_0}=ModPowerSystems.EmtThreePhase.Transforms.Functions.ABCtoDQ0_Kundur(v[:], system.theta);
  {i_d, i_q, i_0}=ModPowerSystems.EmtThreePhase.Transforms.Functions.ABCtoDQ0_Kundur(i[:], system.theta);

  v_d=Vpeak*cos(phiV);
  v_q=Vpeak*sin(phiV);
  v_0=0;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                                               Ellipse(extent={{
              50,50},{-50,-50}}, lineColor={0,0,0}),
        Line(points={{-100,0},{-50,0}}, color={0,0,0}),
        Line(points={{96,0},{50,0}}, color={0,0,0}),
        Line(points={{28,-4}}, color={0,0,0}),
        Text(
          extent={{40,-30},{-40,30}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          textString="~")}),                                     Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end VoltageAC_DQ0;
