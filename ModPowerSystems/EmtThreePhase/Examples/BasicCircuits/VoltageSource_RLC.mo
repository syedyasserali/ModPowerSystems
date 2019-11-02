within ModPowerSystems.EmtThreePhase.Examples.BasicCircuits;
model VoltageSource_RLC

  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ModPowerSystems.EmtThreePhase.Basics.VoltageAC voltageAC
    annotation (Placement(transformation(extent={{-42,6},{-22,26}})));
  ModPowerSystems.EmtThreePhase.Basics.Resistor resistor annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-8,0})));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground
    annotation (Placement(transformation(extent={{-62,-36},{-42,-16}})));
  ModPowerSystems.EmtThreePhase.Basics.Capacitor capacitor annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={34,0})));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground2
    annotation (Placement(transformation(extent={{24,-38},{44,-18}})));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground1
    annotation (Placement(transformation(extent={{-18,-38},{2,-18}})));
  ModPowerSystems.EmtThreePhase.Basics.Inductor inductor annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={14,0})));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground3
    annotation (Placement(transformation(extent={{4,-38},{24,-18}})));
equation
  connect(voltageAC.Plug1, ground.Plug1)
    annotation (Line(points={{-42,16},{-52,16},{-52,-16}}, color={0,0,0}));
  connect(inductor.Plug1, ground3.Plug1)
    annotation (Line(points={{14,-10},{14,-10},{14,-18}}, color={0,0,0}));
  connect(resistor.Plug1, ground1.Plug1)
    annotation (Line(points={{-8,-10},{-8,-14},{-8,-18}}, color={0,0,0}));
  connect(capacitor.Plug1, ground2.Plug1)
    annotation (Line(points={{34,-10},{34,-18},{34,-18}}, color={0,0,0}));
  connect(voltageAC.Plug2, resistor.Plug2)
    annotation (Line(points={{-22,16},{-8,16},{-8,10}}, color={0,0,0}));
  connect(inductor.Plug2, resistor.Plug2) annotation (Line(points={{14,10},{14,10},{
          14,16},{-8,16},{-8,10}}, color={0,0,0}));
  connect(capacitor.Plug2, resistor.Plug2) annotation (Line(points={{34,10},{34,10},{
          34,16},{-8,16},{-8,10}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end VoltageSource_RLC;
