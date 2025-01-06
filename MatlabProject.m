%% matlab Project 
clc; close all; 
%% Code to Test Image (Load Network in WorkSpace)

cam = webcam;
I = imread("calp.jpg"); % puts image into I (Use .png or .jpg)
I = imresize(I,[227,227]); % changes the resolution of the image

imshow(I); % creates a figure displaying the image file

net = FinalNetworkIt5; % Load the neural net
[label,score] = classify(net, I); % classify image with network and give 2 outputs (label and score)
Class_Name = net.Layers(end).ClassNames(1:end); % contains 25 class names

% Grip Classification
% below we have the use of "ismember" it checks the class_name cell array
% containg all 25 items and creates a mask. This mask goes back into the
% class names cell array and makes a smaller cell array for each grip type

Pinch = Class_Name(ismember(Class_Name, {'Keys', 'Glasses','Kitchen Utencils','Paper towels','shoes','berry'}));
Power = Class_Name(ismember(Class_Name, {'Bags','door knob','Can','Bottle','TV remote','Apples','Flashlights','umbrella', 'teapot','Soap'}));
Tripod = Class_Name(ismember(Class_Name, {'Phone','Wallet','Cup', 'WritingTool','Computer mouse','Books','calculator','egg','vernier caliper'}));

% below the code checks if our score value for the image is above 50%
% accuracy to retain the potential label the network gave the item. We
% believe that anything under 50% should be unknown to our label 

if max(score) > 0.5 % checks max score is above 50% 
    label_2 = label; % if our score is above 50% we dont want the name to change
else
    label_2 = 'Unknown Object'; % if below 50 considers as unknown object
end

% Below We have a if Statment assigning a grip type to a specific object 
if ismember(label, Pinch) % checks if the current object is a pinch grip
    disp([label_2 ' Recommended Pinch Grip']) % if Label 1 is in the pinch group display the following 
    if ~strcmp(label_2, 'Unknown Object') % if label_2 is a unknown object we dont want a dispayed %
        disp(['      ' num2str(max(score) * 100) ' % Accuracy']); % include the displayed % below
    end 
elseif ismember(label, Power) % checks if the current object is a Power grip
    disp([label_2 ' Recommended Power Grip']) % if Label 1 is in the Power group display the following
    if ~strcmp(label_2, 'Unknown Object')
        disp(['      ' num2str(max(score) * 100) ' % Accuracy']);
    end
else % defaults to tripod grip
    disp([label_2 ' Recommended Tripod Grip']) % if Label 1 is in the Tripod group display the following
    if ~strcmp(label_2, 'Unknown Object')
        disp(['      ' num2str(max(score) * 100) ' % Accuracy']);
    end    
end 

%% Webcam Code Must Load network

while true   
    picture = snapshot(cam);              % Take a picture    
    picture = imresize(picture,[227,227]);  % Resize the picture
    [label,score] = classify(net, picture);        % Classify the picture

    % classification groups from previous code 
    Pinch = Class_Name(ismember(Class_Name, {'Keys', 'Glasses','Kitchen Utencils','Paper towels','shoes','berry'}));
    Power = Class_Name(ismember(Class_Name, {'Bags','door knob','Can','Bottle','TV remote','Apples','Flashlights','umbrella', 'teapot','Soap'}));
    Tripod = Class_Name(ismember(Class_Name, {'Phone','Wallet','Cup', 'WritingTool','Computer mouse','Books','calculator','egg','vernier caliper'}));

    %Quickly gives reccomended grip type    
    if ismember(label, Pinch) % checks if item in webcam is part of a group
        rec = ' Recomended Pinch Grip';
    elseif ismember(label, Power)
        rec = ' Recomended Power Grip';
    else 
        rec = ' Recomended Tripod Grip';
    end 

    image(picture);     % Show the picture
    title([char(label) char(rec)]); % Show the label and grip type for item
    drawnow;   
    
end
