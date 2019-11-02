within ModPowerSystems.Base.Interfaces.RealValue.SinglePhase;
partial model TwoPin
  "Shell model for models with two electrical connectors "

  ModPowerSystems.Base.Interfaces.RealValue.SinglePhase.Pin Pin1
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  ModPowerSystems.Base.Interfaces.RealValue.SinglePhase.Pin Pin2
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

// two pin potentials and currents
  SI.Voltage v "Voltage between Pin1 and Pin2";
  SI.Current i "Difference between input and output current";
  SI.Voltage v1 "Voltage at Pin1";
  SI.Voltage v2 "Voltage at Pin2";
  SI.Current i1 "Current flowing into the component at Pin1";
  SI.Current i2 "Current flowing out of the component at Pin2";

equation
  v = v1 - v2;
  i = i1 - i2;
  v1 = Pin1.v;
  v2 = Pin2.v;
  i1 = Pin1.i;
  i2 = -Pin2.i;

  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false, initialScale = 0.1), graphics={Text(origin = {-166, -4}, extent = {{74, 24}, {94, 4}}, textString = "+")}),      Documentation(info="<html>
<p>The model provides a shell for components with two connection pins using the following definitions:</p>
<p><img src=\"modelica://ModPowerSystems/Resources/Images/TwoPin.png\"/></p>
<p>In comparison to a one port, I1 and I2 do not have to be the same.</p>
</html>"));
end TwoPin;
