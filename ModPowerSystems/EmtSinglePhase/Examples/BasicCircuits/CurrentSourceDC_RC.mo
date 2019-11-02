within ModPowerSystems.EmtSinglePhase.Examples.BasicCircuits;
model CurrentSourceDC_RC
  import ModPowerSystems;

  ModPowerSystems.EmtSinglePhase.Basics.Resistor resistor(R=20)
                                                               annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-20,-4})));
  ModPowerSystems.EmtSinglePhase.Basics.Ground ground
    annotation (Placement(transformation(extent={{-30,-40},{-10,-20}})));
  ModPowerSystems.EmtSinglePhase.Basics.Capacitor capacitor(C=0.001)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={14,-4})));
  ModPowerSystems.EmtSinglePhase.Basics.CurrentDC currentDC annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-52,-4})));
equation
  connect(currentDC.Pin1, ground.Pin1)
    annotation (Line(points={{-52,-14},{-52,-20},{-20,-20}}, color={0,0,0}));
  connect(resistor.Pin1, ground.Pin1)
    annotation (Line(points={{-20,-14},{-20,-14},{-20,-20}}, color={0,0,0}));
  connect(capacitor.Pin1, ground.Pin1) annotation (Line(points={{14,-14},{14,
          -14},{14,-20},{-20,-20}}, color={0,0,0}));
  connect(capacitor.Pin2, resistor.Pin2)
    annotation (Line(points={{14,6},{14,10},{-20,10},{-20,6}}, color={0,0,0}));
  connect(currentDC.Pin2, resistor.Pin2) annotation (Line(points={{-52,6},{-52,
          10},{-20,10},{-20,6}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CurrentSourceDC_RC;
