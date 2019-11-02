within ModPowerSystems.EmtThreePhase.Basics;
model Resistor
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePort;

  parameter SI.Resistance R[3,3] = {{1,0,0}, {0,1,0}, {0,0,1}};

equation
    v = R*i;
  annotation (Icon(graphics={
        Rectangle(
          extent={{-20,40},{20,-40}},
          lineColor={0,0,0},
          lineThickness=0.5,
          origin={0,0},
          rotation=90),
        Line(points={{-40,0},{-98,0}},
                                     color={0,0,0}),
        Line(points={{8,58}}, color={0,0,0}),
        Line(points={{96,0},{38,0}}, color={0,0,0})}));
end Resistor;
