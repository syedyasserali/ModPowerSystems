within ModPowerSystems.EmtSinglePhase.Basics;
model VoltageDC
  extends ModPowerSystems.Base.Interfaces.RealValue.SinglePhase.OnePort;

  parameter Modelica.SIunits.Voltage Vnom = 10 "Nominal peak voltage phase-to-neutral";

equation
  v = Vnom;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                                               Ellipse(extent={{
              50,50},{-50,-50}}, lineColor={0,0,0}),
        Line(points={{-100,0},{-50,0}}, color={0,0,0}),
        Line(points={{96,0},{50,0}}, color={0,0,0}),
        Line(points={{28,-4}}, color={0,0,0}),
        Rectangle(
          extent={{-12,20},{-10,-20}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{10,20},{12,-20}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}),                      Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end VoltageDC;
