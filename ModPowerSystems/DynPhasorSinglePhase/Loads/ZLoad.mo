within ModPowerSystems.DynPhasorSinglePhase.Loads;
model ZLoad "Constant impedance load"
  extends
    ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGroundedInit;

  parameter SI.ActivePower Pnom = 0.5e6 "active power";
  parameter SI.ReactivePower Qnom = 0.5e6 "reactive power";
  final parameter Complex Z = Complex((Vnom/sqrt(3))^2*(Pnom/3)/((Pnom/3)^2+(Qnom/3)^2),(Vnom/sqrt(3))^2*(Qnom/3)/((Pnom/3)^2+(Qnom/3)^2));

  parameter Boolean enableOutputPload = false  annotation (Dialog(group="Data in/out"),choices(checkBox=true));

  outer ModPowerSystems.Base.System system;

  Modelica.Blocks.Interfaces.RealOutput P_loadOut=Pnom if enableOutputPload
    annotation (Placement(transformation(extent={{60,-20},{100,20}}),
        iconTransformation(extent={{46,-20},{76,10}})));

equation
    v.re = Z.im/system.omega*der(i.re) - Z.im*i.im + Z.re*i.re;
    v.im = Z.im/system.omega*der(i.im) + Z.im*i.re + Z.re*i.im;
  annotation (
  Documentation(info="<html>
<p>
This load model should not be used in transient mode yet.
</p>

</html>"),
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
