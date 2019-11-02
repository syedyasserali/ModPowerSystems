within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;
model DER_Feeder

    inner ModPowerSystems.Base.System system(freq_nom = 50) annotation (
      Placement(visible = true, transformation(origin = {-194, 386}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Measurements.VoltageMeasurementABC
    voltageMeasurementblock1(Vnom=312) annotation (Placement(visible=true,
        transformation(
        origin={-260,246},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ModPowerSystems.EmtThreePhase.Measurements.PLL pll1 annotation (Placement(
        visible=true, transformation(
        origin={-221,257},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  ModPowerSystems.EmtThreePhase.Transforms.ABCtoQD0_Krause aBCtoDQ1 annotation (
     Placement(visible=true, transformation(
        origin={-243,257},
        extent={{-5,5},{5,-5}},
        rotation=0)));
  ModPowerSystems.EmtThreePhase.Transforms.ABCtoQD0_Krause aBCtoDQ2 annotation (
     Placement(visible=true, transformation(
        origin={-153,243},
        extent={{5,-5},{-5,5}},
        rotation=0)));
  ModPowerSystems.EmtThreePhase.Measurements.PowerMeasurementDQ pq1 annotation (
     Placement(visible=true, transformation(
        origin={-186,248},
        extent={{-6,-6},{6,6}},
        rotation=0)));
    ModPowerSystems.EmtThreePhase.Fault.Breaker breaker1(is_closed = feeder_connected) annotation (
      Placement(visible = true, transformation(origin = {-180, 272}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    ModPowerSystems.EmtThreePhase.Loads.ZLoad zLoad1(Pnom = 5000, Qnom = 200, Vnom = 312) annotation (
      Placement(visible = true, transformation(origin = {-103, 248}, extent = {{-9, -6}, {9, 6}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Measurements.CurrentMeasurementABC
    currentMeasurementBlock1 annotation (Placement(visible=true, transformation(
        origin={-134,272},
        extent={{-10,10},{10,-10}},
        rotation=0)));
    ModPowerSystems.EmtThreePhase.Basics.VCCS vccs1(phiV = 0.523599) annotation (
      Placement(visible = true, transformation(origin = {-114, 362}, extent = {{6, -6}, {-6, 6}}, rotation = -90)));
    ModPowerSystems.EmtThreePhase.Basics.Inductor inductor1(L = {{0.002, 0, 0}, {0, 0.002, 0}, {0, 0, 0.002}}, i_0 = {0, 0, 0}) annotation (
      Placement(visible = true, transformation(origin = {-214, 272}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    ModPowerSystems.EmtThreePhase.Basics.Ground ground3(Vnom = 0) annotation (
      Placement(visible = true, transformation(origin = {-314, 262}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModPowerSystems.EmtThreePhase.Basics.VCVS vcvs1(phiV = 0) annotation (
      Placement(visible = true, transformation(origin = {-276, 272}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ModPowerSystems.EmtThreePhase.Basics.Ground ground1 annotation (
      Placement(visible = true, transformation(origin = {-132, 376}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Measurements.CurrentMeasurementABC
    currentMeasurementBlock2 annotation (Placement(visible=true, transformation(
        origin={-114,316},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
    Modelica.Blocks.Interfaces.RealOutput P_VCVSI annotation (
      Placement(visible = true, transformation(origin = {12, 246}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={-256,286},   extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput Q_VCVSI annotation (
      Placement(visible = true, transformation(origin = {0, 222}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={-256,246},   extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant I_ctrl(k = 0)  annotation (
      Placement(visible = true, transformation(origin = {-84, 370}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.Plug plug1 annotation (
      Placement(visible = true, transformation(origin = {-36, 264}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={0,304},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Measurements.VoltageMeasurementABC voltageMeasurementblock3(Vnom=312)
    annotation (Placement(visible=true, transformation(
        origin={8,284},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Vi annotation (
      Placement(visible = true, transformation(origin = {-305, 307}, extent = {{-7, -7}, {7, 7}}, rotation = 0), iconTransformation(origin={-235,351},  extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Basics.Resistor resistor1 annotation (
      Placement(visible = true, transformation(origin = {-240, 272}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ModPowerSystems.EmtThreePhase.Transforms.ABCtoQD0_Krause aBCtoDQ5 annotation (
     Placement(visible=true, transformation(
        origin={23,307},
        extent={{-5,5},{5,-5}},
        rotation=0)));
  ModPowerSystems.EmtThreePhase.Measurements.PLL pll3 annotation (Placement(
        visible=true, transformation(
        origin={43,307},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  Modelica.Blocks.Math.Gain gain1(k = -1)  annotation (
      Placement(visible = true, transformation(origin = {50, 330}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Boolean feeder_connected = true;
equation
    connect(gain1.u, aBCtoDQ5.f_qd0[2]) annotation (
      Line(points={{38,330},{28,330},{28,307},{28.5,307}},        color = {0, 0, 127}));
    connect(aBCtoDQ5.f_qd0[1], pll3.Vd) annotation (
      Line(points={{28.5,307.333},{36,307.333},{36,307},{36.7,307}},
                                                                  color = {0, 0, 127}, thickness = 0.5));
    connect(pll3.theta, aBCtoDQ5.theta) annotation (
      Line(points={{48.5,307},{56,307},{56,294},{22,294},{22,301},{23,301}},            color = {0, 0, 127}));
    connect(aBCtoDQ5.f_abc, voltageMeasurementblock3.v_abc) annotation (
      Line(points={{17,307},{16,307},{16,294},{13.2,294}},                   color = {0, 0, 127}, thickness = 0.5));
    connect(currentMeasurementBlock2.Plug2, currentMeasurementBlock1.Plug2) annotation (
      Line(points = {{-114, 306}, {-114, 306}, {-114, 274}, {-124, 274}, {-124, 272}, {-124, 272}}));
    connect(currentMeasurementBlock2.Plug1, vccs1.Plug1) annotation (
      Line(points = {{-114, 326}, {-114, 326}, {-114, 356}, {-114, 356}}));
    connect(vccs1.Plug2, ground1.Plug1) annotation (
      Line(points = {{-114, 368}, {-114, 368}, {-114, 394}, {-132, 394}, {-132, 386}, {-132, 386}}));
    connect(vcvs1.Plug1, ground3.Plug1) annotation (
      Line(points = {{-286, 272}, {-314, 272}, {-314, 272}, {-314, 272}}));
    connect(inductor1.Plug1, breaker1.Plug2) annotation (
      Line(points={{-204,272},{-190,272}}));
    connect(inductor1.Plug2, resistor1.Plug1) annotation (
      Line(points = {{-224, 272}, {-230, 272}, {-230, 272}, {-230, 272}}));
    connect(resistor1.Plug2, vcvs1.Plug2) annotation (
      Line(points = {{-250, 272}, {-266, 272}, {-266, 272}, {-266, 272}}));
    connect(resistor1.Plug2, vcvs1.Plug2) annotation (
      Line(points={{-250,272},{-266,272},{-266,272},{-266,272}}));
    connect(Vi, vcvs1.Vin) annotation (
      Line(points={{-305,307},{-276,307},{-276,284},{-276,284}},          color = {0, 0, 127}));
    connect(voltageMeasurementblock3.Plug1, plug1) annotation (
      Line(points={{8,294},{-8,294},{-8,264},{-36,264}}));
    connect(plug1, zLoad1.Plug1) annotation (
      Line(points={{-36,264},{-86,264},{-86,254},{-103,254},{-103,254}}));
    connect(I_ctrl.y, vccs1.Vi) annotation (
      Line(points={{-90.6,370},{-94,370},{-94,362},{-106.8,362},{-106.8,362}},      color = {0, 0, 127}));
    connect(pq1.Qac, Q_VCVSI) annotation (
      Line(points={{-179.4,245.72},{-176,245.72},{-176,210},{-36,210},{-36,222},
          {0,222},{0,222}},                                                                              color = {0, 0, 127}));
    connect(P_VCVSI, pq1.Pac) annotation (
      Line(points={{12,246},{-178,246},{-178,250},{-180,250},{-180,249.68},{-179.4,
          249.68}},                                                                               color = {0, 0, 127}));
    connect(zLoad1.Plug1, currentMeasurementBlock1.Plug2) annotation (
      Line(points = {{-103, 254}, {-103, 271}, {-124, 271}, {-124, 272}}));
    connect(currentMeasurementBlock1.Plug1, breaker1.Plug1) annotation (
      Line(points = {{-144, 272}, {-170, 272}}));
    connect(currentMeasurementBlock1.i_abc, aBCtoDQ2.f_abc) annotation (
      Line(points={{-123,267.4},{-123,243},{-147,243}},      color = {0, 0, 127}, thickness = 0.5));
    connect(pll1.theta, aBCtoDQ2.theta) annotation (
      Line(points={{-215.5,257},{-152,257},{-152,249},{-153,249}},        color = {0, 0, 127}));
    connect(pq1.V, aBCtoDQ1.f_qd0) annotation (
      Line(points={{-193.2,249.68},{-230,249.68},{-230,250},{-234,250},{-234,258},
          {-237.5,258},{-237.5,257}},                                                                            color = {0, 0, 127}, thickness = 0.5));
    connect(pll1.Vd, aBCtoDQ1.f_qd0[1]) annotation (
      Line(points={{-227.3,257},{-230,257},{-230,258},{-230,256.333},{-230,
          257.333},{-237.5,257.333}},           color = {0, 0, 127}));
    connect(aBCtoDQ2.f_qd0, pq1.I) annotation (
      Line(points={{-158.5,243},{-172,243},{-172,232},{-202,232},{-202,246},{-193.2,
          246},{-193.2,245.6}},                                                                                  color = {0, 0, 127}, thickness = 0.5));
    connect(pll1.theta, aBCtoDQ1.theta) annotation (
      Line(points={{-215.5,257},{-208,257},{-208,244},{-242,244},{-242,251},{-243,
          251}},                                                                                    color = {0, 0, 127}));
    connect(aBCtoDQ1.f_abc, voltageMeasurementblock1.v_abc) annotation (
      Line(points={{-249,257},{-251.5,257},{-251.5,256},{-254.8,256}},        color = {0, 0, 127}, thickness = 0.5));
    connect(voltageMeasurementblock1.Plug1, vcvs1.Plug2) annotation (
      Line(points = {{-260, 256}, {-263, 256}, {-263, 256}, {-266, 256}, {-266, 264}, {-266, 264}, {-266, 272}}));
    annotation (
      Diagram(coordinateSystem(extent={{-400,200},{100,400}})),
      Icon(coordinateSystem(extent={{-400,200},{100,400}},       initialScale = 0.1), graphics={  Rectangle(origin={
              -145,300},                                                                                                        extent = {{-83, 70}, {83, -70}}), Text(origin={
              -145,305},                                                                                                                                                                  extent = {{-43, 37}, {43, -37}}, textString = "Aggregn. X"), Line(origin={
              -32,304},                                                                                                                                                                                                        points = {{30, 0}, {-30, 0}}, color = {255, 0, 0}, thickness = 1), Line(origin={
              -221.31,285.09},                                                                                                                                                                                                        points = {{-5, 0}, {-27, 0}}, color = {85, 0, 255}, thickness = 0.75), Line(origin={
              -237,246},                                                                                                                                                                                                        points = {{-9, 0}, {9, 0}, {9, 0}}, color = {85, 0, 255}, thickness = 0.75)}),
      __OpenModelica_commandLineOptions = "");
end DER_Feeder;
