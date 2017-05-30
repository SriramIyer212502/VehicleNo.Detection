clc
clear
close

%% Vehicle No. Plate Recognition

% Reading The Image

Image1 = imread('Image6.jpg');
figure;
imshow(Image1);

% Converting The Original Image Into GrayLevel Image

Image1_Gray = rgb2gray(Image1);
figure;
imshow(Image1_Gray)

% Applying Filter To smoothen the Image

Filter_Mask = fspecial('gaussian',3,3);
Image1_Gray_Smoothen = imfilter(Image1_Gray,Filter_Mask);
figure;
imshow(Image1_Gray_Smoothen)

% Edge Detector

Image1_Edges = edge(Image1_Gray_Smoothen,'sobel');
figure;
imshow(Image1_Edges)

% Filling Up Holes to get the ROI

Image1_Final1 = imfill(Image1_Edges,'holes');
figure;
imshow(Image1_Final1)

% Getting The Region Of Interest Using imclearborder

Image1_Final2 = imclearborder(Image1_Final1,8);
figure;
imshow(Image1_Final2)

%  Getting The Region Of Interest Using Erosion

Struct_Ele3 = strel('disk',1);
Struct_Ele4 = strel('rectangle',[12,10]);
Image1_Final2 = imerode(Image1_Final2,Struct_Ele3);
Image1_Final2 = imerode(Image1_Final2,Struct_Ele4);
figure;
imshow(Image1_Final2);

% Getting The Textual Region

Image1_Textual_Region = immultiply(Image1_Final2,Image1_Gray);
figure;
imshow(Image1_Textual_Region);

% % Converting The Output Image into A Binary Image

Image1_Textual_Region_BW = im2bw(Image1_Textual_Region);
figure;
imshow(Image1_Textual_Region_BW);

% Optical Character Recognition

Result = ocr(Image1_Textual_Region);
Word = Result.Words();

Word1 = Result.Words(1);
Word2 = Result.Words(2);

Vehicle_No = strcat(Word1,Word2)

h = msgbox('Vehicle_No','Vehicle No is');




