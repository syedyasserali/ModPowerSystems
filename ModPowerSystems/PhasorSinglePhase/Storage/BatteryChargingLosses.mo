within ModPowerSystems.PhasorSinglePhase.Storage;
model BatteryChargingLosses
  "Battery storage including losses due to charging efficiency and self-discharge"
  import ModPowerSystems;
  extends
    ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGroundedInit;

  parameter Real C_nom = 5000 "usable battery capacity in Wh";
  parameter Real eta_ch = 0.9 "charging efficiency";
  parameter Real eta_disch = 0.9 "discharging efficiency";
  parameter Boolean enableOutputWbat = false  annotation (Dialog(group="Data in/out"),choices(checkBox=true));
  parameter Boolean StatusOn = true "battery system on/off" annotation(Evaluate=false);
  parameter Real P_Signal = 0;
  parameter Real P_max = 0;

  Real P_Bat "battery charging power";
  Real SOC(start=0) "state of charge";
  SI.Voltage V(start=Vnom) "voltage measurement";
  SI.Current I "current measurement";

//  Modelica.Blocks.Interfaces.RealInput P_batIn
//    "input signal for battery charging power"                                            annotation (Placement(transformation(extent={{-100,
//            -30},{-60,10}}),
//        iconTransformation(extent={{-110,-40},{-80,-10}})));
  Modelica.Blocks.Interfaces.RealOutput W_batOut=SOC*C_nom if  enableOutputWbat
    "output signal for energy level of battery in Wh"                                                                              annotation (Placement(
        transformation(extent={{82,-30},{122,10}}),
                                                  iconTransformation(extent={{72,-40},
            {102,-10}})));
equation
  if noEvent(StatusOn and C_nom>0) then
    if (P_Signal>0 and SOC<1) or (P_Signal<0 and SOC>0) then
      P_Bat = P_Signal;
    else
      P_Bat= 0;
    end if;

    if P_Bat>=0 then
      der(SOC)=eta_ch*P_Bat/(C_nom*3600);
    else
      der(SOC)=P_Bat/(eta_disch*C_nom*3600);
    end if;
  else
    P_Bat=0;
    der(SOC)=0;
  end if;

  P_Bat/3 = real(v*conj(i));
  0 = imag(v*conj(i));
  V = sqrt(3)*'abs'(v);
  I = 'abs'(i);

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
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
</html>"));
end BatteryChargingLosses;
