within ModPowerSystems.DynPhasorSinglePhase.Examples.BasicCircuits;
model VoltageSource_RL
  import ModPowerSystems;
  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ModPowerSystems.DynPhasorSinglePhase.Basics.VoltageSource voltageSource
    annotation (Placement(transformation(extent={{-42,6},{-22,26}})));
  ModPowerSystems.DynPhasorSinglePhase.Basics.Resistor resistor(R=1)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-4,16})));
  ModPowerSystems.DynPhasorSinglePhase.Basics.Ground ground
    annotation (Placement(transformation(extent={{-62,-36},{-42,-16}})));
  ModPowerSystems.DynPhasorSinglePhase.Basics.Inductor inductor(L=0.001)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={14,0})));
  ModPowerSystems.DynPhasorSinglePhase.Basics.Ground ground3
    annotation (Placement(transformation(extent={{4,-38},{24,-18}})));
equation
  connect(resistor.Pin1, inductor.Pin2)
    annotation (Line(points={{6,16},{14,16},{14,10}}, color={0,0,0}));
  connect(ground.Pin1, voltageSource.Pin1) annotation (Line(points={{-52,-16},{
          -52,-16},{-52,16},{-42,16}}, color={0,0,0}));
  connect(inductor.Pin1, ground3.Pin1)
    annotation (Line(points={{14,-10},{14,-14},{14,-18}}, color={0,0,0}));
  connect(voltageSource.Pin2, resistor.Pin2)
    annotation (Line(points={{-22,16},{-18,16},{-14,16}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=0.2, Interval=5e-005));
end VoltageSource_RL;
