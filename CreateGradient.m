function grad = CreateGradient(A,C)
grad.AAs = {};
grad.Cs = {};
grad.valid = sparse(1,size(A,2));
if (isempty(find(C,2)))
    return;
end


% for i = 1:size(A,2) % for all variables
% end

range = find(sum(abs(A),1));
if ~isempty(range)
    grad.AAs = cell(1,size(A,2));
    grad.Cs = cell(1,size(A,2));
    
for i = range % for all non zero variables
    grad.AAs{i} = sparse(size(A,1),size(A,2));
    grad.Cs{i} = sparse(1,size(C,2));
    grad.valid(i) = 1;
    idx = find(A(:,i)'.*C);
    for j=idx % 1:size(A,1) % for all terms
        if A(j,i) == 0
            continue;
        end
        if ~any(A(j,i) == BLOM_FunctionCode)
            grad.AAs{i}(j,:) = A(j,:);
            grad.AAs{i}(j,i) = grad.AAs{i}(j,i)-1;
            grad.Cs{i}(j) = C(j)*A(j,i);
        else
            if (A(j,i) == BLOM_FunctionCode('exp') ) % exp
                grad.AAs{i}(j,:) = A(j,:);
                grad.Cs{i}(j) = C(j);
            elseif (A(j,i) == BLOM_FunctionCode('log') ) % log
                grad.AAs{i}(j,:) = A(j,:);
                grad.AAs{i}(j,i) = -1;
                grad.Cs{i}(j) = C(j);
            elseif (A(j,i) == BLOM_FunctionCode('sin') ) % sin
                grad.AAs{i}(j,:) = A(j,:);
                grad.AAs{i}(j,i) = BLOM_FunctionCode('cos');
                grad.Cs{i}(j) = C(j);
            elseif (A(j,i) == BLOM_FunctionCode('cos') ) % cos
                grad.AAs{i}(j,:) = A(j,:);
                grad.AAs{i}(j,i) = BLOM_FunctionCode('sin');
                grad.Cs{i}(j) = -C(j);
            elseif (A(j,i) == BLOM_FunctionCode('tanh') ) % tanh
                error('tanh is unsupported for gradient generation')
            elseif (A(j,i) == BLOM_FunctionCode('atan') ) % atan
                error('atan is unsupported for gradient generation')
            else
                error(['Unrecognized function code ' num2str(A(j,i))])
            end

        end
    end
    
    if (isempty(find( grad.AAs{i})) && isempty(find( grad.Cs{i})))
        grad.AAs{i} = [];
        grad.Cs{i} = [];
        grad.valid(i) = 0;
    end
    
end
end