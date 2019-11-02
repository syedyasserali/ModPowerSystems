within ModPowerSystems.PhasorThreePhase;
package Slack
  model Slack "infinite power source"

    extends
      ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase.OnePortGrounded;

    parameter Modelica.SIunits.Angle phiV = 0 "Initial Voltage Angle";
    constant SI.Angle[3] phaseShift = (0:2)*2*pi/3 "phase shift";

    outer ModPowerSystems.Base.System system;

  equation
     v[1] = Complex(Vnom/sqrt(3)*cos(phiV-phaseShift[1]), Vnom/sqrt(3)*sin(phiV-phaseShift[1]));
     v[2] = Complex(Vnom/sqrt(3)*cos(phiV-phaseShift[2]), Vnom/sqrt(3)*sin(phiV-phaseShift[2]));
     v[3] = Complex(Vnom/sqrt(3)*cos(phiV-phaseShift[3]), Vnom/sqrt(3)*sin(phiV-phaseShift[3]));

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
end Slack;
