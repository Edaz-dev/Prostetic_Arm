# Prosthetic Arm Control System with Deep Learning
This project focuses on developing a prosthetic arm control system using MATLAB, deep learning, and transfer learning with a modified AlexNet. The system is capable of detecting 25 objects in real-time with over 90% accuracy and recommending appropriate grip types (pinch, power, tripod) for seamless operation.

Key Features:

  - Object Detection: Trained deep learning model to classify 25 object types with high accuracy.
  - Grip Recommendation: Provides suggested grip types for known objects and recommends the best grip for unknown objects based on classification scores.
  - Transfer Learning: Leveraged a pre-trained AlexNet model, adapted for specific classification tasks.
  - Synthetic Data Generation: Used AI tools (ChatGPT and Playground AI) to generate diverse, high-quality synthetic images, improving the quality and quantity of training data.
  - Real-Time Integration: Processes live camera frames, resizes images for the network, and provides continuous classification and grip recommendations.

Challenges Addressed:

  - Managing compressed image quality to enhance detection accuracy.
  - Optimizing training parameters such as learning rate, batch size, and epochs.
  - Generating high-quality, diverse training images to improve the model's robustness.

This project explores the innovative application of deep learning to assistive technology, reimagining how prosthetic arms can function with greater consistency, accuracy, and ease.
