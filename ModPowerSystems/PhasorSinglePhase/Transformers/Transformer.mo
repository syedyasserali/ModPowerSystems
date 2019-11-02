within ModPowerSystems.PhasorSinglePhase.Transformers;
model Transformer
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.TwoPin;

  parameter SI.Voltage Vnom1 = 110e3 "primary voltage level";
  parameter SI.Voltage Vnom2 = 20e3 "secondary voltage level";
  parameter SI.Power Sr = 80e6 "rated apparent power";
  parameter Real URr = 0.31 "copper losses";
  parameter Real Ukr = 12.04 "short circuit voltage";
  parameter Real TapPos = 0 "tap changer position";
  parameter Real TapStep = 0.1 "tap changer step in % of primary voltage level";
    
  final parameter Real ratio = (Vnom1+TapPos*TapStep/100*Vnom1)/Vnom2 "ratio considering tap changer position";
  final parameter SI.Impedance Z = Ukr*Vnom1^2/(Sr*100);
  final parameter SI.Resistance R = URr*Vnom1^2/(Sr*100);
  final parameter SI.Reactance X = sqrt(Z^2-R^2);

  SI.Power S1 = 3*V1*I1 "apparent power into the component at P1";
  SI.Power S2 = 3*V2*I2 "apparent power out of the component at Pin2";
  SI.Power Srel1 = S1/Sr*100;
  SI.Power Srel2 = S2/Sr*100;

  IdealTransformer Tr(
    Vnom1=ratio*Vnom2,
    Vnom2=Vnom2,
    ratio=ratio) annotation (Placement(transformation(extent={{20,-20},{60,20}})));
  Connections.RxLine Imp(
    Vnom=Vnom1,
    r=R,
    x=X,
    length=1)
    annotation (Placement(transformation(extent={{-60,-20},{-20,20}})));

equation
  connect(Imp.Pin1, Pin1) annotation (Line(points={{-60,0},{-100,0}}));
  connect(Imp.Pin2, Tr.Pin1) annotation (Line(points={{-20,0},{20,0}}));
  connect(Tr.Pin2, Pin2) annotation (Line(points={{60,0},{100,0}}));

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
end Transformer;
