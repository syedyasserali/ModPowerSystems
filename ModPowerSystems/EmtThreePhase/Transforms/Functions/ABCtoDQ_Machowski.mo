within ModPowerSystems.EmtThreePhase.Transforms.Functions;
function ABCtoDQ_Machowski "Power invariant and lagging second axis"
  input Real f_abc[3];
  input Real theta;
  output Real f_dq[2];

  constant Real[2,3] K_mat = {{sqrt(2/3)*cos(theta),sqrt(2/3)*cos(theta-2*pi/3),sqrt(2/3)*cos(theta+2*pi/3)},{sqrt(2/3)*sin(theta),sqrt(2/3)*sin(theta-2*pi/3),sqrt(2/3)*sin(theta+2*pi/3)}};

algorithm
  f_dq[:] := K_mat*f_abc[:];

  annotation (Documentation(info="<html>
<p>Implemented according to [1].</p>
<p>References:</p>
<p>[1] J. Machowski, J. W. Bialek, und J. R. Bumby, Power system dynamics, 2nd ed. Oxford: John Wiley, 2008. </p>
</html>"));
end ABCtoDQ_Machowski;
