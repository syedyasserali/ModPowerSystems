within ModPowerSystems.EmtSinglePhase.Basics;
model Resistor
  extends ModPowerSystems.Base.Interfaces.RealValue.SinglePhase.OnePort;

  parameter SI.Resistance R = 1;

equation
    v = R*i;
  annotation (Icon(graphics={
        Rectangle(
          extent={{-20,40},{20,-40}},
          lineColor={0,0,0},
          lineThickness=0.5,
          origin={0,0},
          rotation=270),
        Line(points={{8,58}}, color={0,0,0}),
        Line(points={{40,0},{100,0}},color={0,0,0}),
        Line(points={{-54,-34}}, color={0,0,0}),
        Line(points={{-100,0},{-40,0}},
        color={0,0,0})}));
end Resistor;
