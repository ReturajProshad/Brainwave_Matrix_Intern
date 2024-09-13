#  Todo List App with Theme Persistence Using Flutter, GetX, and Hive

A very very very simple Todo List App Using Getx (For statemanagement) And Hive (For Local Storage) 
using MVC Architecture

## structure
```
lib/
├── controllers/
|    ├── bindings/
│    |       └── initialBindings.dart  
│    ├── todo_controller.dart
│    └── theme_controller.dart
├── models/
│   ├── todoModel.dart
|   └── todoModel.g.dart
├── views/
│   └── home_page.dart
└── main.dart
```
## Project Overview

https://github.com/user-attachments/assets/23043070-1a8e-4b4b-964c-4626c9c72fdc

### Description:
The Todo List App is a mobile application designed to help users organize their tasks efficiently while providing a seamless and responsive user interface. The app offers functionality to add, edit, mark, and delete todos. It also allows users to switch between light and dark themes, with both their tasks and theme preferences being stored in local storage using Hive. This ensures that all data, including todos and the selected theme, persists across app restarts.

## Key Features:
##### Add Todos: 
Users can add new tasks to their todo list.
##### Mark as Completed: 
Tasks can be marked as completed or pending with a simple tap.
##### Delete Todos: 
Completed or unwanted tasks can be removed.
##### Persistent Local Storage: 
All todos are stored locally using Hive, ensuring data persists even after the app is closed.
##### Theme Support: 
The app supports both light and dark themes. Users can toggle the theme, and their preference is saved locally using Hive.
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
