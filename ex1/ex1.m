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
        north_sum_cir = south_sum_cir = east_sum_cir = west_sum_cir = 0;
        northeast_sum_cir = northwest_sum_cir = southeast_sum_cir = southwest_sum_cir = 0;
        north_sum_lin = south_sum_lin = east_sum_lin = west_sum_lin = 0;
        northeast_sum_lin = northwest_sum_lin = southeast_sum_lin = southwest_sum_lin = 0;

        u = 1;
        for linha=i-1:i+1
            p = 1;
            for coluna=j-1:j+1

                if (linha < 1 || coluna < 1 || linha > lin || coluna > col)

                    if (linha < 1)
                        indice_linha = lin-1;
                    elseif (linha > lin)
                        indice_linha = 1;
                    endif

                    if (coluna < 1)
                        indice_coluna = col-1;
                    elseif (coluna > col)
                        indice_coluna = 1;
                    endif
                else
                    indice_linha = linha;
                    indice_coluna = coluna;

                    north_sum_lin = north_sum_lin + (image(linha,coluna) * north(u,p));
                    south_sum_lin = south_sum_lin + (image(linha,coluna) * south(u,p));
                    east_sum_lin = east_sum_lin + (image(linha,coluna) * east(u,p));
                    west_sum_lin = west_sum_lin + (image(linha,coluna) * west(u,p));

                    northeast_sum_lin = northeast_sum_lin + (image(linha,coluna) * northeast(u,p));
                    northwest_sum_lin = northwest_sum_lin + (image(linha,coluna) * northwest(u,p));
                    southeast_sum_lin = southeast_sum_lin + (image(linha,coluna) * southeast(u,p));
                    southwest_sum_lin = southwest_sum_lin + (image(linha,coluna) * southwest(u,p));
                end

                north_sum_cir = north_sum_cir + (image(indice_linha,indice_coluna) * north(u,p));
                south_sum_cir = south_sum_cir + (image(indice_linha,indice_coluna) * south(u,p));
                east_sum_cir = east_sum_cir + (image(indice_linha,indice_coluna) * east(u,p));
                west_sum_cir = west_sum_cir + (image(indice_linha,indice_coluna) * west(u,p));

                northeast_sum_cir = northeast_sum_cir + (image(indice_linha,indice_coluna) * northeast(u,p));
                northwest_sum_cir = northwest_sum_cir + (image(indice_linha,indice_coluna) * northwest(u,p));
                southeast_sum_cir = southeast_sum_cir + (image(indice_linha,indice_coluna) * southeast(u,p));
                southwest_sum_cir = southwest_sum_cir + (image(indice_linha,indice_coluna) * southwest(u,p));
                p = p + 1;
            end
            u = u + 1;
        end
        image_north_lin(i,j)= north_sum_lin;
        image_south_lin(i,j)= south_sum_lin;
        image_east_lin(i,j)= east_sum_lin;
        image_west_lin(i,j)= west_sum_lin;

        image_northeast_lin(i,j)= northeast_sum_lin;
        image_northwest_lin(i,j)= northwest_sum_lin;
        image_southeast_lin(i,j)= southeast_sum_lin;
        image_southwest_lin(i,j)= southwest_sum_lin;

        image_north_cir(i,j)= north_sum_cir;
        image_south_cir(i,j)= south_sum_cir;
        image_east_cir(i,j)= east_sum_cir;
        image_west_cir(i,j)= west_sum_cir;

        image_northeast_cir(i,j)= northeast_sum_cir;
        image_northwest_cir(i,j)= northwest_sum_cir;
        image_southeast_cir(i,j)= southeast_sum_cir;
        image_southwest_cir(i,j)= southwest_sum_cir;
    end
end

figure;
subplot(2, 8, 1);
title("Filtro norte linear");
imshow(image_north_lin);
subplot(2, 8, 2);
title("Filtro sul linear");
imshow(image_south_lin);
subplot(2, 8, 3);
title("Filtro leste linear");
imshow(image_east_lin);
subplot(2, 8, 4);
title("Filtro oeste linear");
imshow(image_west_lin);
subplot(2, 8, 5);
title("Filtro nordeste linear");
imshow(image_northeast_lin);
subplot(2, 8, 6);
title("Filtro noroeste linear");
imshow(image_northwest_lin);
subplot(2, 8, 7);
title("Filtro sudeste linear");
imshow(image_southeast_lin);
subplot(2, 8, 8);
title("Filtro sudoeste linear");
imshow(image_southwest_lin);

subplot(2, 8, 9);
title("Filtro norte circular");
imshow(image_north_cir);
subplot(2, 8, 10);
title("Filtro sul circular");
imshow(image_south_cir);
subplot(2, 8, 11);
title("Filtro leste circular");
imshow(image_east_cir);
subplot(2, 8, 12);
title("Filtro oeste circular");
imshow(image_west_cir);
subplot(2, 8, 13);
title("Filtro nordeste circular");
imshow(image_northeast_cir);
subplot(2, 8, 14);
title("Filtro noroeste circular");
imshow(image_northwest_cir);
subplot(2, 8, 15);
title("Filtro sudeste circular");
imshow(image_southeast_cir);
subplot(2, 8, 16);
title("Filtro sudoeste circular");
imshow(image_southwest_cir);

% imwrite(image_north_cir,'output/north_circular.png')
% imwrite(image_south_cir,'output/south_circular.png')
% imwrite(image_east_cir,'output/east_circular.png')
% imwrite(image_west_cir,'output/west_circular.png')
%
% imwrite(image_northeast_cir,'output/northeast_circular.png')
% imwrite(image_northwest_cir,'output/northwest_circular.png')
% imwrite(image_southeast_cir,'output/southeast_circular.png')
% imwrite(image_southwest_cir,'output/southwest_circular.png')
%
% imwrite(image_north_lin,'output/north_linear.png')
% imwrite(image_south_lin,'output/south_linear.png')
% imwrite(image_east_lin,'output/east_linear.png')
% imwrite(image_west_lin,'output/west_linear.png')
%
% imwrite(image_northeast_lin,'output/northeast_linear.png')
% imwrite(image_northwest_lin,'output/northwest_linear.png')
% imwrite(image_southeast_lin,'output/southeast_linear.png')
% imwrite(image_southwest_lin,'output/southwest_linear.png')
