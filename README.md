# 📝 TaskCrafter

TaskCrafter is a beautifully designed, simple task management iOS app that helps you stay organized and on top of your to-do list. Built using Swift, the app allows users to create, update, delete, and prioritize tasks with an intuitive interface, making task management effortless and enjoyable.

## ✨ Features

- **🆕 Add, Update, Delete Tasks:** Easily manage your tasks—create new ones, edit existing tasks, or remove them when completed.
- **⭐ Task Prioritization:** Prioritize your tasks as High, Medium, or Low, and have them visually distinguished for easy identification.
- **🌗 Light/Dark Mode:** Toggle between light and dark modes for better usability depending on your environment.
- **✅ Track Completion:** Mark tasks as completed, and see a visual indicator for finished tasks.

## 🚀 Setup Instructions

### Prerequisites

- **Xcode**: You’ll need Xcode installed on your Mac to run and build this project.
- **Swift 5.x**: The project is developed using Swift 5, so ensure you have the correct version installed.

### Steps

1. Clone this repository:

    ```bash
    git clone https://github.com/eshaanpandey/TaskCrafter.git
    cd TaskCrafter
    ```

2. Open the project in Xcode:

    ```bash
    open TaskCrafter.xcodeproj
    ```

3. Build and run the app:

    - Choose an iOS simulator or connect a physical iOS device.
    - Press the **Run** button in Xcode or hit `Cmd + R`.

## 🔧 Key Design Decisions

### MVC Architecture
The project follows the **Model-View-Controller (MVC)** design pattern:
- **Model:** `Task` and `TaskManager` classes handle data and logic.
- **View:** SwiftUI provides the user interface and is responsible for rendering the app’s visual components.
- **Controller:** Manages user interactions, updates the views, and coordinates with the model.

### Dark/Light Mode
The light/dark mode toggle enhances usability by allowing users to switch between modes based on personal preference or lighting conditions. 

## 📸 Screenshots
<img src="https://github.com/user-attachments/assets/f7ec033a-93f0-4bb7-8b16-714fde9a4b98" alt="Image 1" width="300" style="display: block; margin: 0 auto;"/>

<img src="https://github.com/user-attachments/assets/d9a9c13b-a667-4535-807c-cc342e4ce0c6" alt="Image 2" width="300" style="display: block; margin: 0 auto;"/>

<img src="https://github.com/user-attachments/assets/f4dda779-92da-49fa-9446-347703b23abd" alt="Image 3" width="300" style="display: block; margin: 0 auto;"/>

<img src="https://github.com/user-attachments/assets/6b7f8807-edc3-4d2a-8f75-7d169e9df68d" alt="Image 4" width="300" style="display: block; margin: 0 auto;"/>

<img src="https://github.com/user-attachments/assets/56d4ad8e-4b83-4569-9945-5c08f9ae7dfd" alt="Image 4" width="300" style="display: block; margin: 0 auto;"/>

## 🧪 Running Tests

1. Open the project in Xcode.
2. Press `Cmd + U` to run the included unit tests, or go to the `Product` menu and select `Test`.

The project includes unit tests for:
- Adding tasks
- Deleting tasks
- Updating tasks

## 🛠️ Technologies Used

- **Swift 5**
- **SwiftUI**
- **Xcode**
