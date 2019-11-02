within ModPowerSystems.EmtSinglePhase.Basics;
model VoltageAC
  extends ModPowerSystems.Base.Interfaces.RealValue.SinglePhase.OnePort;

  parameter Modelica.SIunits.Voltage Vpeak = 10 "Nominal peak voltage phase-to-neutral";
  parameter SI.Angle phiV = 0 "Initial voltage angle";

  outer ModPowerSystems.Base.System system;

equation
  v = Vpeak*cos(system.theta + phiV);

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
end VoltageAC;
