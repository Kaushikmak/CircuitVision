function outputFile = convertToBW(imagePath)
    % Read the input image
    img = imread(imagePath);

    % Convert to grayscale
    gray_img = rgb2gray(img);

    % Resize to 120x120
    resized_img = imresize(gray_img, [120 120]);

    % Convert to binary (0 or 1)
    bw_img = imbinarize(resized_img);

    % Invert the image
    inverted_img = ~bw_img;

    % Convert to uint8 (0 and 255)
    final_img = uint8(inverted_img) * 255;

    % Get the directory of this function
    funcFolder = fileparts(mfilename('fullpath'));

    % Create 'temp' folder if it doesn't exist
    tempFolder = fullfile(funcFolder, 'temp');
    if ~exist(tempFolder, 'dir')
        mkdir(tempFolder);
    end

    % Get just the filename (no path)
    [~, name, ~] = fileparts(imagePath);

    % Build output path
    outputFile = fullfile(tempFolder, strcat(name, '_bw_inverted_120x120.png'));

    % Save the processed image
    imwrite(final_img, outputFile);

    % Return the path to the processed image
end
