within ModPowerSystems.PhasorSinglePhase.Loads;
model ZLoad "Constant impedance load"
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGroundedInit;

  parameter SI.ActivePower Pnom = 5e6 "active power";
  parameter SI.ReactivePower Qnom = 2.5e6 "reactive power";
  final parameter Complex Z = Complex((Vnom/sqrt(3))^2*(Pnom/3)/((Pnom/3)^2+(Qnom/3)^2),(Vnom/sqrt(3))^2*(Qnom/3)/((Pnom/3)^2+(Qnom/3)^2));


equation
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
          extent={{100,-100},{-100,-60}},
          textString = "%name")}));
end ZLoad;
