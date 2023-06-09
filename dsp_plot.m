%{
Author: Özgür Karaaslan

%}
x = [3,-2, 4, -1, 5];  % a şıkkı
h = [3 ,2, -2 ,1];  % b şıkkı
N = 7;

if (length(x)<N) % x matrisi 7 elemanlı olacak şekilde 0 eklendi
    for l=1: N - length(x)
        x = [x 0];
    end
end

if (length(h)<N) % h matrisi 7 elemanlı olacak şekilde 0 eklendi
    for i=1: N - length(h)
        h = [h 0];
    end
end

W_7 = [];

for n=0:N-1    % c şıkkı için 7 elemanlı W_7 matrisi oluşturuldu.
    a = exp(-1j*2*pi*n/N);
    W_7 = [W_7 a]; 
end

X_k = [];
xk = 0;

for k=0:N-1 % d şıkkı için X_k işareti hesaplandı.
    for n=0:N-1
        xk = xk + x(n+1) * W_7(k+1);
    end
    X_k = [X_k xk];
    xk=0;
end

figure(1);  % X_k işaretinin genlik grafiği çizdirildi.
subplot(2,1,1); 
plot(abs(X_k));
subplot(2,1,2);  % X_k işaretinin faz grafiği çizdirildi.
plot(angle(X_k));

H_k = []; 
hk = 0;
for k=0:N-1   	% e şıkkı için H_k işareti hesaplandı.
    for n=0:N-1
        hk = hk + h(n+1) / W_7(k+1);
    end
    H_k = [H_k hk];
    hk=0;
end

figure(2);  % H_k işaretinin genlik grafiği çizdirildi.
subplot(2,1,1);
plot(abs(H_k));
subplot(2,1,2);  % H_k işaretinin faz grafiği çizdirildi.
plot(angle(H_k));

Y_k = [];

for i=1:N   % f şıkkı için Y_k işareti hesaplandı.
    Y_k(i) = H_k(i)*X_k(i);
end

figure(3);   % Y_k işaretinin genlik grafiği çizdirildi.
subplot(2,1,1);
plot(abs(Y_k));
subplot(2,1,2);   % Y_k işaretinin faz grafiği çizdirildi.
plot(angle(Y_k));

y = [];
y_n = 0;

for k=0:N-1    % g şıkkı için y[n] işareti hesaplandı.
    for n=0:N-1
        y_n = y_n + Y_k(n+1) / W_7(k+1);
    end
    y = [y abs(y_n/7)];
    y_n=0;
end

disp(y);  % y[n] işareti command window'a yazdırıldı.
