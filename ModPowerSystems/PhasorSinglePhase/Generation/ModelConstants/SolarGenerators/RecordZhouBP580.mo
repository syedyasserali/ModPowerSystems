within ModPowerSystems.PhasorSinglePhase.Generation.ModelConstants.SolarGenerators;
record RecordZhouBP580
 extends
    ModPowerSystems.PhasorSinglePhase.Generation.ModelConstants.SolarGenerators.BaseRecord(
    final alpha = 1.21,
    final beta = 0.058,
    final gamma = 1.15,
    final R_s = 0.012,
    final n = 1.17,
    final T_0 = 298.15,
    final G_0 = 1000,
    final V_oc0 = 22.0,
    final I_sc0 = 4.7,
    final P_module0 = 80,
    final n_s = 36);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Values extracted from [1] and [2].</p>
<p>References</p>
<p>[1] W. Zhou, H. Yang, and Z. Fang, &ldquo;A novel model for photovoltaic array performance prediction,&rdquo; Applied Energy, vol. 84, no. 12, pp. 1187&ndash;1198, 2007.</p>
<p>[2] BP Solar, &ldquo;Datasheet BP 585 and BP580,&rdquo; 2003.</p>
</html>"));
end RecordZhouBP580;
