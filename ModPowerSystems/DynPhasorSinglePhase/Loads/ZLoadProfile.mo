within ModPowerSystems.DynPhasorSinglePhase.Loads;
model ZLoadProfile
  "Constant impedance load changing according to normalized profile"
  extends
    ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGrounded;

  parameter String profileFileName = "NoName" "File where matrix is stored"
    annotation (Dialog(
      loadSelector(filter="Text files (*.txt);;MATLAB MAT-files (*.mat)",
          caption="Open file in which table is present")));
  parameter String profileName = "NoName" "Table name on file";

  parameter SI.ActivePower Pnom = 5e6 "active power";
  parameter SI.ReactivePower Qnom = 2.5e6 "reactive power";

  parameter Modelica.Blocks.Types.Smoothness smoothnessSetting=Modelica.Blocks.Types.Smoothness.LinearSegments
    "Smoothness of table interpolation";

  SI.ActivePower Pref=Pnom*LoadProfile.y[1] "active power reference";
  SI.ReactivePower Qref=Qnom*LoadProfile.y[1] "reactive power reference";
  Complex Z "Impedance";

   Modelica.Blocks.Sources.CombiTimeTable LoadProfile(
    tableOnFile=true,
    tableName=profileName,
    fileName=profileFileName,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    smoothness= smoothnessSetting);

    parameter Boolean enableOutputPload = false  annotation (Dialog(group="Data in/out"),choices(checkBox=true));

  outer ModPowerSystems.Base.System system;

  Modelica.Blocks.Interfaces.RealOutput P_loadOut=Pnom if enableOutputPload
    annotation (Placement(transformation(extent={{60,-20},{100,20}}),
        iconTransformation(extent={{46,-20},{76,10}})));

equation
  Z = Complex((Vnom/sqrt(3))^2*(Pref/3)/((Pref/3)^2+(Qref/3)^2),(Vnom/sqrt(3))^2*(Qref/3)/((Pref/3)^2+(Qref/3)^2));
  v.re = Z.im/system.omega*der(i.re) - Z.im*i.im + Z.re*i.re;
  v.im = Z.im/system.omega*der(i.im) + Z.im*i.re + Z.re*i.im;
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
end ZLoadProfile;
