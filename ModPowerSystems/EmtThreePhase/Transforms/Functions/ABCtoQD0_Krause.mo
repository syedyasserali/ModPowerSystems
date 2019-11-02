within ModPowerSystems.EmtThreePhase.Transforms.Functions;
function ABCtoQD0_Krause
  input Real f_abc[3];
  input Real theta;
  output Real f_qd0[3];

protected
          constant Real[3,3] K_mat = {{2/3*cos(theta),2/3*cos(theta-2*pi/3),2/3*cos(theta+2*pi/3)},{-2/3*sin(theta),-2/3*sin(theta-2*pi/3),-2/3*sin(theta+2*pi/3)},{1/3,1/3,1/3}};

algorithm
  f_qd0[:] := K_mat*f_abc[:];

end ABCtoQD0_Krause;
