interval=[-5*t 5*t];
z=linspace(0,t);
f1 = repmat(f(z),1,diff(interval)/t);
T = linspace(interval(1),interval(2),length(f1));
plot(T,f1);
title('The Graph of f(t)');
figure;
T = 2;
w = pi;
n = 1:10;
syms t;
f2 = @(t)(t.^2).*(cos(n.*w.*t));
f3 = @(t)(t.^2).*(sin(n.*w.*t));

an = int(f2,t,0,T);
bn = int(f3,t,0,T);

stem(n,an);
title('Fourier Coefficient an');
figure;
stem(n,bn);
title('Fourier Coefficient bn');
figure;




t = 1;
interval=[-5*t 5*t];
T = linspace(interval(1),interval(2),length(f1));
%m = 4;
%m = 10;
m = 100;
dc = 0.5;
Z = dc .* f1 ;

for n = -m : -1,         
  Cn = exp(i .*pi ./2)./(2 .*pi .*n);
  Z = Z + real(Cn * exp(i.* 2.* pi.* n.* T));
  %Z = Z + real(Cn * exp(i.* 2.* pi.* n.* 2));
end;
                        
for n = 1 : m,            
  Cn = exp(i .*pi ./2)./(2.* pi .*n);
  Z = Z + real(Cn .* exp(j .* 2 .* pi .* n .*T));
  %Z = Z + real(Cn * exp(i.* 2.* pi.* n.* 2));
end;

%disp(Z);
plot(T,Z);
title('Truncated Fourier Series');
%We observe that as the order (m) increses, the plot resembles the original
%graph more and more




% 8(c)
% We see that as the order of m increses, the value of Z approaches the
% value of F at t = 2 more closely, that is 4.
