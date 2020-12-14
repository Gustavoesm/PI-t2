clear all
image = imread('rice_binary.png');
%figure, imshow(image);
%image = rgb2gray(image);
[lin, col]=size(image);
janela=3;


north = [1 1 1 ; 1 -2 1; -1 -1 -1]; %NORTE
south = [-1 -1 -1 ; 1 -2 1; 1 1 1]; %SUL
east = [-1 1 1 ; -1 -2 1; -1 1 1]; %LESTE
west = [1 1 -1 ; 1 -2 -1; 1 1 -1]; %OESTE
northeast = [1 1 1 ; -1 -2 1; -1 -1 1]; %NORDESTE
northwest = [1 1 1 ; 1 -2 -1; 1 -1 -1]; %NOROESTE
southeast = [-1 -1 1 ; -1 -2 1; 1 1 1]; %SUDESTE
southwest = [1 -1 -1 ; 1 -2 -1; 1 1 1]; %SUDOESTE



for i=1:lin
    for j=1:col
        north_sum = south_sum = east_sum = west_sum = 0;
        northeast_sum = northwest_sum = southeast_sum = southwest_sum = 0;
        u = 1;
        for indice_linha=i-1:i+1
            p = 1;
            for indice_coluna=j-1:j+1
                if !(indice_linha < 1 || indice_coluna < 1 || indice_linha > lin || indice_coluna > col)
                    north_sum = north_sum + (image(indice_linha,indice_coluna) * north(u,p));
                    south_sum = south_sum + (image(indice_linha,indice_coluna) * south(u,p));
                    east_sum = east_sum + (image(indice_linha,indice_coluna) * east(u,p));
                    west_sum = west_sum + (image(indice_linha,indice_coluna) * west(u,p));

                    % northeast_sum = northeast_sum + (image(indice_linha,indice_coluna) * northeast(u,p));
                    % northwest_sum = northwest_sum + (image(indice_linha,indice_coluna) * northwest(u,p));
                    % southeast_sum = southeast_sum + (image(indice_linha,indice_coluna) * southeast(u,p));
                    % southwest_sum = southwest_sum + (image(indice_linha,indice_coluna) * southwest(u,p));
                endif

                p = p + 1;
            end
            u = u + 1;
        end
        image_north(i,j)= north_sum;
        image_south(i,j)= south_sum;
        image_east(i,j)= east_sum;
        image_west(i,j)= west_sum;

        % image_northeast(i,j)= northeast_sum;
        % image_northwest(i,j)= northwest_sum;
        % image_southeast(i,j)= southeast_sum;
        % image_southwest(i,j)= southwest_sum;
    end
end

% figure;
% subplot(2, 4, 1);
% imshow(image_north);
% subplot(2, 4, 2);
% imshow(image_south);
% subplot(2, 4, 3);
% imshow(image_east);
% subplot(2, 4, 4);
% imshow(image_west);

imwrite(image_north,'output/north_linear.png')
imwrite(image_south,'output/south_linear.png')
imwrite(image_east,'output/east_linear.png')
imwrite(image_west,'output/west_linear.png')
%
% imwrite(image_northeast,'output/northeast_linear.png')
% imwrite(image_northwest,'output/northwest_linear.png')
% imwrite(image_southeast,'output/southeast_linear.png')
% imwrite(image_southwest,'output/southwest_linear.png')
