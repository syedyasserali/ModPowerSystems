within ModPowerSystems.DynPhasorSinglePhase.Connections;
model PiLine
  extends Base.Interfaces.ComplexPhasor.SinglePhase.TwoPin;

  parameter Real length = 20 "Length of line in km";
  parameter Modelica.SIunits.Resistance r = 0.207 "Series Resistance per km";
  parameter Modelica.SIunits.Reactance x = 0.121 "Series Reactance per km";
  parameter Modelica.SIunits.Susceptance b = 40e-6 "Shunt Susceptance per km";
  parameter Modelica.SIunits.Conductance g = 0.0 "Shunt Conductance per km";
  parameter SI.Power Sr = 1 "rated apparent power";
  parameter Modelica.SIunits.Current Imax=100 "maximal current";

  outer ModPowerSystems.Base.System system;

  // Calculation of line parameters
  Modelica.SIunits.Resistance R = r * length;
  Modelica.SIunits.Reactance X = x * length;
  Modelica.SIunits.Susceptance B = b * length;
  Modelica.SIunits.Conductance G = g * length;
  Modelica.SIunits.Inductance L = X / system.omega;
  Modelica.SIunits.Capacitance C = B / system.omega;

  Modelica.SIunits.ComplexCurrent i_rx;
  Modelica.SIunits.Current Irel = I1/Imax*100;

  SI.Power S1 = 3*V1*I1 "apparent power into the component at P1";
  SI.Power S2 = 3*V2*I2 "apparent power out of the component at P2";
  SI.Power Srel = S2/Sr*100;
  SI.Power Slosses = abs(S1-S2);

initial equation
  //steady init
  //TODO fix this!!!
  //der(T1.i.re) = 0;
  //der(T1.i.im) = 0;
  //der(T1.v.re) = 0;
  //der(T2.v.im) = 0;

equation
  v.re = L*der(i_rx.re) - X*i_rx.im + R*i_rx.re;
  v.im = L*der(i_rx.im) + X*i_rx.re + R*i_rx.im;
  i1.re = i_rx.re + C/2*der(v1.re) - B/2*v1.im + G/2*v1.re;
  i1.im = i_rx.im + C/2*der(v1.im) + B/2*v1.re + G/2*v1.im;
  -i2.re = - i_rx.re + C/2*der(v2.re) - B/2*v2.im + G/2*v2.re;
  -i2.im = - i_rx.im + C/2*der(v2.im) + B/2*v2.re + G/2*v2.im;

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
end PiLine;
