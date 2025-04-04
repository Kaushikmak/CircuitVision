function visualizeActivations(modelPath, testImagePath)
    % Visualize network activations for a test image
    % modelPath: Path to the saved model file
    % testImagePath: Path to a test image
    
    % Load the trained model
    if ~exist(modelPath, 'file')
        error('Model file not found: %s', modelPath);
    end
    
    load(modelPath, 'trainedNetwork');
    
    % Load and preprocess the test image
    img = imread(testImagePath);
    
    % Check if image is grayscale and convert to RGB if needed
    if size(img, 3) == 1
        img = cat(3, img, img, img); % Convert to RGB
    end
    
    % Resize the image to match network input size
    img = imresize(img, [224 224]);
    
    % Get the network layers
    layers = layerGraph(trainedNetwork);
    layerNames = {layers.Layers.Name};
    
    % Select some interesting layers to visualize
    % For ResNet-18, good layers to visualize are:
    convLayers = layerNames(contains(layerNames, 'conv'));
    selectedLayers = convLayers(1:min(4, length(convLayers)));
    
    % Visualize activations
    figure('Name', 'Network Activations');
    
    % Original image
    subplot(1, length(selectedLayers)+1, 1);
    imshow(img);
    title('Input Image');
    
    % Get activations for selected layers
    for i = 1:length(selectedLayers)
        layerName = selectedLayers{i};
        
        % Get activations
        act = activations(trainedNetwork, img, layerName);
        
        % Visualize first few channels of the activation
        subplot(1, length(selectedLayers)+1, i+1);
        
        % Sum across channels for visualization
        actSum = sum(act, 3);
        actSum = mat2gray(actSum); % Normalize to [0,1]
        
        imshow(actSum);
        title(['Layer: ', layerName]);
    end
    
    % Classify the image
    [predictedClass, score] = classify(trainedNetwork, img);
    sgtitle(sprintf('Network Activations - Predicted: %s (%.2f%%)', ...
        char(predictedClass), max(score)*100));
end
