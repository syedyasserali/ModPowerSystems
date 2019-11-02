within ModPowerSystems.PhasorSinglePhase.Generation.ModelConstants.SolarGenerators;
record BaseRecord
  // solar generator model parameters
  parameter Real alpha;
  parameter Real beta;
  parameter Real gamma;
  parameter Real R_s "series resistance";
  parameter Real n "ideality factor at the maximum-power point";

  // standard test conditions (STC)
  parameter Real T_0 "rated temperature of sample PV module";
  parameter Real G_0 "irradiance reference";

  // specific module data under STC (from data sheet of BP 580)
  parameter Real V_oc0 "open-circuit voltage under STC";
  parameter Real I_sc0 "short-circuit current under STC";
  parameter Real P_module0 "nominal module power under STC";
  parameter Integer n_s "number of solar cells connected in series";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end BaseRecord;
