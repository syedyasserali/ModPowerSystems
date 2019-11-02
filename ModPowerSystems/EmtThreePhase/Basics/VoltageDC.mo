within ModPowerSystems.EmtThreePhase.Basics;
model VoltageDC
  "Constant voltage source. Note: same direction of voltage and current arrows (since component inherits consumer arrow system from OnePort), consequently current is negative when acting as source."
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePort;

  parameter SI.Voltage V[3] = {10,20,30};

equation
  v[:] = V[:];
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                                               Ellipse(extent={{
              50,50},{-50,-50}}, lineColor={0,0,0}),
        Line(points={{-100,0},{-50,0}}, color={0,0,0}),
        Line(points={{96,0},{50,0}}, color={0,0,0}),
        Line(points={{-2.22045e-016,-1.35963e-032},{24,-3.67395e-016}},
                                      color={0,0,0},
          origin={-30,-12},
          rotation=90),
        Line(points={{28,-4}}, color={0,0,0}),
        Line(points={{-2.22045e-016,-1.35963e-032},{24,-3.67395e-016}},
                                      color={0,0,0},
          origin={-18,0},
          rotation=180),
        Line(points={{-2.22045e-016,-1.35963e-032},{24,-3.67395e-016}},
                                      color={0,0,0},
          origin={40,0},
          rotation=180)}),                                       Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end VoltageDC;
