within ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase;
partial model OnePort
  "Shell model for models with two electrical connectors "

  ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.Pin Pin1
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.Pin Pin2
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

// port voltage and current
  SI.ComplexVoltage v "Voltage between Pin1 and Pin2";
  SI.ComplexCurrent i "Current flowing from Pin1 to Pin2";
  SI.ComplexVoltage v1 "Voltage at Pin1";
  SI.ComplexVoltage v2 "Voltage at Pin2";

// characteristic values
  SI.ActivePower P "Consumed Active Power";
  SI.ReactivePower Q "Reactive Power";
  SI.Voltage V "Voltage RMS phase-to-neutral";
  SI.Voltage V1 "Voltage RMS phase-to-neutral at Pin1";
  SI.Voltage V2 "Voltage RMS phase-to-neutral at Pin2";
  SI.Voltage Vpp "Voltage RMS phase-to-phase";
  SI.Current I "Current RMS";
  SI.Angle Vangle "Voltage phase";
  SI.Angle Iangle "Current phase";

equation
  v = v1 - v2;
  v1 = Pin1.v;
  v2 = Pin2.v;
  i = Pin1.i;
  i = -Pin2.i;
  V = 'abs'(v);
  Vpp = sqrt(3)*'abs'(v);
  V1 = 'abs'(v1);
  V2 = 'abs'(v2);
  I = 'abs'(i);
  P = 3*real(v*conj(i));
  Q = 3*imag(v*conj(i));
  Vangle = arg(v);
  Iangle = arg(i);

  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false, initialScale = 0.1), graphics={Text(origin = {-166, -4}, extent = {{74, 24}, {94, 4}}, textString = "+")}),      Documentation(info="<html>
<p>The model represents a one port with the following definitions:</p>
<p><img src=\"modelica://ModPowerSystems/Resources/Images/OnePort.png\"/></p>
<p>Note, that a one port must meet the port condition: input and output current must be equal.</p>
</html>"));
end OnePort;
