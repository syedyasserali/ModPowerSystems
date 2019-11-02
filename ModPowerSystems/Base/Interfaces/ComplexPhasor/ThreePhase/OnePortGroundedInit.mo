within ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase;
partial model OnePortGroundedInit
  "Shell model for models with one electrical connector "

  parameter SI.Voltage Vnom = 100e3 "nominal voltage level";

  ModPowerSystems.Base.Interfaces.ComplexPhasor.ThreePhase.Plug Plug1
    annotation (Placement(transformation(extent={{-10,110},{10,90}})));

  // port voltage and current
  SI.ComplexVoltage v[3] "Voltage between Plug1";
  SI.ComplexCurrent i[3] "Current flowing from Plug1";

  // characteristic values
  SI.ActivePower P[3] "Consumed Active Power";
  SI.ReactivePower Q[3] "Reactive Power";
  SI.Voltage V[3] "Voltage RMS phase-to-neutral";
  SI.Voltage Vpp[3] "Voltage RMS phase-to-phase";
  SI.Current I[3] "Current RMS";
  SI.Angle Vangle[3] "Voltage phase";
  SI.Angle Iangle[3] "Current phase";
  SI.Angle phi[3] "Phase shift between voltage and current";

equation
  v[:] = Plug1.Pins[:].v;
  i[:] = Plug1.Pins[:].i;
  V[:] = 'abs'(v[:]);
  Vpp[:] = sqrt(3)*'abs'(v[:]);
  I[:] = 'abs'(i[:]);
  P[:] = 3*real(v[:].*conj(i[:]));
  Q[:] = 3*imag(v[:].*conj(i[:]));
  Vangle[:] = arg(v[:]);
  Iangle[:] = arg(i[:]);
  phi[:] = Vangle[:]-Iangle[:];

  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
      <p>The model represents a one port where the second pin is connected to the ground:</p>
      <p><img src=\"modelica://ModPowerSystems/Resources/Images/OnePortGrounded.png\"/></p>
      <p>Note that, due to the fact that the second pin does not provide any additional information (voltage is zero and current the same as flowing into the port), it is not included in the model.</p>
      </html>"));
end OnePortGroundedInit;
