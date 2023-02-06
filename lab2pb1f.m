heads = 0;
for k = 1:3
    x=rand();
    if(x>=0.5)
        fprintf("HEADS\n")
        heads=heads+1;
    else
        fprintf("TAIL\n")
    end
end

fprintf("There were %i heads\n ", heads);
fprintf("Chances %f \n", binopdf(heads, 3, 0.5));