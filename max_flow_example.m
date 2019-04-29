%% This is to illustrate an examples in Bai (2013)'s Ph.D dissertation
% Appendix A: AN EXAMPLE OF APPLICATION OF MAXFLOW METHOD IN MINING OPTIMIZATION
% Page 87
% https://publications.polymtl.ca/1168/1/2013_XiaoyuBai.pdf
%
% Author: Xiaoyu Victor Bai
% xiaoyu.bai@polymtl.ca
%%

clear

% a matrix of 2D values, in Figure A.1
%  3  1  -1  3
% -1 -2   4 -1
% -2  5  -3 -2
%
Values = zeros(3,4);
Values(1,1) = -2;
Values(1,2) = 5;
Values(1,3) = -3;
Values(1,4) = -2;
Values(2,1) = -1;
Values(2,2) = -2;
Values(2,3) = 4;
Values(2,4) = -1;
Values(3,1) = 3;
Values(3,2) = 1;
Values(3,3) = -1;
Values(3,4) = 3;


n_blk = numel(Values); % number of blocks
index_list = 1:n_blk; % flatten index
dim = size(Values);   % dimension 

% build dependency arcs 
% each block depends on the 3 overlaying blocks.  Out of bound links are excluded

arcs = [];

for i = 1:dim(1)    % row index
   for j = 1:dim(2)      % colomn index
       from = sub2ind(dim, i,j);
       for offset = -1:1
           if (j+offset) > 0 && (j+offset) <= dim(2) && (i+1) <= dim(1)
               to = sub2ind(dim, i+1, j+offset);
               arcs(end+1,:) = [from, to];  
           end
       end 
   end
end

% sourse and sink node
isource = n_blk + 1;
isink = n_blk + 2;

% build coefficient matrix of network flow graph for matlab BGL to solve
% number of node is n_blk + 2 , with source and sink node added
M = zeros(n_blk+2);

big_num = 1e5; % a very big number, represent infiniate capacity in this simple case
for arc = arcs'
   M(arc(1), arc(2)) = big_num; 
end

for id = index_list
    if Values(id) >= 0
        M(isource,id) = Values(id);   % postive value: link from source
    else
        M(id, isink) = abs(Values(id));    % negative value : link to node
    end
end

mat_net = sparse(M);

% run maxflow and get minimum cut
[~,mincut,~,~]=max_flow(mat_net,isource,isink);

% extract max closure / economic pit from result
blk_selection = reshape(mincut(1:end-2)>0,dim);   

total_value = sum(Values(blk_selection>0));
disp('values: ')
disp(Values)
disp('optmial selection: ')
disp(blk_selection)
disp('max closure value: ')
disp(total_value)
