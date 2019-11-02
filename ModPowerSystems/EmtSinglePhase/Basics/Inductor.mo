within ModPowerSystems.EmtSinglePhase.Basics;
model Inductor
  extends ModPowerSystems.Base.Interfaces.RealValue.SinglePhase.OnePort;

  parameter SI.Inductance L = 100e-3;

equation
  L*der(i) = v;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Icon(graphics={
        Line(points={{-40,0},{-98,0}},
                                     color={0,0,0}),
        Rectangle(
          extent={{-40,20},{40,-20}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(points={{96,0},{38,0}}, color={0,0,0})}));
end Inductor;
