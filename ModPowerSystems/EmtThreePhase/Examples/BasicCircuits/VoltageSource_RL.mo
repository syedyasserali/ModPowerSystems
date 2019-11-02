within ModPowerSystems.EmtThreePhase.Examples.BasicCircuits;
model VoltageSource_RL
  import ModPowerSystems;
  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  ModPowerSystems.EmtThreePhase.Basics.VoltageAC voltageAC
    annotation (Placement(transformation(extent={{-42,6},{-22,26}})));
  ModPowerSystems.EmtThreePhase.Basics.Resistor resistor annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-4,16})));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground
    annotation (Placement(transformation(extent={{-62,-36},{-42,-16}})));
  ModPowerSystems.EmtThreePhase.Basics.Inductor inductor
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={14,0})));
  ModPowerSystems.EmtThreePhase.Basics.Ground ground3
    annotation (Placement(transformation(extent={{4,-38},{24,-18}})));
equation
  connect(resistor.Plug1, inductor.Plug2)
    annotation (Line(points={{6,16},{14,16},{14,10}}, color={0,0,0}));
  connect(ground.Plug1, voltageAC.Plug1) annotation (Line(points={{-52,-16},{-52,
          -16},{-52,16},{-42,16}}, color={0,0,0}));
  connect(inductor.Plug1, ground3.Plug1)
    annotation (Line(points={{14,-10},{14,-14},{14,-18}}, color={0,0,0}));
  connect(voltageAC.Plug2, resistor.Plug2)
    annotation (Line(points={{-22,16},{-18,16},{-14,16}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end VoltageSource_RL;
