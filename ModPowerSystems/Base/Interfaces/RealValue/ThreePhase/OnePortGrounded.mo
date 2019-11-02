within ModPowerSystems.Base.Interfaces.RealValue.ThreePhase;
partial model OnePortGrounded
  "Shell model for models with one electrical three-phase connector"

  parameter SI.Voltage Vnom = 110e3 "Nominal phase-to-phase RMS voltage";

  ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.Plug Plug1
    annotation (Placement(transformation(extent={{-10,110},{10,90}})));

  // port voltage and current
  SI.Voltage v[3];
  SI.Current i[3];

  // characteristic values
  SI.Voltage V[3] "Voltage phase-to-neutral";
  SI.Current I[3] "Current";

equation
  v[:] = Plug1.Pins[:].v;
  i[:] = Plug1.Pins[:].i;
  V[:] = abs(v[:]);
  I[:] = abs(i[:]);

  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
      <p>The model represents a one port where the second pin is connected to the ground:</p>
      <p><img src=\"modelica://ModPowerSystems/Resources/Images/OnePortGrounded.png\"/></p>
      <p>Note, that, due to the fact that the second pin does not provide any additional information 
      (voltage is zero and current the same as flowing into the port), it is not included in the model.</p>
      </html>"));
end OnePortGrounded;
