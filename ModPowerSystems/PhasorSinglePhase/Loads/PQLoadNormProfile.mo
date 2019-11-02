within ModPowerSystems.PhasorSinglePhase.Loads;
model PQLoadNormProfile
  "Constant power load changing according to normalized power profile"
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGroundedInit;

  parameter SI.ActivePower Pnom = 0.5e6 "nominal active power";
  parameter SI.ReactivePower Qnom = 0.5e6 "nominal reactive power";
  parameter String profileFileName = "NoName" "File where matrix is stored"
    annotation (Dialog(
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  parameter String profileName = "NoName" "Table name on file";
  parameter Boolean enableOutputPload = false  annotation (Dialog(group="Data in/out"),choices(checkBox=true));

  SI.ActivePower Pref=Pnom*LoadProfile.y[1] "active power reference";
  SI.ReactivePower Qref=Qnom*LoadProfile.y[1] "reactive power reference";

  Modelica.Blocks.Sources.CombiTimeTable LoadProfile(
    tableOnFile=true,
    tableName=profileName,
    fileName=profileFileName,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic);

  Modelica.Blocks.Interfaces.RealOutput P_loadOut=P if enableOutputPload
  annotation (Placement(transformation(extent={{60,-20},{100,20}}),
      iconTransformation(extent={{46,-20},{76,10}})));

equation
  P = Pref;
  Q = Qref;

annotation (Documentation(info="<html>
<p>
This load model should not be used in transient mode yet.
</p>

</html>"),
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
          lineColor={0,0,0})}),           Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end PQLoadNormProfile;
