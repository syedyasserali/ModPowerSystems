within ModPowerSystems.EmtThreePhase.Basics;
model Capacitor
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePort;

  parameter SI.Capacitance C[3,3] = {{1e-6,0,0}, {0,1e-6,0}, {0,0,1e-6}};

initial equation
  // use this only if the simulation should start with a transient
  //v[:] = zeros(3);

equation
    i = C*der(v);
  annotation (Icon(graphics={
        Line(points={{-10,0},{-98,0}},
                                     color={0,0,0}),
        Line(points={{8,58}}, color={0,0,0}),
        Line(points={{96,0},{10,0}}, color={0,0,0}),
        Line(points={{-10,30},{-10,-32}}, color={0,0,0}),
        Line(points={{10,30},{10,-32}}, color={0,0,0})}));
end Capacitor;
