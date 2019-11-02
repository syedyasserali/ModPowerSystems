within ModPowerSystems.PhasorThreePhase.Examples.BasicCircuits;
model VoltageSource_RLC

  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ModPowerSystems.PhasorThreePhase.Basics.VoltageSource voltageSource
    annotation (Placement(transformation(extent={{-42,6},{-22,26}})));
  ModPowerSystems.PhasorThreePhase.Basics.Resistor resistor annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-8,0})));
  ModPowerSystems.PhasorThreePhase.Basics.Ground ground
    annotation (Placement(transformation(extent={{-62,-36},{-42,-16}})));
  ModPowerSystems.PhasorThreePhase.Basics.Capacitor capacitor annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={34,0})));
  ModPowerSystems.PhasorThreePhase.Basics.Ground ground2
    annotation (Placement(transformation(extent={{24,-38},{44,-18}})));
  ModPowerSystems.PhasorThreePhase.Basics.Ground ground1
    annotation (Placement(transformation(extent={{-18,-38},{2,-18}})));
  ModPowerSystems.PhasorThreePhase.Basics.Inductor inductor annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={14,0})));
  ModPowerSystems.PhasorThreePhase.Basics.Ground ground3
    annotation (Placement(transformation(extent={{4,-38},{24,-18}})));
equation
  connect(voltageSource.Plug1, ground.Plug1)
    annotation (Line(points={{-42,16},{-52,16},{-52,-16}}, color={0,0,0}));
  connect(inductor.Plug1, ground3.Plug1)
    annotation (Line(points={{14,-10},{14,-10},{14,-18}}, color={0,0,0}));
  connect(resistor.Plug1, ground1.Plug1)
    annotation (Line(points={{-8,-10},{-8,-14},{-8,-18}}, color={0,0,0}));
  connect(capacitor.Plug1, ground2.Plug1)
    annotation (Line(points={{34,-10},{34,-18},{34,-18}}, color={0,0,0}));
  connect(voltageSource.Plug2, resistor.Plug2)
    annotation (Line(points={{-22,16},{-8,16},{-8,10}}, color={0,0,0}));
  connect(inductor.Plug2, resistor.Plug2) annotation (Line(points={{14,10},{14,10},{
          14,16},{-8,16},{-8,10}}, color={0,0,0}));
  connect(capacitor.Plug2, resistor.Plug2) annotation (Line(points={{34,10},{34,10},{
          34,16},{-8,16},{-8,10}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end VoltageSource_RLC;
