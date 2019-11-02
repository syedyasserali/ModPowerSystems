within ModPowerSystems.DynPhasorThreePhase.Basics;
model Resistor
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase.OnePort;

  parameter SI.Resistance R[3] = {1,1,1};

equation
    v[1] = R[1]*i[1];
    v[2] = R[2]*i[2];
    v[3] = R[3]*i[3];
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
