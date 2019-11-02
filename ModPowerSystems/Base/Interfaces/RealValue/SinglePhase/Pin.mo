within ModPowerSystems.Base.Interfaces.RealValue.SinglePhase;
connector Pin "Pin/Terminal with voltage potential and current flow"
  SI.Voltage v "Potential at the pin";
  flow SI.Current i "Current flowing into the pin";

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
