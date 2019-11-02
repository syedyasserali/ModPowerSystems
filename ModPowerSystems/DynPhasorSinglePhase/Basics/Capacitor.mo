within ModPowerSystems.DynPhasorSinglePhase.Basics;
model Capacitor
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePort;
  outer ModPowerSystems.Base.System system;

  parameter SI.Capacitance C = 1e-6;
  SI.Reactance X = -1/(system.omega*C);

equation
  i.re = C*der(v.re) - 1/X * v.im;
  i.im = C*der(v.im) + 1/X * v.re;

  annotation (Icon(graphics={
        Line(points={{-14,0},{-100,0}},
                                     color={0,0,0}),
        Line(points={{8,58}}, color={0,0,0}),
        Line(points={{100,0},{12,0}},color={0,0,0}),
        Rectangle(
          extent={{-14,32},{-12,-32}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{10,32},{12,-32}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}));
end Capacitor;
