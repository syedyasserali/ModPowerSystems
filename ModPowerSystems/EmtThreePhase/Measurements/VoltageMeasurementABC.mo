within ModPowerSystems.EmtThreePhase.Measurements;
model VoltageMeasurementABC
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePortGrounded;

  Modelica.Blocks.Interfaces.RealOutput v_abc[3] annotation (
    Placement(visible = true, transformation(origin = {106, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {52, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  v_abc = v[:];
  i = zeros(3);

  annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics={  Rectangle(origin = {2, 90}, rotation = -90, extent = {{-36, 12}, {20, -16}}), Line(origin = {12.7846, 100.413}, points = {{0, 0}, {30, 0}})}));
end VoltageMeasurementABC;
