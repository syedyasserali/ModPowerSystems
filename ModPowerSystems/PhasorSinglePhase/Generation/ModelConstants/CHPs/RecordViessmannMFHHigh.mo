within ModPowerSystems.PhasorSinglePhase.Generation.ModelConstants.CHPs;
record RecordViessmannMFHHigh
 extends
    ModPowerSystems.PhasorSinglePhase.Generation.ModelConstants.CHPs.BaseRecord(
  final Pr = 62e3,
  final eff_el = 0.32,
  final eff_th = 0.63,
  final C_th = 23.333e3);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Extracted from datasheet of the Viessman Vitobloc 200 [1].</p>
<p>References</p>
<p>[1] Viessmann Vitobloc 200. http://www:viessmann:de/de/wohngebaeude/kraft-waerme-kopplung/blockheizkraftwerk/vitobloc-200-em-6-15:html. Accessed: 2016-10-03</p>
</html>"));
end RecordViessmannMFHHigh;
