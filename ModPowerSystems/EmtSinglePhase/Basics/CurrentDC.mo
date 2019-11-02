within ModPowerSystems.EmtSinglePhase.Basics;
model CurrentDC
  extends ModPowerSystems.Base.Interfaces.RealValue.SinglePhase.OnePort;

  parameter Modelica.SIunits.Current Inom = 10 "Nominal current";

equation
  i = -Inom;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                                               Ellipse(extent={{
              50,50},{-50,-50}}, lineColor={0,0,0}),
        Line(points={{-100,0},{-50,0}}, color={0,0,0}),
        Line(points={{96,0},{50,0}}, color={0,0,0}),
        Line(points={{28,-4}}, color={0,0,0}),
        Polygon(
          points={{8,4},{28,0},{8,-4},{8,4}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(points={{-32,0},{12,0}},   color={0,0,0})}),        Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CurrentDC;
