within ModPowerSystems.EmtThreePhase.Loads;
model ZLoad "constant impedance load"
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePortGrounded;
  outer ModPowerSystems.Base.System system;

  constant SI.Angle[3] phaseShift = (0:2)*2*pi/3 "phase shift";

  parameter Modelica.SIunits.ActivePower[3] Pnom = {0.5e6, 0.5e6, 0.5e6} "active power per phase";
  parameter Modelica.SIunits.ReactivePower[3] Qnom = {0.5e6, 0.5e6, 0.5e6} "reactive power per phase";
  SI.Resistance[3,3] R = {{(Vnom/sqrt(3))^2*Pnom[1]/((Pnom[1])^2+(Qnom[1])^2),0,0}, {0, (Vnom/sqrt(3))^2*Pnom[2]/((Pnom[2])^2+(Qnom[2])^2), 0},{0, 0, (Vnom/sqrt(3))^2*Pnom[3]/((Pnom[3])^2+(Qnom[3])^2)}};
  SI.Inductance L[3,3] = {{(Vnom/sqrt(3))^2*Qnom[1]/((Pnom[1])^2+(Qnom[1])^2)/ system.omega, 0, 0},{0, (Vnom/sqrt(3))^2*Qnom[2]/((Pnom[2])^2+(Qnom[2])^2)/ system.omega, 0}, {0, 0, (Vnom/sqrt(3))^2*Qnom[3]/((Pnom[3])^2+(Qnom[3])^2)/ system.omega}} ;
  Modelica.SIunits.Angle PhiNom = acos(Pnom[1]/sqrt(Pnom[1]^2+Qnom[1]^2))
    "nominal phase angle";
equation
    v = R*i + L*der(i);

  annotation (
    Placement(
      transformation(
        extent={{-10,110},{10,90}})),
   Icon(
     coordinateSystem(
        preserveAspectRatio=false, initialScale = 0.1),
      graphics={Line(points = {{0, 100}, {0, 20}}), Polygon(fillPattern = FillPattern.Sphere, points = {{0, -40}, {-20, 20}, {20, 20}, {0, -40}}), Text(extent = {{-100, -100}, {100, -60}}, textString = "%name")}));
end ZLoad;
