% Check out the fit

function CmprWithFitsAll3SameLboxPlotter(AvsTMatDiff,AvsTMatnu0,AvsTMatnu1,...
    AvsTfitMatDiff,AvsTfitMatnu0,AvsTfitMatnu1,...
    ParamStrDiff,ParamStrnu0,ParamStrnu1,ParamStr2,LboxLoop,NxVec,...
    TimeRecFit,IndHolder,AllParamMatnu0,SavePlot)

figure()
plot(TimeRecFit,AvsTMatDiff(IndHolder,:),'b',...
    TimeRecFit,AvsTfitMatDiff(IndHolder,:),'b--',...
     TimeRecFit,AvsTMatnu0(IndHolder,:),'g',...
     TimeRecFit,AvsTfitMatnu0(IndHolder,:),'g--',...
    TimeRecFit,AvsTMatnu1(IndHolder,:),'r',...
    TimeRecFit,AvsTfitMatnu1(IndHolder,:),'r--')
legend('Diff','Diff Fit','nu = 0','nu = 0 Fit', 'nu = 1','nu = 1 Fit')
textbp(ParamStrDiff);textbp(ParamStrnu0);textbp(ParamStrnu1);
textbp(ParamStr2);
titstr =  sprintf('Accum vs Time Compare Lbox = %.1f Nx = %d',...
    LboxLoop(IndHolder),NxVec(IndHolder) );
title(titstr); xlabel('time'); ylabel('A/Amax')

if SavePlot
    if log10(AllParamMatnu0(1,2)) < 0
        savestr = sprintf('AvTfitCmprKn1e%dKf1em%dt%d.jpg',...
            log10(AllParamMatnu0(1,1)),-log10(AllParamMatnu0(1,2)),IndHolder);
    else
        savestr = sprintf('AvTfitAllCmprKn1e%dKf1e%dt%d.jpg',...
            log10(AllParamMatnu0(1,1)),log10(AllParamMatnu0(1,2)),IndHolder);
    end
    saveas(gcf,savestr,'jpg');
end


figure()
loglog(TimeRecFit,AvsTMatDiff(IndHolder,:),'b',...
    TimeRecFit,AvsTfitMatDiff(IndHolder,:),'b--',...
     TimeRecFit,AvsTMatnu0(IndHolder,:),'g',...
     TimeRecFit,AvsTfitMatnu0(IndHolder,:),'g--',...
    TimeRecFit,AvsTMatnu1(IndHolder,:),'r',...
    TimeRecFit,AvsTfitMatnu1(IndHolder,:),'r--')
legend('Diff','Diff Fit','nu = 0','nu = 0 Fit', 'nu = 1','nu = 1 Fit')
textbp(ParamStrDiff);textbp(ParamStrnu0);textbp(ParamStrnu1);
textbp(ParamStr2);
titstr =  sprintf('Accum vs Time Compare Lbox = %.1f Nx = %d',...
    LboxLoop(IndHolder),NxVec(IndHolder) );
title(titstr); xlabel('time'); ylabel('A/Amax')

if SavePlot
    if log10(AllParamMatnu0(1,2)) < 0
        savestr = sprintf('LLAvTfitCmprKn1e%dKf1em%dt%d.jpg',...
            log10(AllParamMatnu0(1,1)),-log10(AllParamMatnu0(1,2)),IndHolder);
    else
        savestr = sprintf('LLAvTfitAllCmprKn1e%dKf1e%dt%d.jpg',...
            log10(AllParamMatnu0(1,1)),log10(AllParamMatnu0(1,2)),IndHolder);
    end
    saveas(gcf,savestr,'jpg');
end



end
