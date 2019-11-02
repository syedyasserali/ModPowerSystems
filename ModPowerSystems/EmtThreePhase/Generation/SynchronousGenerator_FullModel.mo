within ModPowerSystems.EmtThreePhase.Generation;
model SynchronousGenerator_FullModel
   extends ModPowerSystems.Base.Interfaces.RealValue.ThreePhase.OnePortGrounded;

  Modelica.Blocks.Interfaces.RealInput P_m_in
  annotation (Placement(transformation(extent={{-113,10},{-93,30}}),  iconTransformation(extent={{-113,10},
            {-93,30}})));
  Modelica.Blocks.Interfaces.RealInput v_fd_in annotation (Placement(transformation(extent={{-113,
            -30},{-93,-10}}),                                                                                   iconTransformation(extent={{-113,
            -30},{-93,-10}})));

  // general machine characteristics
  parameter Real V_nom = 24e3 "Nominal phase-to-phase RMS voltage";
  parameter Real P_nom = 555e6 "Nominal turbine (active) power (MW)";
  parameter Real f_nom = 60 "Nominal frequency";
  parameter Real p = 1 "Number of pole pairs";
  parameter Real H = 3.7 "Inertia constant";

  // machine parameters in per-unit system
  parameter Real R_s = 0.003 "Stator Resistance";
  parameter Real L_l = 0.15 "Stator leakage";
  parameter Real L_md = 1.6599 "d axis mutual inductance";
  parameter Real L_mq = 1.61 "q axis mutual inductance";
  parameter Real R_fd = 0.0006 "Rotor Resistance";
  parameter Real L_lfd = 0.1648 "Rotor leakage";
  parameter Real R_kd = 0.0284 "d axis damper winding resistance";
  parameter Real L_lkd = 0.1713 "d axis damper winding leakage";
  parameter Real R_kq1 = 0.0062 "q axis damper 1 winding resistance";
  parameter Real L_lkq1 = 0.7252 "q axis damper 1 winding leakeage";
  parameter Real R_kq2 = 0.0237 "q axis damper 2 winding resistance";
  parameter Real L_lkq2 = 0.125 "q axis damper 2 winding leakeage";

  // initialization parameters
  parameter Real P_init = 0.001 "Initial active power";
  parameter Real Q_init = 0 "initial reactive power";
  parameter Real theta_volt_init = -Modelica.Constants.pi/2 "initial voltage angle";

  // machine constants deduced from machine characteristics
  parameter Real omega_nom = 2 * Modelica.Constants.pi * f_nom "Nominal angular frequency";

  // base quantities of pu-system deduced from machine characteristics
  parameter Real v_b = sqrt(2/3)*V_nom; // base = phase-to-ground peak voltage
  parameter Real i_b = 2/3*P_nom/v_b; // base = line peak current per phase
  parameter Real omega_b = omega_nom/p;

  // --- initial values ---
  parameter Real S_init = sqrt(P_init^2+Q_init^2);
  parameter Real vt_init = sqrt(2/3)*V_nom/v_b;
  parameter Real it_init = S_init/vt_init;
  parameter Real pf_init = acos(P_init/S_init);
  parameter Real delta_init = atan(((L_mq + L_l) * it_init * cos(pf_init) - R_s * it_init * sin(pf_init)) / (vt_init + R_s * it_init * cos(pf_init) + (L_mq + L_l) * it_init * sin(pf_init)));

  // electrical variables
  parameter Real v_d_init = vt_init * sin(delta_init); // stator
  parameter Real v_q_init = vt_init * cos(delta_init);
  parameter Real i_d_init = it_init * sin(delta_init + pf_init);
  parameter Real i_q_init = it_init * cos(delta_init + pf_init);
  parameter Real i_fd_init = (v_q_init + R_s * i_q_init + (L_md + L_l) * i_d_init) / L_md; // rotor
  parameter Real v_fd_init = R_fd * i_fd_init;

  // magnetic flux variables
  parameter Real Psi_d_init = v_q_init + R_s * i_q_init;
  parameter Real Psi_q_init = -v_d_init - R_s * i_d_init;
  parameter Real Psi_fd_init = (L_md + L_lfd) * i_fd_init - L_md * i_d_init;
  parameter Real Psi_kd_init = L_md * (i_fd_init - i_d_init);
  parameter Real Psi_kq1_init = -L_mq * i_q_init;
  parameter Real Psi_kq2_init = -L_mq * i_q_init;

  // electromechanical variables
  parameter Real omega_re_init = 1;
  parameter Real omega_rm_init = omega_re_init/p;
  parameter Real T_e_init = Psi_d_init*i_q_init - Psi_q_init*i_d_init;
  parameter Real theta_re_init = theta_volt_init + delta_init - Modelica.Constants.pi/2;

  // --- variable declaration ---
  // magnetic flux variables
  Real Psi_d(start=Psi_d_init);
  Real Psi_q(start=Psi_q_init);
  Real Psi_fd(start=Psi_fd_init);
  Real Psi_kd(start=Psi_kd_init);
  Real Psi_kq1(start=Psi_kq1_init);
  Real Psi_kq2(start=Psi_kq2_init);

  // electrical variables
  Real v_d(start=v_d_init);
  Real v_q(start=v_q_init);
  Real v_fd = v_fd_in / v_b;
  Real i_d(start=i_d_init);
  Real i_q(start=i_q_init);
  Real i_kd(start=0);
  Real i_kq1(start=0);
  Real i_kq2(start=0);
  Real i_fd(start=i_fd_init);

  // electromechanical variables
  Real omega_re(start=omega_re_init);  // electrical angular velocity of rotor
  Real omega_rm(start=omega_rm_init);  // mechanical angular velocity of rotor
  Real theta_re(start=theta_re_init);  // electrical angular position of rotor
  Real P_m = P_m_in / P_nom;
  Real T_e(start=T_e_init);
  Real T_m;

equation
  // connected in star
  i[1] + i[2] + i[3] = 0;

  // variable transformation to dq reference frame and pu-system
  {v_d, v_q} =Transforms.Functions.ABCtoDQ_Kundur(v[:]/v_b, theta_re);
  {i_d, i_q} =Transforms.Functions.ABCtoDQ_Kundur(-i[:]/i_b, theta_re);

  // magnetic flux linkage equations (from [1] eq. 3.127-3.133)
  Psi_d = -(L_l+L_md)*i_d + L_md*i_fd + L_md*i_kd; // stator
  Psi_q = -(L_l+L_mq)*i_q + L_mq*i_kq1 + L_mq*i_kq2;
  Psi_fd = -L_md*i_d + (L_md+L_lfd)*i_fd + L_md*i_kd; // rotor
  Psi_kd = -L_md*i_d + L_md*i_fd + (L_md+L_lkd)*i_kd;
  Psi_kq1 = -L_mq*i_q + (L_lkq1+L_mq)*i_kq1 + L_mq*i_kq2;
  Psi_kq2 = -L_mq*i_q + L_mq*i_kq1 + (L_lkq2+L_mq)*i_kq2;

  // voltage equations (from [1] eq. 3.120-3.126)
  v_d = - R_s*i_d - Psi_q*omega_re + der(Psi_d)/omega_b; // stator
  v_q = - R_s*i_q + Psi_d*omega_re + der(Psi_q)/omega_b;
  v_fd = R_fd*i_fd + der(Psi_fd)/omega_b; // rotor
  0 = R_kd*i_kd + der(Psi_kd)/omega_b;
  0 = R_kq1*i_kq1 + der(Psi_kq1)/omega_b;
  0 = R_kq2*i_kq2 + der(Psi_kq2)/omega_b;

  // electromechanical equations
  T_m = P_m / omega_rm;
  T_e = Psi_d*i_q - Psi_q*i_d; // from [1] eq. 3.134
  der(omega_rm) = 1/(2*H) * (T_m - T_e); // from [1] eq. 3.198
  omega_re = p*omega_rm;
  der(theta_re) = omega_re*omega_b;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(extent={{-60,58},{60,-62}}, lineColor={0,0,0}),
        Ellipse(extent={{-40,38},{40,-42}}, lineColor={0,0,0}),
        Text(
          extent={{-30,26},{30,-26}},
          lineColor={0,0,0},
          textString="SG"),
        Line(points={{0,94},{0,58}}, color={0,0,0})}),           Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>References:</p>
<p>[1] P. Kundur, N. J. Balu, und M. G. Lauby, Power system stability and control. New York; London: McGraw-Hill, 1994. </p>
</html>"));
end SynchronousGenerator_FullModel;
