within ModPowerSystems.PhasorSinglePhase.Loads;

model ZIPLoad
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGroundedInit(
                                                                              v(re(start=Vnom), im(start=0)));

  parameter SI.ActivePower P0 = 0.5e6 "initial active power";
  parameter SI.ReactivePower Q0 = 0.5e6 "initial reactive power";
  parameter SI.Voltage V0 = 11e3 "initial operating voltage";
  parameter Real a0, a1, a2, b0, b1, b2; 
  
equation
    P = P0*(a0 + a1*Vpp/V0 + a2*((Vpp*Vpp)/(V0*V0)));
    Q = Q0*(b0 + b1*Vpp/V0 + b2*((Vpp*Vpp)/(V0*V0)));

  annotation (
   Icon(
     coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}),
      graphics={
        Line(
          points={{0,100},{0,20}},
          color={0,0,0}),
        Polygon(
          points={{0,-40},{-20,20},{20,20}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Text(
          extent={{100,-100},{-100,-60}},
          textString = "ZIP")}));

end ZIPLoad;
