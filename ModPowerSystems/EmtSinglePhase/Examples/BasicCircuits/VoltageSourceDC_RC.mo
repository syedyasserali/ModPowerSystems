within ModPowerSystems.EmtSinglePhase.Examples.BasicCircuits;
model VoltageSourceDC_RC
  import ModPowerSystems;

  ModPowerSystems.EmtSinglePhase.Basics.Resistor resistor(R=1) annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-4,16})));
  ModPowerSystems.EmtSinglePhase.Basics.Ground ground
    annotation (Placement(transformation(extent={{-62,-36},{-42,-16}})));
  ModPowerSystems.EmtSinglePhase.Basics.Ground ground3
    annotation (Placement(transformation(extent={{4,-38},{24,-18}})));
  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ModPowerSystems.EmtSinglePhase.Basics.Capacitor capacitor(C=0.001)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={14,6})));
  ModPowerSystems.EmtSinglePhase.Basics.VoltageDC voltageDC
    annotation (Placement(transformation(extent={{-42,6},{-22,26}})));
equation
  connect(ground3.Pin1, capacitor.Pin1)
    annotation (Line(points={{14,-18},{14,-18},{14,-4}}, color={0,0,0}));
  connect(resistor.Pin1, capacitor.Pin2)
    annotation (Line(points={{6,16},{14,16}}, color={0,0,0}));
  connect(resistor.Pin2, voltageDC.Pin2)
    annotation (Line(points={{-14,16},{-22,16}}, color={0,0,0}));
  connect(ground.Pin1, voltageDC.Pin1) annotation (Line(points={{-52,-16},{-52,
          -16},{-52,16},{-42,16}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end VoltageSourceDC_RC;
