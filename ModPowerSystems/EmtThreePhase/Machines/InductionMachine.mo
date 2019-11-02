within ModPowerSystems.EmtThreePhase.Machines;
partial model InductionMachine
  import ModPowerSystems;
  extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePortGrounded;
  outer ModPowerSystems.Base.System system;

  // reference frame characteristics
  parameter Integer ref_frame(min=1,max=3) annotation(choices(choice=1 "stationary reference frame", choice=2 "reference frame rotating with rotor", choice=3 "reference frame rotating synchronously"));
  Real theta(start=0);  // angular position of reference frame
  Real omega;  // angular velocity of reference frame

  // machine characteristics
  parameter SI.Resistance R_s; // stator resistance
  parameter SI.Resistance R_r; // rotor resistance (referred to stator)
  parameter SI.Inductance L_ls; // stator leakage inductance
  parameter SI.Inductance L_M; // magnetizing inductance
  parameter SI.Inductance L_lr; // rotor leakage inductance (referred to stator)
  parameter Integer p; // number of pole pairs
  parameter Real J; // rotor inertia
  parameter Real T_L; // load torque at rotor

  // stator variables
  SI.Voltage v_qd0s[3];  // stator voltages in reference frame
  SI.Current i_qd0s[3];  // stator currents in reference frame
  Real lambda_qd0s[3];  // stator flux linkages in reference frame

  // rotor variables
  SI.Voltage v_qd0r[3];  // rotor voltages in reference frame
  SI.Current i_qd0r[3];  // rotor currents in reference frame
  Real lambda_qd0r[3];  // rotor flux linkages in reference frame

  // electromechanical variables
  Real omega_r(start=0);  // electrical angular velocity of rotor
  Real omega_rm(start=0);  // mechanical angular velocity of rotor
  Real T_e; // electromagnetic torque

  // matrices of machine parameters (in arbitrary reference frame)
  Real[3,3] r_s = diagonal({R_s,R_s,R_s});
  Real[3,3] r_r = diagonal({R_r,R_r,R_r});
  Real[3,3] L_s = diagonal({L_ls+L_M,L_ls+L_M,L_ls});
  Real[3,3] L_r = diagonal({L_lr+L_M,L_lr+L_M,L_lr});
  Real[3,3] L_sr = diagonal({L_M,L_M,0});

equation
  // reference frame charactistics
  if noEvent(ref_frame==1) then
    omega = 0;
  elseif noEvent(ref_frame==2) then
    omega = omega_r;
  elseif noEvent(ref_frame==3) then
    omega = system.omega;
  end if;
  omega = der(theta);

  // variable transformation to reference frame
  v_qd0s[:] =ModPowerSystems.EmtThreePhase.Transforms.Functions.ABCtoQD0_Krause(
    v[:], theta);
  i_qd0s[:] =ModPowerSystems.EmtThreePhase.Transforms.Functions.ABCtoQD0_Krause(
    i[:], theta);

  // voltage equations in reference frame
  v_qd0s[:] = r_s*i_qd0s[:] + omega*{lambda_qd0s[2],-lambda_qd0s[1],0} + der(lambda_qd0s[:]);
  v_qd0r[:] = r_r*i_qd0r[:] + (omega-omega_r)*{lambda_qd0r[2],-lambda_qd0r[1],0} + der(lambda_qd0r[:]);

  // flux linkage equations in reference frame
  lambda_qd0s[:] = L_s*i_qd0s[:] + L_sr*i_qd0r[:];
  lambda_qd0r[:] = L_sr*i_qd0s[:] + L_r*i_qd0r[:];

  // electromechanical equations
  der(omega_r) = p/J*(T_e - T_L);
  T_e = 3/2*p*L_M*(i_qd0s[1]*i_qd0r[2]-i_qd0s[2]*i_qd0r[1]);
  omega_r = p*omega_rm;

  annotation (Icon(graphics={
        Ellipse(extent={{-40,40},{40,-40}}, lineColor={0,0,0}),
        Ellipse(extent={{-60,60},{60,-60}}, lineColor={0,0,0}),
        Line(points={{0,96},{0,60}}, color={0,0,0}),
        Text(
          extent={{-30,26},{30,-26}},
          lineColor={0,0,0},
          textString="IM")}), Documentation(info="<html>
<p>Model equations according to &QUOT;Krause, Paul C.; Wasynczuk, Oleg; Sudhoff, Scott D.; Pekarek, Steven (2013): Analysis of electric machinery and drive systems&QUOT;. In particular, refer to chapter 6 (pp. 215-270).</p>
</html>"));
end InductionMachine;
