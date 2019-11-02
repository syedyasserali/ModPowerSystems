within ModPowerSystems.DynPhasorSinglePhase.Connections;
model RxLine
  extends Base.Interfaces.ComplexPhasor.SinglePhase.OnePortInit;

  parameter Real length = 20 "Length of line in km";
  parameter SI.Resistance r = 0.207 "Series Resistance per km";
  parameter SI.Reactance x = 0.121 "Series Reactance per km";

  outer ModPowerSystems.Base.System system;

  // Calculation of line parameters
  SI.Resistance R = r * length;
  SI.Reactance X = x * length;
  SI.Inductance L = X / system.omega;

initial equation
  // steady state initialization
  der(i.re) = 0;
  der(i.im) = 0;

equation
  v.re = L*der(i.re) - X*i.im + R*i.re;
  v.im = L*der(i.im) + X*i.re + R*i.im;

  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}),
      graphics={
        Line(
          points={{100,0},{60,0}},
          color={0,0,0}),
        Text(
          extent={{100,20},{-100,60}},
          textString="%name"),
        Rectangle(
          extent={{-60,20},{60,-20}},
          lineColor={0,0,0}),
        Line(
          points={{-60,0},{-100,0}},
          color={0,0,0})}));
end RxLine;
