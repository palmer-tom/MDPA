function [ output_args ] = AddParticleStream(num, x0, y0, PartAng, Type, Ep, Seper)
global AtomSpacing x y AtomType Vx Vy Mass0 Mass1 Mass2 nAtoms

if Type == 0
    Mass = Mass0;
elseif Type == 1
    Mass = Mass1;
else 
    Mass = Mass2
end

if PartAng == 0
    Ang = randn(num)
    for i = 0:num
        Ang(i+1) = abs((Ang(i+1)+1))*(-pi/2);
    end
else
    Ang = ones(num).*PartAng
    
end

for p = 0:num - 1
    nAtoms = nAtoms + 1;
    x(nAtoms) = x0 * AtomSpacing - Seper * p * AtomSpacing * cos(Ang(p+1));
    y(nAtoms) = y0 * AtomSpacing - Seper * p * AtomSpacing * sin(Ang(p+1));
    AtomType(nAtoms) = Type;
end

V = sqrt(2 * Ep / Mass);

for p = 1:num
    Vx(nAtoms - num + p) = V * cos(Ang(p));
    Vy(nAtoms - num + p) = V * sin(Ang(p));
end

end
