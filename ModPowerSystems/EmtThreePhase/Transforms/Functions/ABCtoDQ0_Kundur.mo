within ModPowerSystems.EmtThreePhase.Transforms.Functions;

function ABCtoDQ0_Kundur
  input Real f_abc[3];
  input Real theta;
  output Real f_dq0[3];
  
protected
  constant Real[3, 3] K_mat = {{2 / 3 * cos(theta), 2 / 3 * cos(theta - 2 * pi / 3), 2 / 3 * cos(theta + 2 * pi / 3)}, {-2 / 3 * sin(theta), -2 / 3 * sin(theta - 2 * pi / 3), -2 / 3 * sin(theta + 2 * pi / 3)}, {1 / 3, 1 / 3, 1 / 3}};

algorithm
  f_dq0[:] := K_mat * f_abc[:];
  annotation(
    Documentation(info = "<html>
<p>Implemented according to [1].</p>
<p>References:</p>
<p>[1] J. Machowski, J. W. Bialek, und J. R. Bumby, Power system dynamics, 2nd ed. Oxford: John Wiley, 2008. </p>
</html>"));
end ABCtoDQ0_Kundur;
