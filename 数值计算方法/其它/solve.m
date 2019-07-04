function varargout = solve(varargin)
%SOLVE  Symbolic solution of algebraic equations.
%   S = SOLVE(eqn1,eqn2,...,eqnM,var1,var2,...,varN)
%   S = SOLVE(eqn1,eqn2,...,eqnM,var1,var2,...,varN,'ReturnConditions',true)
%
%   [S1,...,SN] = SOLVE(eqn1,eqn2,...,eqnM,var1,var2,...,varN)
%   [S1,...,SN,params,conds] = SOLVE(eqn1,...,eqnM,var1,var2,...,varN,'ReturnConditions',true)
%
%   The eqns are symbolic expressions, equations, or inequalities.  The
%   vars are symbolic variables specifying the unknown variables.
%   If the expressions are not equations or inequalities, 
%   SOLVE seeks zeros of the expressions.
%   Otherwise SOLVE seeks solutions.
%   If not specified, the unknowns in the system are determined by SYMVAR,
%   such that their number equals the number of equations.
%   If no analytical solution is found, a numeric solution is attempted;
%   in this case, a warning is printed. 
%
%   Three different types of output are possible.  For one variable and one
%   output, the resulting solution is returned, with multiple solutions to
%   a nonlinear equation in a symbolic vector.  For several variables and
%   several outputs, the results are sorted in the same order as the
%   variables var1,var2,...,varN in the call to SOLVE.  In case no variables
%   are given in the call to SOLVE, the results are sorted in lexicographic
%   order and assigned to the outputs.  For several variables and a single
%   output, a structure containing the solutions is returned.
%
%   SOLVE(...,'ReturnConditions', VAL) controls whether SOLVE should in  
%   addition return a vector of all newly generated parameters to express 
%   infinite solution sets and about conditions on the input parameters 
%   under which the solutions are correct. 
%   If VAL is TRUE, parameters and conditions are assigned to the last two 
%   outputs. Thus, if you provide several outputs, their number must equal 
%   the number of specified variables plus two.
%   If you provide a single output, a structure is returned 
%   that contains two additional fields 'parameters' and 'conditions'.
%   No numeric solution is attempted even if no analytical solution is found.
%   If VAL is FALSE, then SOLVE may warn about newly generated parameters or 
%   replace them automatically by admissible values. It may also fall back 
%   to the numerical solver.
%   The default is FALSE.
%
%   SOLVE(...,'IgnoreAnalyticConstraints',VAL) controls the level of
%   mathematical rigor to use on the analytical constraints of the solution
%   (branch cuts, division by zero, etc). The options for VAL are TRUE or
%   FALSE. Specify FALSE to use the highest level of mathematical rigor
%   in finding any solutions. The default is FALSE.
%
%   SOLVE(...,'PrincipalValue',VAL) controls whether SOLVE should return multiple
%   solutions (if VAL is FALSE), or just a single solution (when VAL is TRUE).
%   The default is FALSE.
%
%   SOLVE(...,'IgnoreProperties',VAL) controls if SOLVE should take
%   assumptions on variables into account. VAL can be TRUE or FALSE.
%   The default is FALSE (i.e., take assumptions into account).
%
%   SOLVE(...,'Real',VAL) allows to put the solver into "real mode."
%   In "real mode," only real solutions such that all intermediate values
%   of the input expression are real are searched. VAL can be TRUE or FALSE.
%   The default is FALSE.
%
%   SOLVE(...,'MaxDegree',n) controls the maximum degree of polynomials
%   for which explicit formulas will be used during the computation.
%   n must be a positive integer. The default is 3.
%
%   Example 1:
%      syms p x r
%      solve(p*sin(x) == r) chooses 'x' as the unknown and returns
%
%        ans =
%               asin(r/p)
%          pi - asin(r/p)
%
%   Example 2:
%      syms x y
%      [Sx,Sy] = solve(x^2 + x*y + y == 3,x^2 - 4*x + 3 == 0) returns
%
%        Sx =
%         1
%         3
%
%        Sy =
%            1
%         -3/2
%
%   Example 3:
%      syms x y
%      S = solve(x^2*y^2 - 2*x - 1 == 0,x^2 - y^2 - 1 == 0) returns
%      the solutions in a structure.
%
%        S =
%          x: [8x1 sym]
%          y: [8x1 sym]
%
%   Example 4:
%      syms a u v
%      [Su,Sv] = solve(a*u^2 + v^2 == 0,u - v == 1) regards 'a' as a
%      parameter and solves the two equations for u and v.
%
%   Example 5:
%      syms a u v w
%      S = solve(a*u^2 + v^2,u - v == 1,a,u) regards 'v' as a
%      parameter, solves the two equations, and returns S.a and S.u.
%
%      When assigning the result to several outputs, the order in which
%      the result is returned depends on the order in which the variables
%      are given in the call to solve:
%      [U,V] = solve(u + v,u - v == 1, u, v) assigns the value for u to U
%      and the value for v to V. In contrast to that
%      [U,V] = solve(u + v,u - v == 1, v, u) assigns the value for v to U
%      and the value of u to V.
%
%   Example 6:
%      syms a u v
%      [Sa,Su,Sv] = solve(a*u^2 + v^2,u - v == 1,a^2 - 5*a + 6) solves
%      the three equations for a, u and v.
%
%   Example 7:
%      syms x
%      S = solve(x^(5/2) == 8^(sym(10/3))) returns all three complex solutions:
%
%        S =
%                                                        16
%         - 4*5^(1/2) - 4 + 4*2^(1/2)*(5 - 5^(1/2))^(1/2)*i
%         - 4*5^(1/2) - 4 - 4*2^(1/2)*(5 - 5^(1/2))^(1/2)*i
%
%   Example 8:
%      syms x
%      S = solve(x^(5/2) == 8^(sym(10/3)), 'PrincipalValue', true)
%      selects one of these:
%
%        S =
%        - 4*5^(1/2) - 4 + 4*2^(1/2)*(5 - 5^(1/2))^(1/2)*i
%
%   Example 9:
%      syms x
%      S = solve(x^(5/2) == 8^(sym(10/3)), 'IgnoreAnalyticConstraints', true)
%      ignores branch cuts during internal simplifications and, in this case,
%      also returns only one solution:
%
%        S =
%        16
%
%   Example 10:
%      syms x
%      S = solve(sin(x) == 0) returns 0
%      
%      S = solve(sin(x) == 0, 'ReturnConditions', true) returns a structure expressing
%      the full solution:
%
%      S.x = k*pi
%      S.parameters = k
%      S.conditions = in(k, 'integer')
%
%   Example 11:
%      syms x y real 
%      [S, params, conditions] = solve(x^(1/2) = y, x, 'ReturnConditions', true)
%      assigns solution, parameters and conditions to the outputs. 
%      In this example, no new parameters are needed to express the solution:
% 
%      S = 
%      y^2
%
%      params =
%      Empty sym: 1-by-0
%   
%      conditions =
%      0 <= y
%
%   Example 12:
%      syms a x y
%      [x0, y0, params, conditions] = solve(x^2+y, x, y, 'ReturnConditions', true)
%      generates a new parameter z to express the infinitely many solutions.
%      This z can be any complex number, both solutions are valid without 
%      restricting conditions:
%      
%      x0 =
%      -(-z)^(1/2)
%      (-z)^(1/2)
%
%      y0 =
%      z
%      z
%
%      params =
%      z
%
%      conditions =
%      true
%      true
%
%   Example 13:
%      syms t positive
%      solve(t^2-1)
%
%        ans =
%        1
%
%      solve(t^2-1, 'IgnoreProperties', true)
%
%        ans =
%          1
%         -1
%
%   Example 14:
%      solve(x^3-1) returns all three complex roots:
%
%        ans =
%                             1
%         - 1/2 + (3^(1/2)*i)/2
%         - 1/2 - (3^(1/2)*i)/2
%
%      solve(x^3-1, 'Real', true) only returns the real root:
%
%        ans =
%        1
%
%   See also DSOLVE, SUBS.

%   Copyright 1993-2015 The MathWorks, Inc.

eng = symengine;

% split the input into equations, variables, and options
[eqns,vars,options] = getEqns(varargin{:});

% parse the options
boolvalidator = @(X) X==sym(true) || X==sym(false);
intvalidator = @(X) logical(feval(symengine, 'testtype', X, 'Type::PosInt'));

parser = inputParser;
addParameter(parser, 'IgnoreAnalyticConstraints', false);
addParameter(parser, 'IgnoreProperties', false, boolvalidator);
addParameter(parser, 'PrincipalValue', false, boolvalidator);
addParameter(parser, 'Real', false, boolvalidator);
addParameter(parser, 'ReturnConditions', false, boolvalidator);
addParameter(parser, 'MaxDegree', sym(2), intvalidator);

parser.parse(options{:});
options = parser.Results;
options.IgnoreAnalyticConstraints = sym.checkIgnoreAnalyticConstraintsValue(options.IgnoreAnalyticConstraints);

% initialize output structure
varargout = cell(1, nargout);


if isempty(eqns)
   error(message('symbolic:solve:NoEquation'))
end

if isempty(vars)
    % The variables have not been given by the user
    if nargout <=1 
        N = numel(eqns);
    elseif logical(options.ReturnConditions)
        N = nargout-2;
        if N == 0
            error(message('symbolic:solve:NargoutReturnConditions'))
        end    
    else
        N = nargout;
    end    
    vars = sort(symvar(eqns, N));
    if isempty(vars)
        error(message('symbolic:solve:NoVariableGiven'))
    end    
    if numel(vars) < N && nargout > 1 
        error(message('symbolic:dsolve:errmsg5', numel(vars), N));
    end    
elseif nargout > 1 
    % The number of outputs must match the number of explicitly given vars
    if logical(options.ReturnConditions)
        N = nargout - 2;
    else
        N = nargout;
    end    
    if N ~= numel(vars)
        error(message('symbolic:dsolve:errmsg5', numel(vars), N))
    end    
end    


if any(vars == sym('parameters')) || any(vars == sym('conditions'))
% it is not allowed to solve for 'parameters' and 'conditions' 
    error(message('symbolic:solve:VarnameParametersOrConditions'))
end    

% convert the options into MuPAD's table format
solveOptions = struct2sym(options);

% the main work is done in the MuPAD solver            
sol = eng.feval('solve', eqns, vars, solveOptions);


% Check whether we have found a symbolic solution.
% In compatible mode, resort to a numerical solver if not. 
numericMode = false;
if sol == eng.evalin('FAIL')
    if ~logical(options.ReturnConditions) 
        sol = eng.feval('solve::float', eqns, vars, solveOptions);
        if numel(sol) > 0
            % We have found a numerical solution, and warn that it is only numerical.
            warning(message('symbolic:solve:FallbackToNumerical'));
            % The solution is a DOM_SET. Extract its first element.
            sol = feval(symengine, 'op', sol, 1);
            if numel(sol) > 1
                % The solution is a vector. Put it inside a list  
                sol = eng.feval('DOM_LIST', sol);
            end    
            numericMode = true;
        end
    end
    if ~numericMode
        % numeric solution is unwanted or has not been found
        % return empty sym below
        warning(message('symbolic:solve:warnmsg3'));
        sol = eng.evalin('[]');
    end    
end    


if numericMode
    % A numerical solution never depends on parameters and conditions
    solutions = sol;
    parameters = sym(zeros(1, 0));
    conditions = eng.evalin('TRUE');
else
    % sol is a list of lists [expression, parameters, condition]
    parameterMatrix = eng.feval('map', sol, '_index', sym(2));
    parameters = sym(zeros(1, 0));
    for i=1:numel(parameterMatrix)
        parameters = union(parameters, parameterMatrix(i));
    end    
    conditions = transpose(eng.feval('map', sol, '_index', sym(3)));
    solutions = eng.feval('map', sol, '_index', sym(1)); 
end


if nargout <= 1 
    if numel(vars) == 1 
        if logical(options.ReturnConditions)
            varargout{1}.(char(vars)) = transpose(solutions);
        else    
            varargout{1} = transpose(solutions);
        end    
    else
        % output format for systems
        for i=1:numel(vars)
            varargout{1}.(char(vars(i))) = transpose(eng.feval('map', solutions, '_index', i));
        end
    end    
    if logical(options.ReturnConditions)
       varargout{1}.parameters = parameters;
       varargout{1}.conditions = conditions;
    else
       warnIfParams(parameters, conditions);
    end    
    
elseif ~logical(options.ReturnConditions)
    for i=1:numel(vars)
        varargout{i} = transpose(eng.feval('map', solutions, '_index', i));
    end 
    warnIfParams(parameters, conditions);
else 
    if numel(vars) == 1
        varargout{1} = transpose(solutions);
    else   
        for i=1:numel(vars)
            varargout{i} = transpose(eng.feval('map', solutions, '_index', i));
        end    
    end 
    % parameters:
    varargout{numel(vars)+1} = parameters;
    % conditions:
    varargout{numel(vars)+2} = conditions;
end
% end of the main program


% local methods


% getEqns - split the input into equations, variables, and options
function [eqns,vars,options] = getEqns(varargin)
% process strings, even when they contain several arguments
argv = varargin;
stringInput = false;

k=1;
% preprocess strings, and seek the first option
while k <= numel(argv) && ~isOption(argv{k}) 
    a = argv{k};
    if isa(a, 'logical')
        % handle true and false in a special way
        % we do not want them to become 1 and 0
        if all(a(:))
            argv{k} = evalin(symengine, 'TRUE');
        else
            argv{k} = evalin(symengine, 'FALSE');
        end    
    else    
        if ischar(a)
            stringInput = true;
        end    
        a = sym(a);
        if strcmp(char(feval(symengine, 'type', a)), '_exprseq')
            % replace the k-th input by the elements of the sequence
            a = num2cell(children(a));
            argv = [argv(1:k-1), a, argv(k+1:end)];
            % in this case, we should not increase k, as we have to look 
            % at the elements of the sequence individually again
            k = k-1;
        elseif numel(a) == 0
            error(message('symbolic:solve:EmptyEquationOrVariable'))
        else
            % accept also higher-dimensional objects and column vectors
            if ~isa(a, 'symfun') && numel(a) > 1
                a = reshape(a, 1, numel(a));
            end    
            argv{k} = a;
        end
    end
    k = k+1;
end

if k == 1
    % already the first argument is an option
    error(message('symbolic:solve:NoEquation'))
end    
% consider all following arguments as options
options = argv(k:end);
argv = argv(1:k-1);
% convert the 1st, 3rd, etc. element of options to strings,
% but leave the option values as syms
for k=1:2:numel(options)
    options{k} = char(options{k});
    if stringInput && strcmpi(options{k}, 'ReturnConditions') && ...
        k < numel(options) && options{k+1} == true
        % For option ReturnConditions, we do not allow string input
        error(message('symbolic:solve:DeprecateStringInputError'))
    end
end    
% throw warning if some argument has been passed as a string
if stringInput
    warning(message('symbolic:solve:DeprecateStringInputWarning'));
end
% use function getEqnsVars to distinguish equations from variables
% we do not warn anymore if the number of equations differs from the number
% of variables
[eqns, vars] = sym.getEqnsVars(argv{:});


% local function isOption
% returns true if its argument is a solve option
% we cannot test equality in the sense of validateString because we do not 
% want to identify 'm' with 'MaxDegree'    
function b = isOption(a)
b = ~isa(a, 'logical') && any(strcmpi(char(a), ...
{'MaxDegree', 'IgnoreAnalyticConstraints', 'IgnoreProperties', ...
 'PrincipalValue', 'Real', 'ReturnConditions'}));


% local function struct2sym
% converts a MATLAB struct containing all options into a MuPAD table
function T = struct2sym(s)
f = fieldnames(s);
entries = sym(zeros(1, numel(f)+1));
for i=1:numel(f)
    v = s.(f{i});
    if strcmp(f{i}, 'MaxDegree')
        v = sym(v);
    elseif strcmp(f{i}, 'ReturnConditions')
        f{i} = 'OutputType';
        if v == true
            v = evalin(symengine, '"FullMode"');
        else
            v = evalin(symengine, '"CompatibleMode"');
        end    
    elseif v == true
        v = evalin(symengine, 'TRUE');
    else
        % v is false
        v = evalin(symengine, 'FALSE');
    end    
    entries(i) = feval(symengine, '_equal', sym(f{i}), v);
end
entries(end) = evalin(symengine, 'VectorFormat = TRUE');
entries = feval(symengine, 'op', entries);
T = feval(symengine, 'table', entries);


% local function warnIfParams
% warn if the solution depends on parameters and conditions
function warnIfParams(parameters, conditions)
if ~isempty(parameters)
    paramstring = char(parameters(1));
    for i = 2:numel(parameters)
        paramstring = [paramstring ', ' char(parameters(i))]; %#ok
    end
    warning(message('symbolic:solve:ParametrizedFamily', sprintf([paramstring '.\n'])));
end
if any(conditions ~= evalin(symengine, 'TRUE'))
    conditionstring = char(conditions(1));
    for i=2:numel(conditions)
        conditionstring = [conditionstring '; \n' char(conditions(i)) ]; %#ok
    end
    warning(message('symbolic:solve:SolutionsDependOnConditions', sprintf([conditionstring '.\n'])));
end
