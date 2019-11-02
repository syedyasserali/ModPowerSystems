within ModPowerSystems.PhasorSinglePhase.Generation;

model PVNode
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGroundedInit;

  parameter SI.ActivePower Pgen = 0e6 "active power";
  parameter SI.Voltage Vabs = Vnom "voltage magnitude phase-to-phase";


equation
    -Pgen/3 = real(v*conj(i));
    Vpp = Vabs;

  annotation (
    Placement(
      transformation(
        extent={{-10,110},{10,90}})),
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Line(points = {{0, 100}, {0, 50}}), Ellipse(extent = {{-50, 50}, {50, -50}}, endAngle = 360), Text(extent = {{-100, -100}, {100, -60}}, textString = "%name"), Text(extent = {{-30, 30}, {30, -30}}, textString = "PV")}),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end PVNode;
