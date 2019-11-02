within ModPowerSystems.EmtThreePhase.Transforms.Functions;
function DQtoABC
  input Real f_dq[2];
  input Real theta;
  output Real f_abc[3];

protected
          constant Real[3,2] K_mat = {{cos(theta),-sin(theta)},{cos(theta-2*pi/3),-sin(theta-2*pi/3)},{cos(theta+2*pi/3),-sin(theta+2*pi/3)}};

algorithm
  f_abc[:] := K_mat*f_dq[:];

end DQtoABC;
