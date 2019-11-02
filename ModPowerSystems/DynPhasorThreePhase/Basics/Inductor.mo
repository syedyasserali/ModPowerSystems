within ModPowerSystems.DynPhasorThreePhase.Basics;
model Inductor
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase.OnePort;
  outer ModPowerSystems.Base.System system;

  parameter SI.Inductance L[3] = {1e-3,1e-3,1e-3};
  SI.Reactance X[3] = system.omega*L[:];

equation
  v[:].re = L[:].*der(i[:].re) - X[:].*i[:].im;
  v[:].im = L[:].*der(i[:].im) + X[:].*i[:].re;

  annotation (Icon(graphics={
        Line(points={{-40,0},{-98,0}},
                                     color={0,0,0}),
        Line(points={{8,58}}, color={0,0,0}),
        Line(points={{96,0},{38,0}}, color={0,0,0}),
        Rectangle(
          extent={{-40,20},{40,-20}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}));
end Inductor;
