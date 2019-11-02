within ModPowerSystems.PhasorSinglePhase.Loads;
model PQLoad "Constant power load"
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGroundedInit;

  parameter SI.ActivePower Pnom = 0.5e6 "active power";
  parameter SI.ReactivePower Qnom = 0.5e6 "reactive power";
  parameter Boolean is_connected = true;

  parameter Boolean enableOutputPload = false  annotation (Dialog(group="Data in/out"),choices(checkBox=true));

  outer ModPowerSystems.Base.System system;

  Modelica.Blocks.Interfaces.RealOutput P_loadOut=Pnom if enableOutputPload
    annotation (Placement(transformation(extent={{60,-20},{100,20}}),
        iconTransformation(extent={{46,-20},{76,10}})));

equation
    if is_connected==true then
      Pnom/3 = real(v*conj(i));
      Qnom/3 = imag(v*conj(i));
    else
      0 = real(v*conj(i));
      0 = imag(v*conj(i));
    end if;


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
end PQLoad;
