function output=quadratic_polynomial(x,a)

% 𝑓(𝐱)=𝑎1𝑥1^2+𝑎2𝑥2^2+𝑎3𝑥3^2+𝑎4𝑥1𝑥2+𝑎5𝑥1𝑥3+𝑎6𝑥2𝑥3+𝑎7𝑥1+𝑎8𝑥2+𝑎9𝑥3+𝑎0
output=a(2).*x(1).^2+a(3).*x(2).^2+a(4).*x(3).^2 ...
       +a(5).*x(1).*x(2)+a(6).*x(1).*x(3)+a(7).*x(2).*x(3)...
       +a(8).*x(1)+a(9).*x(2)+a(10).*x(3)+a(1);

end