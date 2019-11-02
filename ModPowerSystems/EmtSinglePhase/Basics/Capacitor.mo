within ModPowerSystems.EmtSinglePhase.Basics;
model Capacitor
  extends ModPowerSystems.Base.Interfaces.RealValue.SinglePhase.OnePort;

  parameter SI.Capacitance C = 1e-6;

initial equation
  // use this only if the simulation should start with a transient
  //v = 0;

equation
  C*der(v) = i;

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
