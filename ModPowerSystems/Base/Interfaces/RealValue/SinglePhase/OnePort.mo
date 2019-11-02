within ModPowerSystems.Base.Interfaces.RealValue.SinglePhase;
partial model OnePort
  "Shell model for models with two electrical connectors"

  ModPowerSystems.Base.Interfaces.RealValue.SinglePhase.Pin Pin1
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  ModPowerSystems.Base.Interfaces.RealValue.SinglePhase.Pin Pin2
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

// port voltage and current
  SI.Voltage v "Voltage between Pin1 and Pin2";
  SI.Current i "Current flowing from Pin1 to Pin2";

// port potentials
  SI.Voltage v1 "Voltage at Pin1";
  SI.Voltage v2 "Voltage at Pin2";

// characteristic values
  SI.Voltage vpp "Voltage phase-to-phase";

equation
  v = v1 - v2;
  v1 = Pin1.v;
  v2 = Pin2.v;
  i = Pin1.i;
  i = -Pin2.i;
  vpp = sqrt(3)*v;

  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false, initialScale = 0.1),
        graphics={Text(origin = {-166, -4}, extent = {{74, 24}, {94, 4}}, textString = "+")}),
    Documentation(info="<html>
      <p>The model represents a one port with the following definitions:</p>
      <p><img src=\"modelica://ModPowerSystems/Resources/Images/OnePort.png\"/></p>
      <p>Note, that a one port must meet the port condition: input and output current must be equal.</p>
      </html>"));
end OnePort;
