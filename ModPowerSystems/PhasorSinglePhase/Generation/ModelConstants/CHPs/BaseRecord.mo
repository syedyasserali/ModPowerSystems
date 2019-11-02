within ModPowerSystems.PhasorSinglePhase.Generation.ModelConstants.CHPs;
record BaseRecord
  // chp model parameters
  parameter SI.Power Pr "rated power of combustion engine [W]";
  parameter Real eff_el "electrical efficiency";
  parameter Real eff_th "thermal efficiency";
  parameter Real C_th "capacity of attached thermal storage [Wh]";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end BaseRecord;
