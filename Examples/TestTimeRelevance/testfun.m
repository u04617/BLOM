function [  ] = testfun( modelname )
simin = [0 1];
horizon = 4;

switch modelname
    case'testManyBound'
        %% test 1
        set_param('testManyBound/Bound','initial_step','on')
        set_param('testManyBound/Bound','intermediate_step','on')
        set_param('testManyBound/Bound','final_step','on')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testManyBound',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[1 1 1;1 1 1])==0
            warning('testManyBound, test 1 failed')
        end
        %% test 2
        set_param('testManyBound/Bound','initial_step','off')
        set_param('testManyBound/Bound','intermediate_step','on')
        set_param('testManyBound/Bound','final_step','on')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testManyBound',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[0 1 1;1 1 1])==0
            warning('testManyBound, test 2 failed')
        end
        %% test 3
        set_param('testManyBound/Bound','initial_step','on')
        set_param('testManyBound/Bound','intermediate_step','off')
        set_param('testManyBound/Bound','final_step','on')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testManyBound',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[1 0 1;1 1 1])==0
            warning('testManyBound, test 3 failed')
        end
        %% test 4
        set_param('testManyBound/Bound','initial_step','off')
        set_param('testManyBound/Bound','intermediate_step','off')
        set_param('testManyBound/Bound','final_step','on')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testManyBound',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[0 0 1;1 1 1])==0
            warning('testManyBound, test 4 failed')
        end
        %% test 5
        set_param('testManyBound/Bound','initial_step','on')
        set_param('testManyBound/Bound','intermediate_step','on')
        set_param('testManyBound/Bound','final_step','off')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testManyBound',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[1 1 0;1 1 1])==0
            warning('testManyBound, test 5 failed')
        end
        %% test 6
        set_param('testManyBound/Bound','initial_step','off')
        set_param('testManyBound/Bound','intermediate_step','on')
        set_param('testManyBound/Bound','final_step','off')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testManyBound',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[0 1 0;1 1 1])==0
            warning('testManyBound, test 6 failed')
        end
        %% test 7
        set_param('testManyBound/Bound','initial_step','on')
        set_param('testManyBound/Bound','intermediate_step','off')
        set_param('testManyBound/Bound','final_step','off')
        [a,block,stepVars,allVars] = BLOM_ExtractModel('testManyBound',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[1 0 0;1 1 1])==0
            warning('testManyBound, test 7 failed')
        end
        %% test 8
        set_param('testManyBound/Bound','initial_step','off')
        set_param('testManyBound/Bound','intermediate_step','off')
        set_param('testManyBound/Bound','final_step','off')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testManyBound',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[0 0 0;0 0 0])==0
            warning('testManyBound, test 8 failed')
        end
    case 'testManyDelay'
        %% test 1
        set_param('testManyDelay/Bound','initial_step','on')
        set_param('testManyDelay/Bound','intermediate_step','on')
        set_param('testManyDelay/Bound','final_step','on')
        set_param('testManyDelay/Bound1','initial_step','on')
        set_param('testManyDelay/Bound1','intermediate_step','on')
        set_param('testManyDelay/Bound1','final_step','on')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testManyDelay',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[1 1 1;1 1 1;1 1 1;1 1 1;1 1 1;1 1 1;1 1 1;1 1 1])==0
            warning('testManyDelay, test 1 failed')
        end
        %% test 2
        set_param('testManyDelay/Bound','initial_step','off')
        set_param('testManyDelay/Bound','intermediate_step','on')
        set_param('testManyDelay/Bound','final_step','on')
        set_param('testManyDelay/Bound1','initial_step','on')
        set_param('testManyDelay/Bound1','intermediate_step','on')
        set_param('testManyDelay/Bound1','final_step','on')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testManyDelay',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[0 1 1;1 1 1;1 1 1;1 1 1;1 1 1;1 1 1;1 1 1;1 1 1])==0
            warning('testManyDelay, test 2 failed')
        end
        %% test 3
        set_param('testManyDelay/Bound','initial_step','off')
        set_param('testManyDelay/Bound','intermediate_step','off')
        set_param('testManyDelay/Bound','final_step','off')
        set_param('testManyDelay/Bound1','initial_step','on')
        set_param('testManyDelay/Bound1','intermediate_step','on')
        set_param('testManyDelay/Bound1','final_step','on')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testManyDelay',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[0 0 0;1 1 1;1 1 1;1 1 1;1 1 1;1 1 1;1 1 1;1 1 1])==0
            warning('testManyDelay, test 3 failed')
        end
        %% test 4
        set_param('testManyDelay/Bound','initial_step','on')
        set_param('testManyDelay/Bound','intermediate_step','on')
        set_param('testManyDelay/Bound','final_step','on')
        set_param('testManyDelay/Bound1','initial_step','on')
        set_param('testManyDelay/Bound1','intermediate_step','off')
        set_param('testManyDelay/Bound1','final_step','on')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testManyDelay',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[1 1 1;1 0 1;1 1 1;1 1 1;1 1 1;1 1 1;1 1 1;1 1 1])==0
            warning('testManyDelay, test 4 failed')
        end
        %% test 5
        set_param('testManyDelay/Bound','initial_step','on')
        set_param('testManyDelay/Bound','intermediate_step','on')
        set_param('testManyDelay/Bound','final_step','on')
        set_param('testManyDelay/Bound1','initial_step','on')
        set_param('testManyDelay/Bound1','intermediate_step','on')
        set_param('testManyDelay/Bound1','final_step','off')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testManyDelay',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[1 1 1;1 1 0;1 1 1;1 1 1;1 1 1;1 1 1;1 1 1;1 1 1])==0
            warning('testManyDelay, test 5 failed')
        end
        %% test 6
        set_param('testManyDelay/Bound','initial_step','off')
        set_param('testManyDelay/Bound','intermediate_step','off')
        set_param('testManyDelay/Bound','final_step','off')
        set_param('testManyDelay/Bound1','initial_step','off')
        set_param('testManyDelay/Bound1','intermediate_step','off')
        set_param('testManyDelay/Bound1','final_step','off')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testManyDelay',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0])==0
            warning('testManyDelay, test 6 failed')
        end
    case 'testSubsystem'
        %% test 1
        set_param('testSubsystem/Bound','initial_step','on')
        set_param('testSubsystem/Bound','intermediate_step','on')
        set_param('testSubsystem/Bound','final_step','on')
        set_param('testSubsystem/Subsystem/Subsystem/Bound1','initial_step','on')
        set_param('testSubsystem/Subsystem/Subsystem/Bound1','intermediate_step','on')
        set_param('testSubsystem/Subsystem/Subsystem/Bound1','final_step','on')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testSubsystem',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[1 1 1;1 1 1;1 1 1;1 1 1;1 1 1;1 1 1;1 1 1])==0
            warning('testSubsystem, test 1 failed')
        end
        %% test 2
        set_param('testSubsystem/Bound','initial_step','off')
        set_param('testSubsystem/Bound','intermediate_step','off')
        set_param('testSubsystem/Bound','final_step','off')
        set_param('testSubsystem/Subsystem/Subsystem/Bound1','initial_step','off')
        set_param('testSubsystem/Subsystem/Subsystem/Bound1','intermediate_step','off')
        set_param('testSubsystem/Subsystem/Subsystem/Bound1','final_step','off')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testSubsystem',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0])==0
            warning('testSubsystem, test 2 failed')
        end
        %% test 3
        set_param('testSubsystem/Bound','initial_step','off')
        set_param('testSubsystem/Bound','intermediate_step','off')
        set_param('testSubsystem/Bound','final_step','off')
        set_param('testSubsystem/Subsystem/Subsystem/Bound1','initial_step','on')
        set_param('testSubsystem/Subsystem/Subsystem/Bound1','intermediate_step','on')
        set_param('testSubsystem/Subsystem/Subsystem/Bound1','final_step','on')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testSubsystem',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[0 0 0;1 1 1;0 0 0;1 1 1;0 0 0;1 1 1;1 1 1])==0
            warning('testSubsystem, test 3 failed')
        end
        
    case 'testSubSystemMIMO'
        %% test 1
        % testing to make sure that subsystems works correctly for 
        set_param('testSubSystemMIMO/Bound','initial_step','on')
        set_param('testSubSystemMIMO/Bound','intermediate_step','on')
        set_param('testSubSystemMIMO/Bound','final_step','on')
        set_param('testSubSystemMIMO/Bound1','initial_step','on')
        set_param('testSubSystemMIMO/Bound1','intermediate_step','on')
        set_param('testSubSystemMIMO/Bound1','final_step','on')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testSubSystemMIMO',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[1 1 1; 1 1 1; 1 1 1; 1 1 1; 1 1 1; 1 1 1; 1 1 1; 1 1 1; 1 1 1])==0
            warning('testSubsystem, test 1 failed')
        end
        
        %% test 2
        set_param('testSubSystemMIMO/Bound','initial_step','on')
        set_param('testSubSystemMIMO/Bound','intermediate_step','on')
        set_param('testSubSystemMIMO/Bound','final_step','on')
        set_param('testSubSystemMIMO/Bound1','initial_step','off')
        set_param('testSubSystemMIMO/Bound1','intermediate_step','off')
        set_param('testSubSystemMIMO/Bound1','final_step','off')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testSubSystemMIMO',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[1 1 1; 0 0 0; 1 1 1; 0 0 0; 1 1 1; 0 0 0; 0 0 0; 1 1 1; 1 1 1])==0
            warning('testSubsystem, test 2 failed')
        end
        
        %% test 3
        set_param('testSubSystemMIMO/Bound','initial_step','off')
        set_param('testSubSystemMIMO/Bound','intermediate_step','off')
        set_param('testSubSystemMIMO/Bound','final_step','on')
        set_param('testSubSystemMIMO/Bound1','initial_step','off')
        set_param('testSubSystemMIMO/Bound1','intermediate_step','on')
        set_param('testSubSystemMIMO/Bound1','final_step','off')
        [ModelSpec,block,stepVars,allVars] = BLOM_ExtractModel('testSubSystemMIMO',horizon,1,1,1);
        if isequal([stepVars.initTime stepVars.interTime stepVars.finalTime],[0 0 1; 0 1 0; 0 0 1; 0 1 0; 1 1 1; 1 1 0; 1 1 0; 1 1 1; 1 1 1])==0
            warning('testSubsystem, test 2 failed')
        end
        
end
    
end
