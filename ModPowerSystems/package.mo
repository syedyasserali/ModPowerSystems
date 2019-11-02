within ;
package ModPowerSystems
  extends Modelica.Icons.Package;
  // Import mathematical constants and functions
  import SI = Modelica.SIunits;
  import Modelica.Constants.pi;
  import Modelica.Math;
  import Modelica.ComplexMath.'abs';
  import Modelica.ComplexMath.arg;
  import Modelica.ComplexMath.fromPolar;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.j;


  annotation (
  preferredView="info",
  uses(Modelica(version="3.2.2"), Complex(version="3.2.2"), ModelicaServices(version = "3.2.2")),
  Documentation(info="<html>
  <p><b>ModPowerSystems</b> is a free package that is developed with the Modelica&reg; language from the
  Modelica Association, see <a href=\"https://www.Modelica.org\">https://www.Modelica.org</a>.</p>   
  <p>It provides model components for power systems. Static phasor, dynamic phasor and electromagnetic transient models are included and 
  reside in separate subpackages.</p> 
  <p><b>Licensed under the Modelica License 2</b><br>
  Copyright &copy; 2015-2018, Institute for Automation of Complex Power Systems, RWTH Aachen University.</p>  
  <p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; 
  it can be redistributed and/or modified under the terms of the Modelica License 2. 
  For license conditions (including the disclaimer of warranty) 
  see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> 
  or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>  
  <p/>
  </html>"));
end ModPowerSystems;
