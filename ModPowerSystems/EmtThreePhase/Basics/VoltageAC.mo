within ModPowerSystems.EmtThreePhase.Basics;
model VoltageAC
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePort;

  parameter Modelica.SIunits.Voltage Vpeak = 10 "Peak value of sinusoidal voltage";
  parameter SI.Angle phiV = 0 "Initial Voltage Angle";

  constant SI.Angle[3] phaseShift = (0:2)*2*pi/3 "phase shift";

  outer ModPowerSystems.Base.System system;

equation
     v[1] = Vpeak*cos(system.theta + phiV - phaseShift[1]);
     v[2] = Vpeak*cos(system.theta + phiV - phaseShift[2]);
     v[3] = Vpeak*cos(system.theta + phiV - phaseShift[3]);

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
