
# Circuit Vision

**Circuit Vision** is a MATLAB App Designer-based application that allows users to classify electronic circuit components using a trained Convolutional Neural Network (CNN). It provides an intuitive interface for importing images, capturing from webcam, preprocessing, visualizing CNN layers, and viewing classification results.

## Features

- **Image Import**: Load image files directly from your device.
- **Camera Capture**: Open a live preview and capture images from your webcam.
- **Preprocessing**: Automatically convert images to black & white, resize, and prepare for model input.
- **Classification**: Run predictions using a pretrained CNN model.
- **CNN Visualization**: Explore intermediate layer activations.
- **Feedback**: Built-in window for reaching out or contributing to the project via GitHub or email.

## Demo


Example:  
![App Screenshot](screenshots\importImage.JPG)
![App Screenshot](screenshots\main.JPG)
![App Screenshot](screenshots\prediction.JPG)

## Getting Started

### Prerequisites

- MATLAB R2021a or later
- Deep Learning Toolbox
- Image Processing Toolbox

### Installation & Run

1. Clone the repository:
   ```bash
   git clone https://github.com/Kaushikmak/CircuitVision.git
   cd circuit-vision
   ```

2. Open `mainapp.mlapp` using MATLAB App Designer.

3. Make sure `circuit_component_classifier.mat` is present in the project folder.

4. Click **Run** to launch the app.

## Project Structure

```
circuit-vision/
├── mainapp.mlapp                    % Main MATLAB app (GUI)
├── convertToBW.m                   % Image preprocessing script
├── processAndClassifyImage.m       % Classifier logic
├── visualizeActivations.m          % CNN layer visualization
├── circuit_component_classifier.mat % Pretrained CNN model
├── temp/                           % Auto-generated folder for BW images
├── screenshots/                    % Optional: Screenshots for documentation
```

## Contributing

Feedback and contributions are always welcome!  
If you'd like to suggest improvements or collaborate:

📬 Email: **kaushikmak35@gmail.com**  
🔗 [GitHub Repository](https://github.com/Kaushikmak/CircuitVision)

## License

This project is licensed under the MIT License.
