within ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase;
partial model TwoPin
  "Shell model for models with two electrical connectors "

  ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase.Plug Plug1
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase.Plug Plug2
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

// two pin potentials and currents
  SI.ComplexVoltage v[3] "Voltage between Plug1 and Plug2";
  SI.ComplexCurrent i[3] "Difference between input and output current";
  SI.ComplexVoltage v1[3] "Voltage at Plug1";
  SI.ComplexVoltage v2[3] "Voltage at Plug2";
  SI.ComplexCurrent i1[3] "Current flowing into the component at Plug1";
  SI.ComplexCurrent i2[3] "Current flowing out of the component at Plug2";

// characteristic values
  SI.Voltage V[3] "Voltage RMS phase-to-neutral";
  SI.Current I[3] "Current RMS";

equation
  v[:] = v1[:] - v2[:];
  i[:] = i1[:] - i2[:];
  v1[:] = Plug1.Pins[:].v;
  v2 = Plug2.Pins[:].v;
  i1 = Plug1.Pins[:].i;
  i2[:].re = -Plug2.Pins[:].i.re;
  i2[:].im = -Plug2.Pins[:].i.im;
  V[:] = 'abs'(v[:]);
  I[:] = 'abs'(i[:]);

  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false, initialScale = 0.1), graphics={Text(origin = {-166, -4}, extent = {{74, 24}, {94, 4}}, textString = "+")}),      Documentation(info="<html>
<p>The model provides a shell for components with two connection pins using the following definitions:</p>
<p><img src=\"modelica://ModPowerSystems/../Documentation/figs/TwoPin.png\"/></p>
<p>In comparison to a one port, I1 and I2 do not have to be the same.</p>
</html>"));
end TwoPin;
