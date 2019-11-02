within ModPowerSystems.PhasorSinglePhase.Storage.ChargingControllers;
model StaticPeakShaving

  parameter Real P_PSLimit annotation(Evaluate=false);

  Modelica.Blocks.Interfaces.RealInput P_PV annotation (Placement(
        transformation(extent={{-120,-10},{-80,30}}), iconTransformation(extent={{-100,10},
            {-80,30}})));
  Modelica.Blocks.Interfaces.RealInput P_Load annotation (Placement(
        transformation(extent={{-100,-40},{-60,0}}), iconTransformation(extent={{-100,
            -30},{-80,-10}})));
  Modelica.Blocks.Interfaces.RealOutput P_Bat annotation (Placement(transformation(extent={{80,-10},
            {100,10}}), iconTransformation(extent={{80,-10},{100,10}})));

equation
  if noEvent(P_PV-P_Load-P_PSLimit>0) then
     P_Bat = P_PV-P_Load-P_PSLimit;
  elseif noEvent(P_PV-P_Load<0) then
     P_Bat = P_PV-P_Load;
  else
     P_Bat = 0;
  end if;

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
          textString="Static PS")}),
                Diagram(coordinateSystem(preserveAspectRatio=false)));
end StaticPeakShaving;
