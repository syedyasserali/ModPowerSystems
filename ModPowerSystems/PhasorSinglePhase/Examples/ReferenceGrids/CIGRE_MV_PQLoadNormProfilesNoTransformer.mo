within ModPowerSystems.PhasorSinglePhase.Examples.ReferenceGrids;
model CIGRE_MV_PQLoadNormProfilesNoTransformer
  final parameter String LoadProfileFileH = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/LoadNormProfile_H.txt");
  final parameter String LoadProfileNameH = "loadH";
  final parameter String LoadProfileFileI = Modelica.Utilities.Files.loadResource("modelica://ModPowerSystems/../ExampleSimulationData/LoadNormProfile_I.txt");
  final parameter String LoadProfileNameI = "loadI";

  Slack.Slack slack(Vnom=20e3)
    annotation (Placement(transformation(extent={{24,224},{44,204}})));
  Connections.BusBar N1(Vnom=20e3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-74,146})));
  Connections.BusBar N2(Vnom=20e3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-74,104})));
  Connections.BusBar N3(Vnom=20e3)
    annotation (Placement(transformation(
        extent={{-56,-10},{56,10}},
        rotation=0,
        origin={-38,72})));
  Connections.BusBar N4(Vnom=20e3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-88,30})));
  Connections.BusBar N5(Vnom=20e3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-88,-24})));
  Connections.BusBar N6(Vnom=20e3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={80,-108})));
  Connections.BusBar N7(Vnom=20e3)
    annotation (Placement(transformation(
        extent={{-29,-11},{29,11}},
        rotation=0,
        origin={109,-69})));
  Connections.BusBar N8(Vnom=20e3)
    annotation (Placement(transformation(
        extent={{-32,-10},{32,10}},
        rotation=0,
        origin={66,-24})));
  Connections.BusBar N9(Vnom=20e3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,-60})));
  Connections.BusBar N10(Vnom=20e3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-34,-12})));
  Connections.BusBar N11(Vnom=20e3)
    annotation (Placement(transformation(
        extent={{-16,-10},{16,10}},
        rotation=0,
        origin={-20,26})));
  Connections.BusBar N12(Vnom=20e3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={106,146})));
  Connections.BusBar N13(Vnom=20e3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={106,104})));
  Connections.BusBar N14(Vnom=20e3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={106,64})));
  Loads.PQLoadNormProfile Load1_H(
    profileFileName=LoadProfileFileH,
    profileName=LoadProfileNameH,
    Vnom=20e3,
    Pnom=15e6,
    Qnom=3.1e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-56,132})));
  Loads.PQLoadNormProfile Load1_I(
    profileFileName=LoadProfileFileI,
    profileName=LoadProfileNameI,
    Vnom=20e3,
    Pnom=5e6,
    Qnom=1e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-36,132})));
  Loads.PQLoadNormProfile Load3_H(
    profileFileName=LoadProfileFileH,
    profileName=LoadProfileNameH,
    Vnom=20e3,
    Pnom=0.276e6,
    Qnom=0.69e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-72,58})));
  Loads.PQLoadNormProfile Load3_I(
    profileFileName=LoadProfileFileI,
    profileName=LoadProfileNameI,
    Vnom=20e3,
    Pnom=0.224e6,
    Qnom=0.139e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-52,58})));
  Loads.PQLoadNormProfile Load4_H(
    profileFileName=LoadProfileFileH,
    profileName=LoadProfileNameH,
    Vnom=20e3,
    Pnom=0.432e6,
    Qnom=0.108e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-104,16})));
  Loads.PQLoadNormProfile Load6_H(
    profileFileName=LoadProfileFileH,
    profileName=LoadProfileNameH,
    Vnom=20e3,
    Pnom=0.550e6,
    Qnom=0.138e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={88,-122})));
  Loads.PQLoadNormProfile Load7_I(
    profileFileName=LoadProfileFileI,
    profileName=LoadProfileNameI,
    Vnom=20e3,
    Pnom=0.077e6,
    Qnom=0.048e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={120,-82})));
  Loads.PQLoadNormProfile Load8_H(
    profileFileName=LoadProfileFileH,
    profileName=LoadProfileNameH,
    Vnom=20e3,
    Pnom=0.588e6,
    Qnom=0.147e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={66,-44})));
  Loads.PQLoadNormProfile Load9_I(
    profileFileName=LoadProfileFileI,
    profileName=LoadProfileNameI,
    Vnom=20e3,
    Pnom=0.574e6,
    Qnom=0.356e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,-82})));
  Loads.PQLoadNormProfile Load10_H(
    profileFileName=LoadProfileFileH,
    profileName=LoadProfileNameH,
    Vnom=20e3,
    Pnom=0.477e6,
    Qnom=0.12e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-16,-26})));
  Loads.PQLoadNormProfile Load10_I(
    profileFileName=LoadProfileFileI,
    profileName=LoadProfileNameI,
    Vnom=20e3,
    Pnom=0.068e6,
    Qnom=0.042e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={2,-26})));
  Loads.PQLoadNormProfile Load11_H(
    profileFileName=LoadProfileFileH,
    profileName=LoadProfileNameH,
    Vnom=20e3,
    Pnom=0.331e6,
    Qnom=0.083e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-6,12})));
  Loads.PQLoadNormProfile Load12_H(
    profileFileName=LoadProfileFileH,
    profileName=LoadProfileNameH,
    Vnom=20e3,
    Pnom=15e6,
    Qnom=3e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={128,132})));
  Loads.PQLoadNormProfile Load12_I(
    profileFileName=LoadProfileFileI,
    profileName=LoadProfileNameI,
    Vnom=20e3,
    Pnom=5e6,
    Qnom=1.7e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={148,132})));
  Loads.PQLoadNormProfile Load13_I(
    profileFileName=LoadProfileFileI,
    profileName=LoadProfileNameI,
    Vnom=20e3,
    Pnom=0.032e6,
    Qnom=0.02e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={128,90})));
  Loads.PQLoadNormProfile Load14_H(
    profileFileName=LoadProfileFileH,
    profileName=LoadProfileNameH,
    Vnom=20e3,
    Pnom=0.207e6,
    Qnom=0.052e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={106,44})));
  Loads.PQLoadNormProfile Load14_I(
    profileFileName=LoadProfileFileI,
    profileName=LoadProfileNameI,
    Vnom=20e3,
    Pnom=0.33e6,
    Qnom=0.205e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={128,44})));
  Loads.PQLoadNormProfile Load5_H(
    profileFileName=LoadProfileFileH,
    profileName=LoadProfileNameH,
    Vnom=20e3,
    Pnom=0.725e6,
    Qnom=0.182e6) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-98,-40})));
  Connections.PiLine L1_2(
    length=2.82,
    r=0.579,
    x=0.367,
    b=49.914e-6) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-74,124})));
  Connections.PiLine L2_3(
    length=4.42,
    r=0.164,
    x=0.113,
    b=207.597e-6) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-74,88})));
  Connections.PiLine L12_13(
    length=4.89,
    r=0.337,
    x=0.358,
    b=51.17e-6) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={106,126})));
  Connections.PiLine L13_14(
    length=2.99,
    r=0.202,
    x=0.122,
    b=150.294e-6) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={106,82})));
  Connections.PiLine L3_4(
    length=0.61,
    r=0.262,
    x=0.121,
    b=203.576e-6) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-88,50})));
  Connections.PiLine L4_5(
    length=0.56,
    r=0.354,
    x=0.129,
    b=143.257e-6) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-88,2})));
  Connections.PiLine L3_8(
    length=1.3,
    r=0.172,
    x=0.115,
    b=206.592e-6) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={64,40})));
  Connections.PiLine L7_8(
    length=1.67,
    r=0.294,
    x=0.123,
    b=175.93e-6) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={92,-42})));
  Connections.PiLine L8_9(
    length=0.32,
    r=0.339,
    x=0.13,
    b=137.225e-6) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={30,-46})));
  Connections.PiLine L9_10(
    length=0.77,
    r=0.399,
    x=0.133,
    b=151.802e-6) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-34,-42})));
  Connections.PiLine L10_11(
    length=0.33,
    r=0.367,
    x=0.133,
    b=143.257e-6) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-20,6})));
  Connections.PiLine L5_6(
    length=1.54,
    r=0.336,
    x=0.126,
    b=172.411e-6) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-38,-112})));
  inner ModPowerSystems.Base.System system
    annotation (Placement(transformation(extent={{-160,220},{-120,260}})));
equation
  connect(Load1_I.Pin1,N1.Pin1)
   annotation(Line(points={{-36,142},{-74,142},{-74,146}},                                color = {0, 0, 0}, smooth = Smooth.None));
  connect(Load12_I.Pin1,N12.Pin1)
   annotation(Line(points={{148,142},{106,142},{106,146}},                                color = {0, 0, 0}, smooth = Smooth.None));
  connect(Load1_I.Pin1,Load1_H.Pin1)
   annotation(Line(points={{-36,142},{-56,142}},      color = {0, 0, 0}, smooth = Smooth.None));
  connect(Load12_H.Pin1,N12.Pin1)
   annotation(Line(points={{128,142},{106,142},{106,146}},                                color = {0, 0, 0}, smooth = Smooth.None));
  connect(L12_13.Pin2,N13.Pin1)
   annotation(Line(points={{106,116},{106,104}},  color = {0, 0, 0}, smooth = Smooth.None));
  connect(Load13_I.Pin1,N13.Pin1)
   annotation(Line(points={{128,100},{106,100},{106,104}},                             color = {0, 0, 0}, smooth = Smooth.None));
  connect(L12_13.Pin1,N12.Pin1)
   annotation(Line(points={{106,136},{106,146}},    color = {0, 0, 0}, smooth = Smooth.None));
  connect(L13_14.Pin1,N13.Pin1)
   annotation(Line(points={{106,92},{106,104}},   color = {0, 0, 0}, smooth = Smooth.None));
  connect(L13_14.Pin2,N14.Pin1)
   annotation(Line(points={{106,72},{106,64}},    color = {0, 0, 0}, smooth = Smooth.None));
  connect(Load14_H.Pin1,N14.Pin1)
   annotation(Line(points={{106,54},{106,64}},    color = {0, 0, 0}, smooth = Smooth.None));
  connect(Load14_I.Pin1,N14.Pin1)
   annotation(Line(points={{128,54},{128,60},{106,60},{106,64}},                                  color = {0, 0, 0}, smooth = Smooth.None));
  connect(L1_2.Pin1,N1.Pin1)
   annotation(Line(points={{-74,134},{-74,146}},      color = {0, 0, 0}, smooth = Smooth.None));
  connect(L1_2.Pin2,N2.Pin1)
   annotation(Line(points={{-74,114},{-74,104}},    color = {0, 0, 0}, smooth = Smooth.None));
  connect(L2_3.Pin1,N2.Pin1)
   annotation(Line(points={{-74,98},{-74,104}},     color = {0, 0, 0}, smooth = Smooth.None));
  connect(L2_3.Pin2,N3.Pin1)
   annotation(Line(points={{-74,78},{-74,74},{-38,74},{-38,72}},                                color = {0, 0, 0}, smooth = Smooth.None));
  connect(Load3_H.Pin1,N3.Pin1)
   annotation(Line(points={{-72,68},{-38,68},{-38,72}},        color = {0, 0, 0}, smooth = Smooth.None));
  connect(Load3_I.Pin1,N3.Pin1)
   annotation(Line(points={{-52,68},{-38,68},{-38,72}},        color = {0, 0, 0}, smooth = Smooth.None));
  connect(L3_4.Pin1,N3.Pin1)
   annotation(Line(points={{-88,60},{-88,68},{-38,68},{-38,72}},                                  color = {0, 0, 0}, smooth = Smooth.None));
  connect(N4.Pin1,L3_4.Pin2)
   annotation(Line(points={{-88,30},{-88,40}},        color = {0, 0, 0}, smooth = Smooth.None));
  connect(Load4_H.Pin1,N4.Pin1)
   annotation(Line(points={{-104,26},{-104,28},{-88,28},{-88,30}},                     color = {0, 0, 0}, smooth = Smooth.None));
  connect(L4_5.Pin1,N4.Pin1)
   annotation(Line(points={{-88,12},{-88,30}},        color = {0, 0, 0}, smooth = Smooth.None));
  connect(L4_5.Pin2,N5.Pin1)
   annotation(Line(points={{-88,-8},{-88,-24}},         color = {0, 0, 0}, smooth = Smooth.None));
  connect(L3_8.Pin2,N8.Pin1)
   annotation(Line(points={{64,30},{64,4},{66,4},{66,-24}},                                    color = {0, 0, 0}, smooth = Smooth.None));
  connect(L3_8.Pin1,Load3_I.Pin1)
   annotation(Line(points={{64,50},{64,68},{-52,68}},        color = {0, 0, 0}, smooth = Smooth.None));
  connect(L7_8.Pin1,N8.Pin1)
   annotation(Line(points={{92,-32},{92,-28},{66,-28},{66,-24}},                                color = {0, 0, 0}, smooth = Smooth.None));
  connect(L7_8.Pin2,N7.Pin1)
   annotation(Line(points={{92,-52},{92,-56},{108,-56},{108,-69},{109,-69}},
                                                                          color = {0, 0, 0}, smooth = Smooth.None));
  connect(Load6_H.Pin1,N6.Pin1)
   annotation(Line(points={{88,-112},{80,-112},{80,-108}},                                color = {0, 0, 0}, smooth = Smooth.None));
  connect(N8.Pin1,L8_9.Pin1)
   annotation(Line(points={{66,-24},{66,-28},{30,-28},{30,-36}},                                color = {0, 0, 0}, smooth = Smooth.None));
  connect(Load8_H.Pin1,N8.Pin1)
   annotation(Line(points={{66,-34},{66,-24}},      color = {0, 0, 0}, smooth = Smooth.None));
  connect(L8_9.Pin2,N9.Pin1)
   annotation(Line(points={{30,-56},{30,-66},{0,-66},{0,-60}},                                    color = {0, 0, 0}, smooth = Smooth.None));
  connect(L9_10.Pin1,N10.Pin1)
   annotation(Line(points={{-34,-32},{-34,-12}},      color = {0, 0, 0}, smooth = Smooth.None));
  connect(L9_10.Pin2,N9.Pin1)
   annotation(Line(points={{-34,-52},{-34,-66},{0,-66},{0,-60}},                                     color = {0, 0, 0}, smooth = Smooth.None));
  connect(Load9_I.Pin1,N9.Pin1)
   annotation(Line(points={{0,-72},{0,-60}},          color = {0, 0, 0}, smooth = Smooth.None));
  connect(Load10_H.Pin1,N10.Pin1)
   annotation(Line(points={{-16,-16},{-34,-16},{-34,-12}},                                  color = {0, 0, 0}, smooth = Smooth.None));
  connect(L10_11.Pin1,N11.Pin1)
   annotation(Line(points={{-20,16},{-20,26}},                          color = {0, 0, 0}, smooth = Smooth.None));
  connect(L10_11.Pin2,N10.Pin1)
   annotation(Line(points={{-20,-4},{-20,-8},{-34,-8},{-34,-12}},              color = {0, 0, 0}, smooth = Smooth.None));
  connect(Load11_H.Pin1,N11.Pin1)
   annotation(Line(points={{-6,22},{-20,22},{-20,26}},       color = {0, 0, 0}, smooth = Smooth.None));
  connect(Load10_I.Pin1,N10.Pin1)
   annotation(Line(points={{2,-16},{-34,-16},{-34,-12}},                                    color = {0, 0, 0}, smooth = Smooth.None));
  connect(L5_6.Pin1,N5.Pin1)
   annotation(Line(points={{-48,-112},{-88,-112},{-88,-24}},                                color = {0, 0, 0}, smooth = Smooth.None));
  connect(L5_6.Pin2,N6.Pin1)
   annotation(Line(points={{-28,-112},{80,-112},{80,-108}},                              color = {0, 0, 0}, smooth = Smooth.None));
  connect(Load7_I.Pin1,N7.Pin1)
   annotation (Line(points={{120,-72},{108,-72},{108,-69},{109,-69}},
                     color={0,0,0}));
  connect(Load5_H.Pin1,N5.Pin1)
   annotation (Line(points={{-98,-30},{-98,-30},{-88,-30},{-88,-24}},
                      color={0,0,0}));
  connect(slack.Pin1, N1.Pin1) annotation (Line(points={{34,204},{34,204},{34,
          148},{-74,148},{-74,146}}, color={0,0,0}));
  connect(N12.Pin1, N1.Pin1) annotation (Line(points={{106,146},{106,152},{32,
          152},{32,150},{34,150},{34,148},{-74,148},{-74,146}}, color={0,0,0}));
  annotation (Diagram(coordinateSystem(extent={{-160,-160},{180,260}},
          preserveAspectRatio=false)),                                   Icon(
        coordinateSystem(extent={{-160,-160},{180,260}})),
    experiment(StopTime=86400, Interval=60));
end CIGRE_MV_PQLoadNormProfilesNoTransformer;
