% Builds the time structure
function [analysisFlags] = analysisFlagsMakerRD(TrackAccumFromFlux,...
    TrackAccumFromFluxPlot, PlotMeMovAccum, PlotMeLastConcAccum,...
    PlotMeLastConc,QuickMovie,CheckConservDen,PlotMeRightRes,ShowRunTime)

%Build analysis Obj
analysisFlags = struct('TrackAccumFromFlux', TrackAccumFromFlux,...
'TrackAccumFromFluxPlot', TrackAccumFromFluxPlot,...
'PlotMeMovAccum', PlotMeMovAccum, 'PlotMeLastConcAccum', PlotMeLastConcAccum,...
'PlotMeLastConc', PlotMeLastConc, 'QuickMovie', QuickMovie, ...
'CheckConservDen', CheckConservDen,...
'PlotMeRightRes', PlotMeRightRes,'ShowRunTime', ShowRunTime);

end