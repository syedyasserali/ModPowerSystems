within ModPowerSystems.EmtThreePhase.Loads;

model Controllableload1

  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePortGrounded;


  constant SI.Angle[3] phaseShift = (0:2)*2*pi/3 "phase shift";
  Modelica.Blocks.Interfaces.RealInput Pnom annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 54}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  parameter Modelica.SIunits.ReactivePower Qnom = 2.5e6
    "reactive power per phase";
  SI.Resistance R = Vnom^2*Pnom/(Pnom^2+Qnom^2);
  SI.Inductance L = Vnom^2*Qnom/(Pnom^2+Qnom^2) / system.omega;
  Modelica.SIunits.Angle PhiNom = acos(Pnom/sqrt(Pnom^2+Qnom^2))
    "nominal phase angle";

  outer ModPowerSystems.Base.System system;

equation
    v = R*i + L*der(i);

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
          textString = "%Pnom+j%Qnom")}));
end Controllableload1;
