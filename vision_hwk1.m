% This script creates a menu driven application

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% your information
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear variables;close all;clc;

% Display a menu and get a choice
choice = menu('Choose an option', 'Exit Program', 'Load Image', ...
    'Display Image', 'Mean Filter', 'Gauss Filter', 'Frosty Filter', 'Scale Nearest', 'Scale Bilinear');  % as you develop functions, add buttons for them here
 
% Choice 1 is to exit the program
while choice ~= 1
   switch choice
       case 0
           disp('Error - please choose one of the options.')
           % Display a menu and get a choice
           choice = menu('Choose an option', 'Exit Program', 'Load Image', ...
    'Display Image', 'Mean Filter', 'Gauss Filter', 'Frosty Filter', 'Scale Nearest', 'Scale Bilinear');  % as you develop functions, add buttons for them here
        case 2
           % Load an image
           image_choice = menu('Choose an image', 'lena1', 'mandril1', 'sully', 'yoda', 'shrek');
           switch image_choice
               case 1
                   filename = 'lena1.jpg';
               case 2
                   filename = 'mandril1.jpg';
               case 3
                   filename = 'sully.bmp';
               case 4
                   filename = 'yoda.bmp';
               % fill in cases for all the images you plan to use
           end
           current_img = imread(filename);
       case 3
           % Display image
           figure
           imagesc(current_img);
           if size(current_img,3) == 1
               colormap gray
           end
           
       case 4
           % Mean Filter
           
           % 1. Ask the user for size of kernel
           ip = inputdlg('Enter the Kernel size');
           k_size = str2double(ip{:});

           % 2. Call the appropriate function
           newImage = meanFilter(current_img, k_size); % create your own function for the mean filter
           
           % 3. Display the old and the new image using subplot
           % ....
           figure
           subplot(1, 2, 1)
           imagesc(current_img)

           subplot(1, 2, 2)
           imagesc(newImage)

           % 4. Save the newImage to a file
           imwrite(newImage, 'Mean-Filter.jpg');
              
       case 5
           % Gaussian Blur Filter

           % 1. Ask the user for Sigma
           ip = inputdlg('Enter the value of sigma');
           sigma = str2double(ip{:});

           % 2. Call the appropriate function
           newImage = gaussFilter(current_img, sigma);

           % 3. Display the old and the new image using subplot
           % ....
           figure
           subplot(1, 2, 1)
           imagesc(current_img)

           subplot(1, 2, 2)
           imagesc(newImage)

           % 4. Save the newImage to a file
           imwrite(newImage, 'Gauss-Filter.jpg');

       case 6
           % Frosty Filter

           % 1. Ask the user for n and m
           ip = inputdlg('Enter the number of rows of the window(N)');
           n = str2double(ip{:});
           ip = inputdlg('Enter the number of columns of the window(M)');
           m = str2double(ip{:});


           % 2. Call the appropriate function
           newImage = frostyFilter(current_img, n, m);

           % 3. Display the old and the new image using subplot
           % ....
           figure
           subplot(1, 2, 1)
           imagesc(current_img)

           subplot(1, 2, 2)
           imagesc(newImage)

           % 4. Save the newImage to a file
           imwrite(newImage, 'Frosty-Filter.jpg');

       case 7
           % Scale using Nearest Neighbor Algorithm

           % 1. Ask the user for factor
           ip = inputdlg('Enter the factor to scale by');
           factor = str2double(ip{:});

           % 2. Call the appropriate function
           newImage = scaleNearest(current_img, factor);

           % 3. Display the old and the new image using subplot
           % ....
           figure
           subplot(1, 2, 1)
           imagesc(current_img)

           subplot(1, 2, 2)
           imagesc(newImage)

           % 4. Save the newImage to a file
           imwrite(newImage, 'Scale-Nearest.jpg');

       case 8
           % Scale image using Bilinear technique

           % 1. Ask the user for factor
           ip = inputdlg('Enter the factor to scale by');
           factor = str2double(ip{:});

           % 2. Call the appropriate function
           newImage = scaleBilinear(current_img, factor);

           % 3. Display the old and the new image using subplot
           % ....
           figure
           subplot(1, 2, 1)
           imagesc(current_img)

           subplot(1, 2, 2)
           imagesc(newImage)

           % 4. Save the newImage to a file
           imwrite(newImage, 'Scale-Bilinear.jpg');
           
       %....
   end
   % Display menu again and get user's choice
   choice = menu('Choose an option', 'Exit Program', 'Load Image', ...
    'Display Image', 'Mean Filter', 'Gauss Filter', 'Frosty Filter', 'Scale Nearest', 'Scale Bilinear');  % as you develop functions, add buttons for them here
end
