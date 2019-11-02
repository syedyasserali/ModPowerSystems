within ModPowerSystems.Base.Transforms;

function DQ1toDQ2_Kundur
  input Real f_dq1[2];
  input Real theta;
  output Real f_dq2[2];

protected
  constant Real[2,2] K_mat = {{cos(theta),sin(theta)},{-sin(theta),cos(theta)}};

algorithm
  f_dq2[:] := K_mat*f_dq1[:];
end DQ1toDQ2_Kundur;
