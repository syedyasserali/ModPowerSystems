within ModPowerSystems.Base;
model System
  parameter Modelica.SIunits.Frequency freq_nom = 50 "nominal frequency"
   annotation(Evaluate=true, Dialog(group="System Settings"), choices(choice=50 "50 Hz", choice=60 "60 Hz"));

  Real omega;
  Real theta;

equation
  omega = 2*pi*freq_nom;
  theta = omega*time;

  annotation (
  defaultComponentName="system",
  defaultComponentPrefixes="inner",
  missingInnerMessage="No \"system\" component is defined.
    Drag PowerSystems.System into the top level of your model.",
    Icon(
      coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}),
      graphics={
        Rectangle(
          extent={{-100,54},{100,-46}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-100,54},{100,14}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,54},{100,14}},
          lineColor={255,255,255},
          textString = "%name"),
          Text(
          extent={{-90,4},{88,-26}},
          textString="freq. = %freq_nom Hz",
          lineColor={0,0,0},
          horizontalAlignment=TextAlignment.Left)}));
end System;
