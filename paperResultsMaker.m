% Id Key
%
% 1: initParamsJvsT
% 2: initParamsSvsKd (course and fine)
% 3: initParamsDenProfile 
% 4: initParamsSvsNu (course and fine)
% 5: paramInput selectivity calc
% 6: nu vs Kd (Laura's script)
% 7: outlet reservoir accumulation 
% 8: Selectivity heatmap Kd vs Nu
% 9: Selectivity heatmap Kd vs Lc
%

function paperResultsMaker( resultsId )

dataPath = 'paperData';
if ~exist( dataPath,'dir' ) 
  mkdir( dataPath )
end
% figure 1: selectivity vs time
if any( resultsId == 1 )
  currId = 1;
  fprintf('making plot %d \n', currId );
  fluxSummary = fluxPDE(0,0,0,0,0,0,'blah','initParamsJvsT');
  saveName = 'figJvsT_data';
  saveExt = '.mat';
  savepath = [ dataPath '/' saveName saveExt];
  if exist( savepath, 'file' )
    fprintf('file exists. renaming file\n');
    saveName = [ saveName datestr(now,'yyyymmdd_HH.MM') ];
  end
  fullName = [saveName saveExt];
  save( fullName, 'fluxSummary' )
  movefile( fullName, dataPath );
end
% figure 2: selectivity vs kd
if any( resultsId == 2 )
  currId = 2;
  fprintf('making plot %d \n', currId );
  fluxSummary = fluxODE(0,0,0,'blah','initParamsSvsKd');
  saveName = 'figSvsKd_data';
  saveExt = '.mat';
  savepath = [ dataPath '/' saveName saveExt];
  if exist( savepath, 'file' )
    fprintf('file exists. renaming file\n');
    saveName = [ saveName datestr(now,'yyyymmdd_HH.MM') ];
  end
  fullName = [saveName saveExt];
  save( fullName, 'fluxSummary' )
  movefile( fullName, dataPath );
end
% figure 3: density profiles
if any( resultsId == 3 )
  currId = 3;
  fprintf('making plot %d \n', currId );
  fluxSummary = fluxODE(0,0,0,'blah','initParamsDenProfile');
  saveName = 'figDenProfile_data';
  saveExt = '.mat';
  savepath = [ dataPath '/' saveName saveExt];
  if exist( savepath, 'file' )
    fprintf('file exists. renaming file\n');
    saveName = [ saveName datestr(now,'yyyymmdd_HH.MM') ];
  end
  fullName = [saveName saveExt];
  save( fullName, 'fluxSummary' )
  movefile( fullName, dataPath );
end


% figure 4: boundary koff, non-linear
if any( resultsId == 4 )
  currId = 4;
  fprintf('making plot %d \n', currId );
  fluxSummary = fluxODE(0,0,0,'blah','initParamsSvsNu');
  saveName = 'figSvsNu_data';
  saveExt = '.mat';
  savepath = [ dataPath '/' saveName saveExt];
  if exist( savepath, 'file' )
    fprintf('file exists. renaming file\n');
    saveName = [ saveName datestr(now,'yyyymmdd_HH.MM') ];
  end
  fullName = [saveName saveExt];
  save( fullName, 'fluxSummary' )
  movefile( fullName, dataPath );
end

% 5: parameter input. 
if any( resultsId == 5 )
  currId = 5;
  fprintf('making plot %d \n', currId );
  loadId = '20171110_param.mat';
  fileId = 'initParamsSelectivityFromInput';
  load( ['paperParamInput/' loadId ]);
  tau = 0.01;
  bt = 1e-3;
  kon = 1e9; % unscaled
  numRuns = size( param, 1 );
  paramInpt = zeros( numRuns, 4 );
  paramInpt(:,1) = param(:,1);
  paramInpt(:,2) = kon * bt * tau;
  paramInpt(:,3) = param(:,2) * tau;
  paramInpt(:,4) = bt;
  fluxSummary = fluxODEParamIn(paramInpt, fileId);
  selectivity.val = fluxSummary.jNorm;
  selectivity.paramLoad = param;
  selectivity.paramInpt = paramInpt;
  saveName = 'selectivityFromInput_data';
  saveExt = '.mat';
  savepath = [ dataPath '/' saveName saveExt];
  if exist( savepath, 'file' )
    fprintf('file exists. renaming file\n');
    saveName = [ saveName datestr(now,'yyyymmdd_HH.MM') ];
  end
  fullName = [saveName saveExt];
  save( fullName, 'fluxSummary','selectivity' )
  movefile( fullName, dataPath );
end
% 6: Laura's script
if any( resultsId == 6 )
  currId = 6;
  fprintf('making plot %d \n', currId );
  [tetherCalc.nu, tetherCalc.kd,tetherCalc.lplc] = makeTetherDBs;
  tetherCalc.nu = tetherCalc.nu.';
  saveName = 'figNuVsKd_data';
  saveExt = '.mat';
  savepath = [ dataPath '/' saveName saveExt];
  if exist( savepath, 'file' )
    fprintf('file exists. renaming file\n');
    saveName = [ saveName datestr(now,'yyyymmdd_HH.MM') ];
  end
  fullName = [saveName saveExt];
  save( fullName, 'tetherCalc' )
  movefile( fullName, dataPath );
end
% 7: Reservior accumulation
if any( resultsId == 7 )
  currId = 7;
  fprintf('making plot %d \n', currId );
  fluxSummary = fluxPDE(0,0,0,0,0,0,'blah','initParamsOutletResAccum');
  saveName = 'figResAccum_data';
  saveExt = '.mat';
  savepath = [ dataPath '/' saveName saveExt];
  if exist( savepath, 'file' )
    fprintf('file exists. renaming file\n');
    saveName = [ saveName datestr(now,'yyyymmdd_HH.MM') ];
  end
  fullName = [saveName saveExt];
  save( fullName, 'fluxSummary' )
  movefile( fullName, dataPath );
end
% 8: Selectivity heat map, Kd vs Nu
if any( resultsId == 8 )
  currId = 8;
  fprintf('making plot %d \n', currId );
  fluxSummary = fluxODE(0,0,0,'blah','initParamsSheatmapKdNu');
  saveName = 'figResSheatmapKdNu_data';
  saveExt = '.mat';
  savepath = [ dataPath '/' saveName saveExt];
  if exist( savepath, 'file' )
    fprintf('file exists. renaming file\n');
    saveName = [ saveName datestr(now,'yyyymmdd_HH.MM') ];
  end
  fullName = [saveName saveExt];
  save( fullName, 'fluxSummary' )
  movefile( fullName, dataPath );
end
% 9: Selectivity heat map, Kd vs lclp
if any( resultsId == 9 )
  currId = 9;
  fprintf('making plot %d \n', currId );
  fluxSummary = fluxODE(0,0,0,'blah','initParamsSheatmapKdLclp');
  saveName = 'figResSheatmapKdLcLp_data';
  saveExt = '.mat';
  savepath = [ dataPath '/' saveName saveExt];
  if exist( savepath, 'file' )
    fprintf('file exists. renaming file\n');
    saveName = [ saveName datestr(now,'yyyymmdd_HH.MM') ];
  end
  fullName = [saveName saveExt];
  save( fullName, 'fluxSummary' )
  movefile( fullName, dataPath );
end

end

