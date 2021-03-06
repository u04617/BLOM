clear

%% Convert model to optimization problem
y0=-20;

BLOM_SetDataLogging('TrajectoryExample_Regular')
ModelSpec = BLOM_ExtractModel('TrajectoryExample_Regular',120,0.5);

RunResults = BLOM_RunModel(ModelSpec);

SolverStruct = BLOM_ExportToSolver(ModelSpec,'IPOPT');

[OptGuess ExtVars InitialStates ] = BLOM_SplitResults(ModelSpec,RunResults);

SolverStructData =  BLOM_SetProblemData(SolverStruct,ModelSpec,OptGuess, ExtVars, InitialStates);

SolverResult  =  BLOM_RunSolver(SolverStructData,ModelSpec);
%% plot the results
figure
subplot(311);
plot(SolverResult.System_yk);
ylabel('y');
xlabel('tstep');
subplot(312);
plot(SolverResult.System_v);
ylabel('v');
xlabel('tstep');
subplot(313);
plot(SolverResult.System_theta);
ylabel('\theta');
xlabel('tstep');
