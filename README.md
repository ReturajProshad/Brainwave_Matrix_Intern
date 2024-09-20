#  Todo List App with Theme Persistence Using Flutter, GetX, and Hive

A very very very simple Todo List App Using Getx (For statemanagement) And Hive (For Local Storage) 
using MVC Architecture

## structure
```
lib/
├── controllers/
|    ├── bindings/
│    |       └── initialBindings.dart
|    ├── constants.dart
│    ├── todo_controller.dart
│    └── theme_controller.dart
├── models/
│   ├── todoModel.dart
|   └── todoModel.g.dart
├── views/
│   ├── home_page.dart
│   ├── enter_user_name.dart
│   └── splash_screen.dart
└── main.dart
```
## Project Overview (version -1)

https://github.com/user-attachments/assets/23043070-1a8e-4b4b-964c-4626c9c72fdc

## Project Overview (version -2)


https://github.com/user-attachments/assets/0dc8c564-16c1-4324-9390-c2d03d63e623


### Description:
The Todo List App is a mobile application designed to help users efficiently manage and organize their tasks while providing an intuitive, responsive, and visually appealing user interface. The app allows users to add, edit, mark as in-progress or completed, and delete todos, with seamless functionality. In addition, it supports light and dark themes, with user preferences and todos stored persistently in local storage using Hive. This ensures that all data remains intact across app restarts, offering a smooth and consistent experience.

## Key Features:
##### Add Todos: 
Users can add new tasks to their todo list, which are categorized under various statuses such as "In Progress," "Completed," or "Not Started."
##### Mark as In Progress/Completed: 
Tasks can be marked as "In Progress" or "Completed" with an easy toggle, giving users control over their task status.
##### Delete Todos: 
Unwanted or completed tasks can be removed quickly with a delete button for efficient task management.
##### Persistent Local Storage: 
All todos are stored locally using Hive, ensuring data persists even after the app is closed.
##### Dynamic Theme Support:
The app offers light and dark mode themes that users can easily switch between. The selected theme is saved using Hive, ensuring preferences are maintained across sessions.
##### Responsive UI with Visual Feedback:
The user interface adapts dynamically to different screen sizes and task states. When no todos are available, the app displays visual feedback, such as relevant images indicating the empty state of each category (e.g., "All Todos" or "Completed").
##### Smooth State Management: 
State management is handled using GetX, which ensures a reactive UI and clean separation of logic.
#### Fast and Lightweight Storage: 
Hive is used for quick and efficient data storage, optimized for mobile use cases.

## Technologies Used:
### Flutter: 
For building the cross-platform mobile app.
### GetX: 
To manage the state of the app, handle navigation, and dependency injection.
### Hive: 
For local data persistence of todos and theme preferences.
### Dart: 
Programming language used in Flutter to develop the app.

# Architecture:
The app follows the MVC (Model-View-Controller) architecture pattern:

### Model:
This layer includes the Todomodel class, which defines the structure of the todo items stored in Hive.
Hive also manages the persistence of todos and theme data in this layer.
### View:
The UI layer is handled by Flutter widgets. Pages like the Homepage display the list of todos, with Card and ListTile widgets styled differently for dark and light themes.
The theme and todos are dynamically updated based on changes in the model, ensuring that the UI stays reactive.
### Controller:
The GetX controllers like TodoController and ThemeController handle all the business logic.
TodoController interacts with Hive to retrieve and save todos, as well as manage their status.
ThemeController toggles between dark and light themes and persists the user’s preference in local storage.

## Advantages of Using MVC:
### Separation of Concerns: 
The app logic is separated into models, views, and controllers, allowing each component to be developed and tested independently.
### Scalability: 
As the app grows, new features can easily be added to each layer without affecting others.
### Reactive UI: 
With GetX, the controllers react to changes in the model, and the views are updated accordingly without any boilerplate code.
