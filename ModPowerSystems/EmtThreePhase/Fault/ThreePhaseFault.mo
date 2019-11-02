within ModPowerSystems.EmtThreePhase.Fault;
model ThreePhaseFault
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePortGrounded;

  parameter SI.Time t_on = 0.1 "fault  time on";
  parameter SI.Time t_off = 0.2 "fault  time off";
  parameter SI.Resistance R_on[3] = {1e-4, 1e-4, 1e-4} "resistance 'fault'";
  parameter SI.Resistance R_off[3] = {1e6, 1e6, 1e6} "resistance 'no fault'";

  SI.Resistance R[3]
                    "resistance";

equation
  if time > t_on and time < t_off then
    R = R_on;
  else
    R = R_off;
  end if;
      v[:] = R[:].*i[:];

  annotation (Icon(graphics={
        Rectangle(
          extent={{-20,40},{20,-40}},
          lineColor={0,0,0},
          lineThickness=0.5,
          origin={0,0},
          rotation=180),
        Line(points={{8,58}}, color={0,0,0}),
        Line(points={{0,98},{0,40}}, color={0,0,0}),
        Line(points={{-54,-34}}, color={0,0,0}),
        Line(points={{0,-40},{0,-92}}, color={0,0,0}),
        Polygon(
          points={{-6,-84},{6,-84},{0,-98},{-6,-84}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-46,-12},{6,14},{-10,-14},{46,18}},
          color={238,46,47},
          thickness=0.5)}));
end ThreePhaseFault;
