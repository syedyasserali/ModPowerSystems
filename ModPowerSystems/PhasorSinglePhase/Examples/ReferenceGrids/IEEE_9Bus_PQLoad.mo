within ModPowerSystems.PhasorSinglePhase.Examples.ReferenceGrids;
model IEEE_9Bus_PQLoad
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS1(Vnom = 10e3) annotation (
    Placement(visible = true, transformation(origin = {-110.059, 92}, extent = {{-12, 0.0587663}, {12, 19.8382}}, rotation = -90)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS5(Vnom = 10e3) annotation (
    Placement(visible = true, transformation(origin = {-51.6748, 88}, extent = {{-12, -2.32517}, {12, 14.0342}}, rotation = -90)));
  ModPowerSystems.PhasorSinglePhase.Connections.PiLine LINE_B_05_06(b = 0, g = 0, length = 1, r = 0.003226, x = 0.020851) annotation (
    Placement(visible = true, transformation(origin = {-36, 8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS8(Vnom = 10e3) annotation (
    Placement(visible = true, transformation(origin = {66.6, 17}, extent = {{-55, -2.6}, {55, 23.4}}, rotation = -90)));
  ModPowerSystems.PhasorSinglePhase.Connections.PiLine LINE_D_07_08(b = 0, g = 0, length = 1, r = 0.003226, x = 0.069502) annotation (
    Placement(visible = true, transformation(origin = {68, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS6(Vnom = 10e3) annotation (
    Placement(visible = true, transformation(origin = {-52, -56}, extent = {{-10, 0}, {10, 20}}, rotation = -90)));
  ModPowerSystems.PhasorSinglePhase.Connections.PiLine LINE_E_07_08(b = 0, g = 0, length = 1, r = 0.003226, x = 0.069502) annotation (
    Placement(visible = true, transformation(origin = {66, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS3(Vnom = 10e3) annotation (
    Placement(visible = true, transformation(origin = {128, -30}, extent = {{-10, 0}, {10, 20}}, rotation = -90)));
  ModPowerSystems.PhasorSinglePhase.Connections.PiLine LINE_F_08_09(b = 0, g = 0, length = 1, r = 0.003226, x = 0.069502) annotation (
    Placement(visible = true, transformation(origin = {108, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS9(Vnom = 10e3) annotation (
    Placement(visible = true, transformation(origin = {116, 83}, extent = {{-15, -2}, {15, 20}}, rotation = -90)));
  ModPowerSystems.PhasorSinglePhase.Transformers.Transformer TR04_09(Sr = 100e6, URr = 0, Ukr = 0.0143, Vnom1 = 10e3, Vnom2 = 10e3) annotation (
    Placement(visible = true, transformation(origin = {156, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS4(Vnom = 10e3) annotation (
    Placement(visible = true, transformation(origin = {158.182, 83}, extent = {{-13, -2.18184}, {13, 21.8184}}, rotation = -90)));
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoad LOAD05(Pnom = 40e9, Qnom = 8e9, Vnom = 10e3) annotation (
    Placement(visible = true, transformation(origin = {-48, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Connections.PiLine LINE_A05_07(b = 0, g = 0, length = 1, r = 0.003618, x = 0.024241) annotation (
    Placement(visible = true, transformation(origin = {-8, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Connections.PiLine LINE_C06_07(b = 0, g = 0, length = 1, r = 0.003618, x = 0.024241) annotation (
    Placement(visible = true, transformation(origin = {-10, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Slack.Slack GEN4(Vnom = 1.02 * 10e3) annotation (
    Placement(visible = true, transformation(origin = {196, 63}, extent = {{-6, -7}, {6, 7}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Generation.PVNode GEN1(Pgen = 41e9, Vnom = 1.03 * 10000) annotation (
    Placement(visible = true, transformation(origin = {-118, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ModPowerSystems.Base.System system(freq_nom=60)
                                           annotation (
    Placement(visible = true, transformation(origin = {-124, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Transformers.Transformer TR02_06(Sr = 100e6, URr = 0, Ukr = 0.66, Vnom1 = 10e3, Vnom2 = 10e3) annotation (
    Placement(visible = true, transformation(origin = {-70, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Transformers.Transformer TR03_08(Sr = 100e6, URr = 0, Ukr = 0.2, Vnom1 = 10e3, Vnom2 = 10e3) annotation (
    Placement(visible = true, transformation(origin = {120, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  ModPowerSystems.PhasorSinglePhase.Generation.PVNode GEN2(Pgen = 1200e6, Vnom = 1.05 * 10e3) annotation (
    Placement(visible = true, transformation(origin = {-118, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS2(Vnom = 10e3) annotation (
    Placement(visible = true, transformation(origin = {-112, -43}, extent = {{-15, 0}, {15, 19}}, rotation = -90)));
  ModPowerSystems.PhasorSinglePhase.Transformers.Transformer TR01_05(Sr = 100e6, URr = 0, Ukr = 0.02, Vnom1 = 10e3, Vnom2 = 10e3) annotation (
    Placement(visible = true, transformation(origin = {-67, 83}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Connections.BusBar BUS7(Vnom = 10e3) annotation (
    Placement(visible = true, transformation(origin = {7.2313, 15.5703}, extent = {{-55, 0}, {55, 22.2168}}, rotation = -90)));
  ModPowerSystems.PhasorSinglePhase.Connections.PiLine LINE_G_08_09(b = 0, g = 0, length = 1, r = 0.003226, x = 0.069502) annotation (
    Placement(visible = true, transformation(origin = {115, 30}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Generation.PVNode GEN3(Pgen = 3780.1e6, Vnom = 1.032 * 10e3) annotation (
    Placement(visible = true, transformation(origin = {170, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoad LOAD06(Pnom = 500e6, Qnom = 100e6, Vnom = 10e3) annotation (
    Placement(visible = true, transformation(origin = {-54, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoad LOAD7(Pnom = 2750e6, Qnom = 550e6, Vnom = 10e3) annotation (
    Placement(visible = true, transformation(origin = {44, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoad LOAD09(Pnom = 50e9, Qnom = 12e9, Vnom = 10e3) annotation (
    Placement(visible = true, transformation(origin = {146, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.PhasorSinglePhase.Loads.PQLoad LOAD8(Pnom = 1750e6, Qnom = 200e6, Vnom = 10e3) annotation (
    Placement(visible = true, transformation(origin = {114, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(TR03_08.Pin1, BUS3.Pin1) annotation (
    Line(points={{130,-34},{139,-34},{139,-40},{148,-40}}));
  connect(GEN3.Pin1, BUS3.Pin1) annotation (
    Line(points={{170,-34},{159,-34},{159,-40},{148,-40}}));
  connect(TR02_06.Pin2, BUS6.Pin1) annotation (
    Line(points={{-60,-52},{-48,-52},{-48,-66},{-32,-66}}));
  connect(LINE_B_05_06.Pin2, BUS6.Pin1) annotation (
    Line(points={{-36,-2},{-36,-66},{-32,-66}}));
  connect(LINE_C06_07.Pin1, BUS6.Pin1) annotation (
    Line(points={{-20,-58},{-32,-58},{-32,-66}}));
  connect(LOAD06.Pin1, BUS6.Pin1) annotation (
    Line(points={{-54,-60},{-32,-60},{-32,-66}}));
  connect(LOAD09.Pin1, BUS9.Pin1) annotation (
    Line(points = {{146, 64}, {136, 64}, {136, 72}}));
  connect(LOAD8.Pin1, BUS8.Pin1) annotation (
    Line(points = {{114, -2}, {92, -2}, {92, 4}, {90, 4}}));
  connect(LOAD7.Pin1, BUS7.Pin1) annotation (
    Line(points = {{44, -6}, {32, -6}, {32, 4.4619}, {29.4481, 4.4619}}));
  connect(GEN2.Pin1, BUS2.Pin1) annotation (
    Line(points = {{-118, -54}, {-118, -52.5}, {-93, -52.5}}));
  connect(LINE_G_08_09.Pin1, BUS8.Pin1) annotation (
    Line(points = {{106, 30}, {106, 4}, {90, 4}}));
  connect(LINE_G_08_09.Pin2, BUS9.Pin1) annotation (
    Line(points = {{124, 30}, {136, 30}, {136, 72}}));
  connect(LINE_A05_07.Pin1, BUS5.Pin1) annotation (
    Line(points={{-18,46},{-20,46},{-20,79.8203},{-37.6406,79.8203}}));
  connect(TR01_05.Pin2, BUS5.Pin1) annotation (
    Line(points={{-56,83},{-37.6406,83},{-37.6406,79.8203}}));
  connect(LOAD05.Pin1, BUS5.Pin1) annotation (
    Line(points={{-48,56},{-48,79.8203},{-37.6406,79.8203}}));
  connect(LINE_B_05_06.Pin1, BUS5.Pin1) annotation (
    Line(points={{-36,18},{-35,18},{-35,79.8203},{-37.6406,79.8203}}));
  connect(LINE_D_07_08.Pin2, BUS7.Pin1) annotation (
    Line(points = {{58, 24}, {30, 24}, {30, 4}, {32, 4}, {32, 10}, {30, 10}, {30, 2}, {29.4481, 2}, {29.4481, 4.4619}}));
  connect(LINE_E_07_08.Pin2, BUS7.Pin1) annotation (
    Line(points = {{56, -32}, {29.4481, -32}, {29.4481, 4.4619}}));
  connect(LINE_C06_07.Pin2, BUS7.Pin1) annotation (
    Line(points = {{0, -58}, {18, -58}, {18, -24}, {29.4481, -24}, {29.4481, 4.4619}}));
  connect(LINE_A05_07.Pin2, BUS7.Pin1) annotation (
    Line(points = {{2, 46}, {6, 46}, {6, 2}, {29.4481, 2}, {29.4481, 4.4619}}));
  connect(TR02_06.Pin1, BUS2.Pin1) annotation (
    Line(points = {{-80, -52}, {-89, -52}, {-89, -52.5}, {-93, -52.5}}));
  connect(GEN1.Pin1, BUS1.Pin1) annotation (
    Line(points={{-118,82},{-102,82},{-102,82.1103},{-90.2208,82.1103}}));
  connect(GEN4.Pin1, BUS4.Pin1) annotation (
    Line(points={{196,70},{188,70},{188,70.9999},{180,70.9999}}));
  connect(TR03_08.Pin2, BUS8.Pin1) annotation (
    Line(points = {{110, -34}, {92, -34}, {92, 4}, {90, 4}}));
  connect(LINE_F_08_09.Pin2, BUS8.Pin1) annotation (
    Line(points = {{98, 72}, {90, 72}, {90, 4}}));
  connect(LINE_F_08_09.Pin1, BUS9.Pin1) annotation (
    Line(points = {{118, 72}, {130, 72}, {136, 72}}));
  connect(TR04_09.Pin2, BUS9.Pin1) annotation (
    Line(points = {{146, 72}, {146, 72}, {136, 72}}));
  connect(TR04_09.Pin1, BUS4.Pin1) annotation (
    Line(points={{166,72},{166,71},{180,71},{180,70.9999}}));
  connect(LINE_D_07_08.Pin1, BUS8.Pin1) annotation (
    Line(points = {{78, 24}, {92, 24}, {92, 10}, {92, 4}, {90, 4}}));
  connect(LINE_E_07_08.Pin1, BUS8.Pin1) annotation (
    Line(points = {{76, -32}, {92, -32}, {92, 4}, {90, 4}}));
  connect(TR01_05.Pin1, BUS1.Pin1) annotation (
    Line(points={{-78,83},{-94,83},{-94,82.1103},{-90.2208,82.1103}}));
  connect(LOAD09.Pin1, TR04_09.Pin2) annotation (
    Line(points = {{146, 64}, {136, 64}, {136, 72}, {146, 72}}, color = {0, 0, 0}));
  annotation (
    Diagram(coordinateSystem(extent = {{-140, -100}, {200, 100}}, preserveAspectRatio = false)),
    Icon(coordinateSystem(extent = {{-140, -100}, {200, 100}})));
end IEEE_9Bus_PQLoad;
