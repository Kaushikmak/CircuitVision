function result = processAndClassifyImage(imagePath, modelPath)
    % This function processes an image by converting it to edge-detected
    % black and white format, then runs the model for classification
    
    % Read the image
    img = imread(imagePath);
    
    % Convert to grayscale if it's a color image
    if size(img, 3) == 3
        grayImg = rgb2gray(img);
    else
        grayImg = img;
    end
    
    % Apply edge detection (using Canny method)
    edgeImg = edge(grayImg, 'Canny');
    
    % Create a temporary file to save the processed image
    [folder, name, ~] = fileparts(imagePath);
    processedImagePath = fullfile(folder, [name '_processed.png']);
    
    % Save the processed image
    imwrite(edgeImg, processedImagePath);
    
    % Run the model on the processed image
    result = testModel(modelPath, processedImagePath);
    
    % Optional: Delete the temporary file if needed
    % delete(processedImagePath);
end
