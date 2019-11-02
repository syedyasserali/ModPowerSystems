within ModPowerSystems.DynPhasorSinglePhase.Basics;
model VoltageSource "infinite power source"
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePort;

  parameter SI.Voltage Vnom = 10 "Voltage phase-to-neutral RMS amplitude";
  parameter SI.Angle phiV = 0 "Initial Voltage Angle";

equation
  v = Complex(Vnom*cos(phiV), Vnom*sin(phiV));

  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={                                Ellipse(extent={{
              40,40},{-40,-40}}, lineColor={0,0,0},
          origin={0,0},
          rotation=360),
        Text(
          extent={{38,-32},{-38,32}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          textString="~",
          origin={0,0},
          rotation=360),
        Line(points={{-100,0},{-40,0}}, color={0,0,0}),
        Line(points={{40,0},{100,0}}, color={0,0,0})}),
                                   Diagram(coordinateSystem(preserveAspectRatio=
           false, extent={{-100,-100},{100,100}})));
end VoltageSource;
