within ModPowerSystems.Base.Interfaces.RealValue.SinglePhase;
partial model OnePortGrounded
  "Shell model for models with one electrical connector"

  ModPowerSystems.Base.Interfaces.RealValue.SinglePhase.Pin Pin1
    annotation (Placement(transformation(extent={{-10,110},{10,90}})));

  // port voltage and current
  SI.Voltage v;
  SI.Current i;

  // characteristic values
  SI.Voltage vpp "Voltage phase-to-phase";

equation
  v = Pin1.v;
  i = Pin1.i;
  vpp = sqrt(3)*v;

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
