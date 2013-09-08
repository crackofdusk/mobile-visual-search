hFig = figure('Color','w'); colormap(gray);

set(gcf,'PaperPositionMode','auto')
set(hFig, 'Position', [0 0 300 150])

% dx2
zi = ndgauss([9 9],sqrt(1.2)*[1 1],'der',[2 0]);
%subplot(2,3,1);
subaxis(2,3,1,'Padding',0, 'Margin', 0);
imagesc(zi); axis equal; title('$\partial_{xx} g(x,y)$');
set(gca,'XTick',[],'YTick',[]);

dxx = ones(9, 9)*0.5;
dxx(1:3, 3:7) = 1;
dxx(4:6, 3:7) = -2;
dxx(7:9, 3:7) = 1;
%subplot(2,3,4);
subaxis(2,3,4,'Padding',0, 'Margin', 0);
imagesc(dxx); axis equal; %title('approximation of \\$\partial_{xx} g(x,y)$');
set(gca,'XTick',[],'YTick',[]);

% dy2
zi = ndgauss([9 9],sqrt(1.2)*[1 1],'der',[0 2]);
%subplot(2,3,2);
subaxis(2,3,2,'Padding',0, 'Margin', 0);
imagesc(zi); axis equal; title('$\partial_{yy} g(x,y)$');
set(gca,'XTick',[],'YTick',[]);

dyy = transpose(dxx);
%subplot(2,3,5);
subaxis(2,3,5,'Padding',0, 'Margin', 0);
imagesc(dyy); axis equal; %title('approximation of\\ $\partial_{yy} g(x,y)$');
set(gca,'XTick',[],'YTick',[]);

% dxdy
zi = ndgauss([9 9],sqrt(1.2)*[1 1],'der',[1 1]);
%subplot(2,3,3);
subaxis(2,3,3,'Padding',0, 'Margin', 0);
imagesc(zi); axis equal; title('$\partial_{xy} g(x,y)$');
set(gca,'XTick',[],'YTick',[]);

dxy = ones(9,9)*0.5;
dxy(2:4, 2:4) = 1;
dxy(2:4, 6:8) = -1;
dxy(6:8, 2:4) = -1;
dxy(6:8, 6:8) = 1;
%subplot(2,3,6);
subaxis(2,3,6,'Padding',0, 'Margin', 0);
imagesc(dxy); axis equal; %title('approximation of\\ $\partial_{xy} g(x,y)$');
set(gca,'XTick',[],'YTick',[]);

print('gaussian-kernel-derivatives.tex', '-dtex');
