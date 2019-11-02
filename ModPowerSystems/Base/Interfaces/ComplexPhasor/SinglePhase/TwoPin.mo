within ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase;
partial model TwoPin
  "Shell model for models with two electrical connectors "

  ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.Pin Pin1
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.Pin Pin2
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

// two pin potentials and currents
  SI.ComplexVoltage v "Voltage between Pin1 and Pin2";
  SI.ComplexCurrent i "Difference between input and output current";
  SI.ComplexVoltage v1 "Voltage at Pin1";
  SI.ComplexVoltage v2 "Voltage at Pin2";
  SI.ComplexCurrent i1 "Current flowing into the component at Pin1";
  SI.ComplexCurrent i2 "Current flowing out of the component at Pin2";

// characteristic values
  SI.Voltage V "Voltage RMS phase-to-neutral";
  SI.Voltage Vpp "Voltage RMS phase-to-phase";
  SI.Voltage V1 "Voltage RMS phase-to-neutral at Pin1";
  SI.Voltage V2 "Voltage RMS phase-to-neutral at Pin2";
  SI.Current I "Current RMS";
  SI.Current I1 "Current RMS into the component at Pin1";
  SI.Current I2 "Current RMS out of the component at Pin2";
  SI.Angle Vangle "Voltage phase";
  SI.Angle Iangle "Current phase";

equation
  v = v1 - v2;
  i = i1 - i2;
  v1 = Pin1.v;
  v2 = Pin2.v;
  i1 = Pin1.i;
  i2 = -Pin2.i;
  V = 'abs'(v);
  Vpp = sqrt(3)*'abs'(v);
  V1 = 'abs'(v1);
  V2 = 'abs'(v2);
  I = 'abs'(i);
  I1 = 'abs'(i1);
  I2 = 'abs'(i2);
  Vangle = arg(v);
  Iangle = arg(i);

  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false, initialScale = 0.1),
        graphics={Text(origin = {-168, -4}, extent = {{74, 24}, {94, 4}}, textString = "+")}),
    Documentation(info="<html>
      <p>The model provides a shell for components with two connection pins using the following definitions:</p>
      <p><img src=\"modelica://ModPowerSystems/Resources/Images/TwoPin.png\"/></p>
      <p>In comparison to a one port, I1 and I2 do not have to be the same.</p>
      </html>"));
end TwoPin;
