within ModPowerSystems.PhasorSinglePhase.Transformers;
model IdealTransformer
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.TwoPin;

  parameter SI.Voltage Vnom1 "primary voltage level";
  parameter SI.Voltage Vnom2 "secondary voltage level";
  Real ratio = Vnom1/Vnom2 "Tap Ratio";

equation
  v2 = (1/ratio)*v1;
  i2 = ratio*i1;

  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}),
      graphics={
        Ellipse(extent={{-70,40},{12,-40}}, lineColor={0,0,0}),
        Ellipse(extent={{-12,40},{70,-40}}, lineColor={0,0,0}),
        Line(points={{70,0},{100,0}}, color={0,0,0}),
        Line(points={{-100,0},{-70,0}}, color={0,0,0}),
        Text(extent={{-60,80},{60,40}}, textString="%name"),
        Text(extent={{-10,-78},{-50,-38}}, textString="n"),
        Text(extent={{20,-76},{-20,-36}}, textString=":"),
        Text(extent={{50,-76},{10,-36}}, textString="1")}), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics));
end IdealTransformer;
