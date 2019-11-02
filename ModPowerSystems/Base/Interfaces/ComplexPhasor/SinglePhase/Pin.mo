within ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase;
connector Pin "Pin/Terminal with voltage potential and current flow"
  Modelica.SIunits.ComplexVoltage v "Complex potential at the node";
  flow Modelica.SIunits.ComplexCurrent i "Complex current flowing into the pin";
  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}),
        graphics={
          Rectangle(
            extent={{60,60},{-60,-60}},
            fillPattern=FillPattern.Solid)}),
    Diagram(
      coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}),
        graphics={
          Rectangle(
            extent={{50,50},{-50,-50}},
            fillPattern=FillPattern.Solid)}),
    Documentation(
      info="
        <html>         
            The potential of this connector is the complex voltage and the flow variable is the complex current.          
        </html>"));
end Pin;
