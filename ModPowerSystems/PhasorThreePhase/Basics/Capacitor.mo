within ModPowerSystems.PhasorThreePhase.Basics;
model Capacitor
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase.OnePort;
  outer ModPowerSystems.Base.System system;

  parameter SI.Capacitance C[3] = {1e-6,1e-6,1e-6};
  SI.Reactance X[3] = -ones(3)./(system.omega*C[:]);

equation
  i[:].re = C[:] .* der(v[:].re) - ones(3)./X[:] .* v[:].im;
  i[:].im = C[:] .* der(v[:].im) + ones(3)./X[:] .* v[:].re;

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
