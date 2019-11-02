within ModPowerSystems.EmtThreePhase.Slack;
model Slack "infinite power source"
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePortGrounded;

  parameter SI.Angle phiV = 0 "Initial Voltage Angle";

  constant SI.Angle[3] phaseShift = (0:2)*2*pi/3 "phase shift";

  outer ModPowerSystems.Base.System system;

equation
     v[1] = Vnom/sqrt(3)*cos(system.theta + phiV - phaseShift[1]);
     v[2] = Vnom/sqrt(3)*cos(system.theta + phiV - phaseShift[2]);
     v[3] = Vnom/sqrt(3)*cos(system.theta + phiV - phaseShift[3]);

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
            lineColor={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{-20,60},{60,-20}},
            lineColor={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{-60,60},{60,-60}},
            lineColor={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{-60,20},{20,-60}},
            lineColor={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{-60,-20},{-20,-60}},
            lineColor={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{-60,20},{-20,60}},
            lineColor={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{-60,-20},{20,60}},
            lineColor={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{-60,-60},{60,60}},
            lineColor={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{-20,-60},{60,20}},
            lineColor={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{20,-60},{60,-20}},
            lineColor={0,0,0},
            pattern=LinePattern.Solid),
          Line(
            points={{0,100},{0,60}},
            lineColor={0,0,0},
            pattern=LinePattern.Solid),
          Text(
            extent={{-100,-60},{100,-100}},
            textString="%name")}));
end Slack;
