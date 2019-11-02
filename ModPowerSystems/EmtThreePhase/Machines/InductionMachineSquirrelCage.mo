within ModPowerSystems.EmtThreePhase.Machines;
model InductionMachineSquirrelCage
  extends InductionMachine;

equation
  v_qd0r[:] = {0,0,0};
  annotation (Documentation(info="<html>
<p>Model equations according to &QUOT;Krause, Paul C.; Wasynczuk, Oleg; Sudhoff, Scott D.; Pekarek, Steven (2013): Analysis of electric machinery and drive systems&QUOT;. In particular, refer to chapter 6 (pp. 215-270).</p>
</html>"));
end InductionMachineSquirrelCage;
