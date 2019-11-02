within ModPowerSystems.PhasorThreePhase.Connections;
model RxLine
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase.OnePortInit;

  parameter Real length = 20 "Length of line in km";
  parameter SI.Resistance[3,3] r = {{0.207,0,0},{0,0.207,0},{0,0,0.207}} "Series Resistance per km";
  parameter SI.Reactance[3,3] x = {{0.121,0,0},{0,0.121,0},{0,0,0.121}} "Series Reactance per km";

  outer ModPowerSystems.Base.System system;

  // Calculation of line parameters
  SI.Resistance[3,3] R;
  SI.Reactance[3,3] X;
  SI.Inductance[3,3] L;

equation
  R = r*length;
  X = x*length;
  L = X/system.omega;

  v[:] = Complex(R,X)*i[:];

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
