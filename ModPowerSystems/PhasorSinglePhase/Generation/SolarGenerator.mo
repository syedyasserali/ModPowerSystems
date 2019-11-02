within ModPowerSystems.PhasorSinglePhase.Generation;
model SolarGenerator
  extends ModPowerSystems.Base.Interfaces.ComplexPhasor.SinglePhase.OnePortGroundedInit;
  // Natural constants
  import Modelica.Constants.k;
  Real q = 1.6e-19;
  Real Kelvin = 273.15;
  // Solar generation constants for model
  replaceable ModPowerSystems.PhasorSinglePhase.Generation.ModelConstants.SolarGenerators.RecordZhouBP580 model_data constrainedby
    ModPowerSystems.PhasorSinglePhase.Generation.ModelConstants.SolarGenerators.BaseRecord
                                                                                                                                                                                                            annotation (
     choices(choice(redeclare ModPowerSystems.PhasorSinglePhase.Generation.ModelConstants.SolarGenerators.RecordZhouBP580 model_data "Zhou BP580")));
  // Parameters for entire array
  parameter Modelica.SIunits.ActivePower Pnom = 5000 "installed nominal power" annotation (
    Evaluate = false);
  parameter String profileFileName = "NoName" "file where matrix is stored" annotation (
    Dialog(loadSelector(filter = "Text files (*.txt);;MATLAB MAT-files (*.mat)", caption = "Open file in which table is present")));
  parameter String profileName = "NoName" "table name on file";
  parameter Boolean StatusOn = true "generator on/off" annotation (
    Evaluate = false);
  parameter Integer ControllerType = 0 "0 = No control, 1 = Q provision, 2 = P curtailment at plant, 3 = P curtailment at PCC" annotation (
    Evaluate = false);
  parameter Real CurtailLimit = 70.0 "curtailment limit for active power (only effective for controller types 2 and 3)";
  parameter Boolean enableOutputPsolar = false annotation (
    Dialog(group = "Data in/out"),
    choices(checkBox = true));
  parameter Boolean enableInputPload = false annotation (
    Dialog(group = "Data in/out"),
    choices(checkBox = true));
  // Preset variables
  Modelica.Blocks.Sources.CombiTimeTable pvProfile(tableOnFile = true, tableName = profileName, fileName = profileFileName, table = fill(0.0, 0, 4), extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic);
  Real G = pvProfile.y[1] + pvProfile.y[2] "total radiation profile";
  Real Temp = pvProfile.y[3] + Kelvin "temperature profile in Kelvin";
  Real N_s = 1 "modules connected in series, here no series connection assumed";
  Real N_p = Pnom / model_data.P_module0 "module connected in parallel to obtain Pnom";
  // Variables to be calculated
  Real I_sc "short circuit current";
  Real V_oc "open circuit voltage";
  Real v_oc "normalized open circuit voltage";
  Real FF_0 "Fill factor of ideal PV module";
  Real FF "Fill factor";
  Real P_module "module power output";
  Real P_gen "active array power with curtailment";
  Real W_loss(start = 0) "energy loss due to active power curtailment";
  Real W_total(start = 0) "total energy produced without curtailment";
  Real W_rel "relative energy loss";
  Real P_rel "active array power relative to nominal power";
  Real PF "power factor";
  Modelica.Blocks.Interfaces.RealInput P_loadIn if enableInputPload "input pin for load measurement (necessary only for control type 3)" annotation (
    Placement(transformation(extent = {{-120, -30}, {-80, 10}}), iconTransformation(extent = {{-100, -16}, {-70, 14}})));
  Modelica.Blocks.Interfaces.RealOutput P_loadMeas "support output to allow for parameter dependent load measurement input pin";
  Modelica.Blocks.Interfaces.RealOutput P_solarOut = -P if enableOutputPsolar "active power output out of the solar generator" annotation (
    Placement(transformation(extent = {{60, -26}, {100, 14}}), iconTransformation(extent = {{70, -16}, {100, 14}})));
equation
// Calculation of maximum active power generation
  if noEvent(StatusOn and G > 0) then
    I_sc = model_data.I_sc0 * (G / model_data.G_0) ^ model_data.alpha;
    V_oc = model_data.V_oc0 / (1 + model_data.beta * log(model_data.G_0 / G)) * (model_data.T_0 / Temp) ^ model_data.gamma;
    v_oc = V_oc / model_data.n_s / (model_data.n * k * Temp / q);
    FF_0 = (v_oc - log(v_oc + 0.72)) / (1 + v_oc);
    FF = FF_0 * (1 - model_data.R_s / (V_oc / (model_data.n_s * I_sc)));
    P_module = FF * V_oc * I_sc;
    P_gen = P_module * N_s * N_p;
  else
    I_sc = 0;
    V_oc = 0;
    v_oc = 0;
    FF_0 = 0;
    FF = 0;
    P_module = 0;
    P_gen = 0;
  end if;
  if noEvent(StatusOn and ControllerType == 0) then
// Calculation of active power (Type0 -> full active power feed-in)
    P = -P_gen;
    P_rel = P_gen / Pnom;
// Calculation of reactive power (Type0 -> no reactive power provision)
    PF = 1;
    Q = 0;
  elseif noEvent(StatusOn and ControllerType == 1) then
// Calculation of active power (Type1 -> full active power feed-in)
    P = -P_gen;
    P_rel = P_gen / Pnom;
// Calculation of reactive power (Type1 -> reactive power provision according to VDE AR-N 4105)
    if noEvent(Pnom > 3600 and Pnom <= 13800 and P_rel > 0.5) then
      PF = (-0.1 * P_rel) + 1.05;
      Q = P_gen / PF * sin(acos(PF));
    elseif noEvent(Pnom > 13800 and P_rel > 0.5) then
      PF = (-0.2 * P_rel) + 1.1;
      Q = P_gen / PF * sin(acos(PF));
    else
      PF = 1;
      Q = 0;
    end if;
  elseif noEvent(StatusOn and ControllerType == 2) then
// Calculation of active power (Type2 -> active power curtailment at plant)
    P = if noEvent(P_gen > CurtailLimit / 100 * Pnom) then -CurtailLimit / 100 * Pnom else -P_gen;
    P_rel = -P / Pnom;
// Calculation of reactive power (Type2 -> no reactive power provision)
    PF = 1;
    Q = 0;
  elseif noEvent(StatusOn and ControllerType == 3) then
// Calculation of active power (Type3 -> active power curtailment at PCC)
    P = if noEvent(P_gen - P_loadMeas > CurtailLimit / 100 * Pnom) then -(CurtailLimit / 100 * Pnom + P_loadMeas) else -P_gen;
    P_rel = -P / Pnom;
// Calculation of reactive power (Type3 -> no reactive power provision)
    PF = 1;
    Q = 0;
  else
    P = 0;
    P_rel = 0;
    PF = 1;
    Q = 0;
  end if;
// general equations
  der(W_loss) = P_gen + P;
// note: P = -P_gen_actual
  der(W_total) = P_gen;
  W_rel = if noEvent(W_total > 0) then W_loss / W_total else 0;
// equations allowing for parameter dependent load measurement input pin
  if not enableInputPload then
    P_loadMeas = 0;
  end if;
  connect(P_loadMeas, P_loadIn);
  annotation (
    Documentation(info = "<html>   
  <p>
  The model is according to the paper \"A novel model for photovoltaic array performance prediction\" by Wei Zhou et al.
  </p>  
  
</html>"),
    Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Line(points = {{0, 100}, {0, 50}}), Ellipse(extent = {{-50, 50}, {50, -50}}, endAngle = 360), Text(extent = {{-100, -100}, {100, -60}}, textString = "%name"), Text(extent = {{-30, 30}, {30, -30}}, textString = "SG")}),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end SolarGenerator;

