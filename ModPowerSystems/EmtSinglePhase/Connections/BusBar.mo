within ModPowerSystems.EmtSinglePhase.Connections;
model BusBar
  extends ModPowerSystems.Base.Interfaces.RealValue.SinglePhase.OnePortGrounded;

  Real vrel "voltage relative to nominal voltage";

equation
  vrel = vpp/Vnom;
  i = Complex(0, 0);

 annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,0},{100,200}},
        grid={2,2}),
      graphics={
        Text(
          extent={{0,120},{-100,160}},
          textString = "%name"),
        Rectangle(
          extent={{-80,110},{80,90}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(extent={{-100,
            0},{100,200}})));
end BusBar;
