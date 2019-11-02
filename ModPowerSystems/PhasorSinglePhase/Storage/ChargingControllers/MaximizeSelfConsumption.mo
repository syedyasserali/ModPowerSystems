within ModPowerSystems.PhasorSinglePhase.Storage.ChargingControllers;
model MaximizeSelfConsumption

  Modelica.Blocks.Interfaces.RealInput P_PV annotation (Placement(
        transformation(extent={{-120,-10},{-80,30}}), iconTransformation(extent={{-100,10},
            {-80,30}})));
  Modelica.Blocks.Interfaces.RealInput P_Load annotation (Placement(
        transformation(extent={{-100,-40},{-60,0}}), iconTransformation(extent={{-100,
            -30},{-80,-10}})));
  Modelica.Blocks.Interfaces.RealOutput P_Bat annotation (Placement(transformation(extent={{80,-10},
            {100,10}}), iconTransformation(extent={{80,-10},{100,10}})));

equation
  P_Bat = P_PV-P_Load;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-80,60},{80,-60}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-58,32},{62,-28}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Max SC")}), Diagram(coordinateSystem(preserveAspectRatio=false)));
end MaximizeSelfConsumption;
