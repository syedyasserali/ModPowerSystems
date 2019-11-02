within ModPowerSystems.Base.Interfaces.RealValue.ThreePhase;
connector Plug
  ModPowerSystems.Base.Interfaces.RealValue.SinglePhase.Pin[3] Pins;

  annotation (
    Icon(
      coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}),
        graphics={
          Rectangle(
            extent={{50,50},{-50,-50}},
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
end Plug;
