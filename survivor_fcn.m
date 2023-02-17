%survivor_fcn.m

function [survivor, survbin]=survivor_fcn(dur_array)

%dur_array is array of epochs (will later be multiplied to return survivor
%plot in seconds)

max_dur=max(dur_array);
if max_dur==0
    survbin=1;
    survivor=0;
else
   
    survbin=1:1:max_dur;

    for i=1:max_dur
        survivor(i)=sum(dur_array>=i); 
    end
end

survbin=survbin';
survivor=survivor*100/survivor(1);
survbin=survbin*10;

%
%figure; plot(nrembin, survivorN/survivorN(1))