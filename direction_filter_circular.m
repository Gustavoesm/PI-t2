clear all, clc
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
        for linha=i-1:i+1
            p = 1;
            for coluna=j-1:j+1

                if (linha < 1)
                    indice_linha = lin-1;
                elseif (linha > lin)
                    indice_linha = 1;
                else
                    indice_linha = linha;
                endif

                if (coluna < 1)
                    indice_coluna = col-1;
                elseif (coluna > col)
                    indice_coluna = 1;
                else
                    indice_coluna = coluna;
                endif

                north_sum = north_sum + (image(indice_linha,indice_coluna) * north(u,p));
                south_sum = south_sum + (image(indice_linha,indice_coluna) * south(u,p));
                east_sum = east_sum + (image(indice_linha,indice_coluna) * east(u,p));
                west_sum = west_sum + (image(indice_linha,indice_coluna) * west(u,p));

                northeast_sum = northeast_sum + (image(indice_linha,indice_coluna) * northeast(u,p));
                northwest_sum = northwest_sum + (image(indice_linha,indice_coluna) * northwest(u,p));
                southeast_sum = southeast_sum + (image(indice_linha,indice_coluna) * southeast(u,p));
                southwest_sum = southwest_sum + (image(indice_linha,indice_coluna) * southwest(u,p));
                p = p + 1;
            end
            u = u + 1;
        end
        image_north(i,j)= north_sum;
        image_south(i,j)= south_sum;
        image_east(i,j)= east_sum;
        image_west(i,j)= west_sum;

        image_northeast(i,j)= northeast_sum;
        image_northwest(i,j)= northwest_sum;
        image_southeast(i,j)= southeast_sum;
        image_southwest(i,j)= southwest_sum;
    end
end

imwrite(image_north,'output/north_circular.png')
imwrite(image_south,'output/south_circular.png')
imwrite(image_east,'output/east_circular.png')
imwrite(image_west,'output/west_circular.png')

imwrite(image_northeast,'output/northeast_circular.png')
imwrite(image_northwest,'output/northwest_circular.png')
imwrite(image_southeast,'output/southeast_circular.png')
imwrite(image_southwest,'output/southwest_circular.png')
