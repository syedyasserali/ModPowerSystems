within ModPowerSystems.PhasorSinglePhase.Examples.ReferenceGrids;
model WSCC_9Bus_PQLoad
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS2(Vnom=18e3)
    annotation (Placement(visible=true, transformation(
        origin={-80.0346,80},
        extent={{-12,0},{12,11.8154}},
        rotation=-90)));
  ModPowerSystems.PhasorSinglePhase.Transformers.Transformer TR27(
    Sr=100e6,
    URr=0,
    Ukr=6.25,
    Vnom1=18e3,
    Vnom2=230e3) annotation (Placement(visible=true, transformation(
        origin={-49,75},
        extent={{-11,-11},{11,11}},
        rotation=0)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS7(Vnom=230e3)
    annotation (Placement(visible=true, transformation(
        origin={-41.7122,80},
        extent={{-12,0},{12,12.0716}},
        rotation=-90)));
  ModPowerSystems.PhasorSinglePhase.Connections.PiLine LINE75(
    b=578.45e-6,
    g=0,
    length=1,
    r=16.928,
    x=85.165) annotation (Placement(visible=true, transformation(
        origin={-24,48},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS5(Vnom=230e3)
    annotation (Placement(visible=true, transformation(
        origin={-24,16},
        extent={{-10,0},{10,20}},
        rotation=0)));
  ModPowerSystems.PhasorSinglePhase.Connections.PiLine LINE54(
    b=332.703e-6,
    g=0,
    length=1,
    r=5.29,
    x=44.965) annotation (Placement(visible=true, transformation(
        origin={-24,4},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS4(Vnom=230e3)
    annotation (Placement(visible=true, transformation(
        origin={3,-28.4297},
        extent={{-23,0},{23,22.4297}},
        rotation=0)));
  ModPowerSystems.PhasorSinglePhase.Transformers.Transformer TR14(
    Sr=100e6,
    URr=0,
    Ukr=5.76,
    Vnom1=16500,
    Vnom2=230e3) annotation (Placement(visible=true, transformation(
        origin={4,-34},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS1(Vnom=16500)
    annotation (Placement(visible=true, transformation(
        origin={4,-62},
        extent={{-10,0},{10,20}},
        rotation=0)));
  ModPowerSystems.PhasorSinglePhase.Connections.PiLine LINE64(
    b=298.677e-6,
    g=0,
    length=1,
    r=8.993,
    x=48.668) annotation (Placement(visible=true, transformation(
        origin={20,4},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS6(Vnom=230e3)
    annotation (Placement(visible=true, transformation(
        origin={46,12},
        extent={{-10,0},{10,20}},
        rotation=0)));
  ModPowerSystems.PhasorSinglePhase.Connections.PiLine LINE96(
    b=676.741e-6,
    g=0,
    length=1,
    r=20.631,
    x=89.93) annotation (Placement(visible=true, transformation(
        origin={46,50},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS9(Vnom=230e3)
    annotation (Placement(visible=true, transformation(
        origin={38,90},
        extent={{-10,0},{10,20}},
        rotation=-90)));
  ModPowerSystems.PhasorSinglePhase.Transformers.Transformer TR39(
    Sr=100e6,
    URr=0,
    Ukr=5.86,
    Vnom1=13800,
    Vnom2=230e3) annotation (Placement(visible=true, transformation(
        origin={78,80},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS3(Vnom=13800)
    annotation (Placement(visible=true, transformation(
        origin={88,90},
        extent={{-10,0},{10,20}},
        rotation=-90)));
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoad LOAD6(
    Pnom=90e6,
    Qnom=30e6,
    Vnom=230e3) annotation (Placement(visible=true, transformation(
        origin={62,-6},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS8(Vnom=230e3)
    annotation (Placement(visible=true, transformation(
        origin={4,68},
        extent={{-10,0},{10,20}},
        rotation=0)));
  ModPowerSystems.PhasorSinglePhase.Connections.PiLine LINE78(
    b=281.664e-6,
    g=0,
    length=1,
    r=4.4965,
    x=38.088) annotation (Placement(visible=true, transformation(
        origin={-16,94},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ModPowerSystems.PhasorSinglePhase.Connections.PiLine LINE89(
    b=395.085e-6,
    g=0,
    length=1,
    r=6.2951,
    x=53.3232) annotation (Placement(visible=true, transformation(
        origin={26,94},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoad LOAD5(
    Pnom=125e6,
    Qnom=50e6,
    Vnom=230e3) annotation (Placement(visible=true, transformation(
        origin={-48,10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ModPowerSystems.PhasorSinglePhase.Generation.PVNode GEN3(Pgen=85e6, Vnom=
        1.025*13800) annotation (Placement(visible=true, transformation(
        origin={132,70},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ModPowerSystems.PhasorSinglePhase.Slack.Slack GEN1(Vnom=1.04*16500)
    annotation (Placement(visible=true, transformation(
        origin={4,-65},
        extent={{-6,-7},{6,7}},
        rotation=0)));
  ModPowerSystems.PhasorSinglePhase.Generation.PVNode GEN2(Pgen=163e6, Vnom=
        1.025*18000) annotation (Placement(visible=true, transformation(
        origin={-96,70},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoad LOAD8(
    Pnom=100e6,
    Qnom=35e6,
    Vnom=230e3) annotation (Placement(visible=true, transformation(
        origin={2,62},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  inner ModPowerSystems.Base.System system(freq_nom=60)
                                           annotation (
    Placement(visible = true, transformation(origin = {-144, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(GEN1.Pin1, BUS1.Pin1) annotation (Line(points={{4,-58},{4,-52}}));
  connect(TR14.Pin1, BUS1.Pin1) annotation (Line(points={{4,-44},{4,-52}}));
  connect(TR14.Pin2, BUS4.Pin1)
    annotation (Line(points={{4,-24},{4,-20},{4,-17.2148},{3,-17.2148}}));
  connect(LINE96.Pin2, BUS6.Pin1)
    annotation (Line(points={{46,40},{46,40},{46,22}}));
  connect(LINE96.Pin1, BUS9.Pin1)
    annotation (Line(points={{46,60},{46,80},{58,80}}));
  connect(LINE78.Pin1, BUS7.Pin1) annotation (Line(points={{-26,94},{-40,94},{
          -40,73.9642},{-29.6406,73.9642}}));
  connect(LINE78.Pin2, BUS8.Pin1)
    annotation (Line(points={{-6,94},{4,94},{4,78}}));
  connect(LOAD8.Pin1, BUS8.Pin1)
    annotation (Line(points={{2,72},{2,72},{2,78},{4,78}}));
  connect(LINE75.Pin2, BUS5.Pin1)
    annotation (Line(points={{-24,38},{-24,38},{-24,26}}));
  connect(LINE75.Pin1, BUS7.Pin1) annotation (Line(points={{-24,58},{-35,58},{
          -35,73.9642},{-29.6406,73.9642}}));
  connect(LOAD5.Pin1, BUS5.Pin1)
    annotation (Line(points={{-48,20},{-24,20},{-24,26}}));
  connect(LINE54.Pin1, BUS5.Pin1)
    annotation (Line(points={{-24,14},{-24,20},{-24,26}}));
  connect(LINE54.Pin2, BUS4.Pin1)
    annotation (Line(points={{-24,-6},{-6,-6},{-6,-17.2148},{3,-17.2148}}));
  connect(GEN2.Pin1, BUS2.Pin1) annotation (Line(points={{-96,80},{-86,80},{-86,
          74.0923},{-68.2192,74.0923}}));
  connect(TR27.Pin1, BUS2.Pin1) annotation (Line(points={{-60,75},{-72,75},{-72,
          74.0923},{-68.2192,74.0923}}));
  connect(TR27.Pin2, BUS7.Pin1) annotation (Line(points={{-38,75},{-38,73.9642},
          {-44,73.9642},{-29.6406,73.9642}}));
  connect(LOAD6.Pin1, BUS6.Pin1)
    annotation (Line(points={{62,4},{46,4},{46,22}}));
  connect(TR39.Pin2, BUS9.Pin1) annotation (Line(points={{68,80},{58,80}}));
  connect(TR39.Pin1, BUS3.Pin1)
    annotation (Line(points={{88,80},{102,80},{102,82},{102,80},{108,80}}));
  connect(GEN3.Pin1, BUS3.Pin1) annotation (Line(points={{132,80},{108,80}}));
  connect(LINE89.Pin2, BUS9.Pin1)
    annotation (Line(points={{36,94},{58,94},{58,80}}));
  connect(LINE89.Pin1, BUS8.Pin1)
    annotation (Line(points={{16,94},{4,94},{4,78}}));
  connect(LINE64.Pin1, BUS6.Pin1)
    annotation (Line(points={{20,14},{46,14},{46,22}}));
  connect(LINE64.Pin2, BUS4.Pin1)
    annotation (Line(points={{20,-6},{4,-6},{4,-17.2148},{3,-17.2148}}));
  connect(LINE78.Pin1, TR27.Pin2) annotation (Line(points={{-26,94},{-40,94},{
          -40,75},{-38,75}}, color={0,0,0}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,-80},{160,
            100}})),
    Icon(coordinateSystem(extent={{-160,-80},{160,100}})));
end WSCC_9Bus_PQLoad;
