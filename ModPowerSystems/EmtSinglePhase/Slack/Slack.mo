within ModPowerSystems.EmtSinglePhase.Slack;
model Slack "infinite power source"
  extends ModPowerSystems.Base.Interfaces.RealValue.SinglePhase.OnePortGrounded;

  parameter Modelica.SIunits.Voltage Vnom = 10 "Nominal rms voltage phase-to-phase";
  parameter SI.Angle phiV = 0 "Initial voltage angle";

  outer ModPowerSystems.Base.System system;

equation
  v = sqrt(2.0/3.0)*Vnom*cos(system.theta + phiV);

  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}),
        graphics={
          Rectangle(
            extent={{-60,60},{60,-60}},
            lineColor={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{20,60},{60,20}},
            color={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{-20,60},{60,-20}},
            color={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{-60,60},{60,-60}},
            color={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{-60,20},{20,-60}},
            color={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{-60,-20},{-20,-60}},
            color={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{-60,20},{-20,60}},
            color={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{-60,-20},{20,60}},
            color={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{-60,-60},{60,60}},
            color={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{-20,-60},{60,20}},
            color={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{20,-60},{60,-20}},
            color={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{0,100},{0,60}},
            color={0,0,0},
            pattern=LinePattern.Solid),
          Text(
            extent={{-100,-60},{100,-100}},
            textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=
           false, extent={{-100,-100},{100,100}})));
end Slack;
