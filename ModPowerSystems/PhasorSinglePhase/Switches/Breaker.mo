within ModPowerSystems.PhasorSinglePhase.Switches;

model Breaker
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortInit;
  parameter SI.Resistance R_on = 1e-4 "resistance closed";
  parameter SI.Resistance R_off = 1e9 "resistance open";
  SI.Resistance R "resistance";
  parameter Boolean is_closed = true;
equation
  if is_closed==true then
    R = R_on;
  else
    R = R_off;
  end if;
      v = R*i;
annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics={  Line(origin = {-56, 0}, points = {{-40, 0}, {40, 0}, {40, 0}}), Line(origin = {58.2222, -0.722222}, points = {{37, 0}, {-47, 0}}), Line(origin = {3, 14}, points = {{-19, -14}, {19, 14}}), Line(origin = {0, 17}, points = {{0, 5}, {0, -5}, {0, -5}})}));
end Breaker;
