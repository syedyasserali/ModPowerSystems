within ModPowerSystems.EmtThreePhase.Examples.BasicGrids;

model VoltageAC_InductionMachine
  ModPowerSystems.EmtThreePhase.Basics.Ground ground(Vnom = 0) 
    annotation (Placement(transformation(extent={{-40,-18},{-20,2}})));
  inner ModPowerSystems.Base.System system(freq_nom = 60)
    annotation (Placement(transformation(extent={{-70,74},{-50,94}})));
  ModPowerSystems.EmtThreePhase.Basics.VoltageAC voltageAC(Vpeak=sqrt(2)*220/sqrt(3))
                           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,8})));
  ModPowerSystems.EmtThreePhase.Machines.InductionMachineSquirrelCage inductionMachineSquirrelCage(
    
    J=0.089,
    L_M=69.31e-3,
    L_lr=2e-3,
    L_ls=2e-3,
    R_r=0.816,R_s=0.435,
    T_L=0, Vnom = 220,
    p=2,
    ref_frame=3)
            annotation (Placement(transformation(extent={{26,-12},{46,8}})));
equation
  connect(ground.Plug1,voltageAC.Plug2)
    annotation (Line(points={{-30,2},{-30,8},{-10,8}},  color={0,0,0}));
  connect(voltageAC.Plug1, inductionMachineSquirrelCage.Plug1)
    annotation (Line(points={{10,8},{36,8}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end VoltageAC_InductionMachine;
