within ModPowerSystems.PhasorSinglePhase.Loads;
model ZLoadSinus "Sinusoidal impedance load"
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGroundedInit;

  parameter SI.ActivePower Pnom = 5e6 "active power";
  parameter SI.ReactivePower Qnom = 2.5e6 "reactive power";
  parameter Real f = 1/3600 "frequency of sinusoidal oscillation";

  SI.ActivePower Pref "active power reference";
  SI.ReactivePower Qref "reactive power reference";
  Complex Z "Impedance";

equation
  Pref = Pnom*cos(2*pi*f*time);
  Qref = Qnom*cos(2*pi*f*time);
  Z = Complex((Vnom/sqrt(3))^2*(Pref/3)/((Pref/3)^2+(Qref/3)^2),(Vnom/sqrt(3))^2*(Qref/3)/((Pref/3)^2+(Qref/3)^2));
  v = Z*i;

  annotation (
    Placement(
      transformation(
        extent={{-10,110},{10,90}})),
   Icon(
     coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}),
      graphics={
        Line(
          points={{0,100},{0,20}},
          color={0,0,0}),
        Polygon(
          points={{0,-40},{-20,20},{20,20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Text(
          extent={{-100,-100},{100,-60}},
          textString="%name",
          lineColor={0,0,0})}));
end ZLoadSinus;
