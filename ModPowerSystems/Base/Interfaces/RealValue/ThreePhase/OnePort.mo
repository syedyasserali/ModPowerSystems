within ModPowerSystems.Base.Interfaces.RealValue.ThreePhase;
partial model OnePort
  "Shell model for models with two electrical three-phase connectors"

  ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.Plug Plug1
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.Plug Plug2
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

// port voltage and current
  SI.Voltage v[3] "Voltage between Plug1 and Plug2";
  SI.Current i[3] "Current flowing from Plug1 to Plug2";

// port potentials
  SI.Voltage v1[3];
  SI.Voltage v2[3];

equation
  v[:] = v1[:] - v2[:];
  v1[:] = Plug1.Pins[:].v;
  v2[:] = Plug2.Pins[:].v;
  i[:] = Plug1.Pins[:].i;
  i[:] = -Plug2.Pins[:].i;
  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false, initialScale = 0.1),
        graphics={Text(origin = {-168, -4}, extent = {{74, 24}, {94, 4}}, textString = "+")}),
    Documentation(info="<html>
      <p>The model represents a one port with the following definitions:</p>
      <p><img src=\"modelica://ModPowerSystems/Resources/Images/OnePort.png\"/></p>
      <p>Note, that a one port must meet the port condition: input and output current must be equal.</p>
      </html>"));
end OnePort;
