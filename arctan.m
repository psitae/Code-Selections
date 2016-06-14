function [ angle ] = arctan( a, b )

% extends normal range of arctangent

first = atan(b/a);
if a<0
    angle = first + pi;
else
    angle = first;    
end

end

