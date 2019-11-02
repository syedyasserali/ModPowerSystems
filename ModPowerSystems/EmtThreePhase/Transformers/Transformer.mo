within ModPowerSystems.EmtThreePhase.Transformers;
model Transformer
  //extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePort;

  parameter SI.Voltage Vnom1 = 110e3 "primary voltage level";
  parameter SI.Voltage Vnom2 = 20e3 "secondary voltage level";
  parameter SI.Power Sr = 80e6 "rated apparent power";
  parameter Real URr = 0.31 "copper losses";
  parameter Real Ukr = 12.04 "short circuit voltage";

  final parameter Real ratio = Vnom1/Vnom2 "Tap Ratio";
  final parameter SI.Impedance Z = Ukr*Vnom1^2/(Sr*100);
  final parameter SI.Resistance R = URr*Vnom1^2/(Sr*100);
  final parameter SI.Reactance X = sqrt(Z^2-R^2);

  final parameter SI.Resistance[3,3] Rmat = {{R,0,0}, {0,R,0}, {0,0,R}};
  final parameter SI.Reactance[3,3] Xmat = {{X,0,0}, {0,X,0}, {0,0,X}};

  ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.Plug Plug1
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.Plug Plug2
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

  Connections.RxLine rxLine
    annotation (Placement(transformation(extent={{-60,-20},{-20,20}})));
  IdealTransformer idealTransformer(Vnom1=Vnom1, Vnom2=Vnom2, ratio=ratio)
    annotation (Placement(transformation(extent={{20,-20},{60,20}})));
equation

  connect(idealTransformer.Plug2, Plug2)
    annotation (Line(points={{60,0},{100,0},{100,0}}, color={0,0,0}));
  connect(idealTransformer.Plug1, rxLine.Plug2)
    annotation (Line(points={{20,0},{0,0},{-20,0}}, color={0,0,0}));
  connect(rxLine.Plug1, Plug1)
    annotation (Line(points={{-60,0},{-80,0},{-100,0}}, color={0,0,0}));
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
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
end Transformer;
