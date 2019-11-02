within ModPowerSystems.PhasorSinglePhase.Storage;
model BatteryIdeal "Ideal battery storage with no losses"
  import ModPowerSystems;
  extends
    ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGroundedInit;

  parameter Real C_nom = 5000 "usable battery capacity in Wh" annotation(Evaluate=false);
  parameter Boolean enableOutputWbat = false  annotation (Dialog(group="Data in/out"),choices(checkBox=true));
  parameter Boolean StatusOn = true "battery system on/off" annotation(Evaluate=false);

  Real P_bat "battery charging power";
  Real SOC(start=0) "state of charge";

  Modelica.Blocks.Interfaces.RealInput P_batIn
    "input signal for battery charging power"                                            annotation (Placement(transformation(extent={{-110,
            -40},{-70,0}}),
        iconTransformation(extent={{-110,-40},{-80,-10}})));

  Modelica.Blocks.Interfaces.RealOutput W_batOut=SOC*C_nom if  enableOutputWbat
    "output signal for energy level of battery in Wh"                                                                              annotation (Placement(
        transformation(extent={{72,-40},{112,0}}),iconTransformation(extent={{72,-40},
            {102,-10}})));

equation
  if StatusOn and C_nom>0 then
    if noEvent(P_batIn>0 and SOC<1) or noEvent(P_batIn<0 and SOC>0) then
      P_bat = P_batIn;
    else
      P_bat = 0;
    end if;
    der(SOC)= P_bat/(C_nom*3600);
  else
    P_bat=0;
    der(SOC)=0;
  end if;

  P_bat/3 = real(v*conj(i));
  0 = imag(v*conj(i));

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),
      graphics={
        Line(points={{-52,-92},{52,-92},{48,-92}}),
        Rectangle(extent={{-46,-84},{46,20}},
          fillPattern = FillPattern.Solid),
        Polygon(points={{-46,20},{46,40},{46,20},{-46,20}},
          pattern = LinePattern.None,
          lineThickness = 0.5,
          fillPattern = FillPattern.Solid),
        Polygon(points={{-50,-18},{50,2},{50,6},{-50,-14},{-50,-18}},
          lineColor = {255, 255, 255},
          fillColor = {255, 255, 255},
          fillPattern = FillPattern.Solid),
        Polygon(points={{-52,-62},{48,-42},{48,-38},{-52,-58},{-52,-62}},
          lineColor = {255, 255, 255},
          fillColor = {255, 255, 255},
          fillPattern = FillPattern.Solid),
        Line(points={{0,100},{0,62}}),
        Line(points={{-52,-92},{-52,48},{-20,48},{-20,62},{20,62},{20,48},{52,
              48},{52,-92}})}), Documentation(info="<html>
The model is according to the paper \"Battery behavior prediction and battery working states analysis of a hybrid solar–wind power generation system\" by Zhou et al. <br>
</html>"),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})));
end BatteryIdeal;
