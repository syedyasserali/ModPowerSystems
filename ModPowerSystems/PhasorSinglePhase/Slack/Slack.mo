within ModPowerSystems.PhasorSinglePhase.Slack;
model Slack "infinite power source"

  extends
    ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGroundedInit;

  parameter Modelica.SIunits.Angle phiV = 0 "Initial Voltage Angle";

  outer ModPowerSystems.Base.System system;

equation
  v = Complex(Vnom/sqrt(3)*cos(phiV), Vnom/sqrt(3)*sin(phiV));

            //lineColor={0,0,0},
            //lineColor={0,0,0},
            //lineColor={0,0,0},
            //lineColor={0,0,0},
            //lineColor={0,0,0},
            //lineColor={0,0,0},
            //lineColor={0,0,0},
            //lineColor={0,0,0},
            //lineColor={0,0,0},
            //lineColor={0,0,0},
            //lineColor={0,0,0},
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
