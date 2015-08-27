% Builds the parameter object for the reaction diffusion equation

function [ParamObj] = ParamObjMakerRD(SaveMe,ChemOnEndPts,Nx,Lbox,Lr,A_BC,C_BC,Kon,Koff,nu,...
Dnl,NLcoup,Bt,AL,AR,trial)

% Put Parameters in a structure
ParamObj   = struct('trial',trial,'SaveMe',SaveMe, 'ChemOnEndPts',ChemOnEndPts,...
    'Nx',Nx,'Lbox',Lbox,'Lr',Lr,...
'A_BC',A_BC,'C_BC',C_BC,...
    'Kon', Kon, 'Koff', Koff,'KDinv',Kon/Koff,...
    'nu',nu,'Dnl',Dnl,'NLcoup',NLcoup,...
    'Bt',Bt,'AL',AL,'AR',AR);
end
