within ModPowerSystems.EmtSinglePhase.Examples.BasicCircuits;
model VoltageSourceAC_RL
  import ModPowerSystems;

  ModPowerSystems.EmtSinglePhase.Basics.VoltageAC voltageSource
    annotation (Placement(transformation(extent={{-42,6},{-22,26}})));
  ModPowerSystems.EmtSinglePhase.Basics.Resistor resistor annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-4,16})));
  ModPowerSystems.EmtSinglePhase.Basics.Ground ground
    annotation (Placement(transformation(extent={{-62,-36},{-42,-16}})));
  ModPowerSystems.EmtSinglePhase.Basics.Inductor inductor(L = 0.01)  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={14,0})));
  ModPowerSystems.EmtSinglePhase.Basics.Ground ground3
    annotation (Placement(transformation(extent={{4,-38},{24,-18}})));
  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
equation
  connect(resistor.Pin1, inductor.Pin2)
    annotation (Line(points={{6,16},{14,16},{14,10}}, color={0,0,0}));
  connect(ground.Pin1, voltageSource.Pin1) annotation (Line(points={{-52,-16},{-52,
          -16},{-52,16},{-42,16}}, color={0,0,0}));
  connect(inductor.Pin1, ground3.Pin1)
    annotation (Line(points={{14,-10},{14,-14},{14,-18}}, color={0,0,0}));
  connect(voltageSource.Pin2, resistor.Pin2)
    annotation (Line(points={{-22,16},{-18,16},{-14,16}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end VoltageSourceAC_RL;
