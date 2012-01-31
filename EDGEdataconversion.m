%% cell number along vertical

datadouble=cell2mat(data);
[m,n,k]=size(datadouble);
%k specifies cell index dimension
% m is t dimension and n is z-slice dimension

NUM=zeros(k,m); % make zeros matrix that has k (cells) rows and m (time) columns

for cel=1:k
    for t=1:m
        
        NUM(cel,t) = datadouble(t,1,cel);
        
    end
end

avg=nanmean(NUM);
dev=nanstd(NUM);
t=[1:m];
t=t*0.10833;


figure(1)
imagesc(NUM); colorbar;

figure(2)
errorbar(t,avg,dev,'Color','Green','Linewidth',2);