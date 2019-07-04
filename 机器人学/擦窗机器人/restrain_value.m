function x = restrain_value(x,min,max)
if x<min
    x=min;
elseif x>max
    x=max;
else
    x=x;
end
end