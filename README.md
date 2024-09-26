# News API App
A Flutter-based news application that fetches the latest headlines and category-based news using a REST API. The app features a sleek user interface, real-time news updates, and the ability to bookmark articles for offline viewing. State management is handled using the Provider package.

## Features

<b>Top Headlines:</b> Fetch and display the latest top news articles from various sources.

<b>Category-Based News:</b> Users can filter news articles by categories such as Business, Sports, Education, Politics, Entertainment, etc.

<b>Bookmark Functionality:</b> Users can bookmark their favorite news articles to access later.

<b>Read Full Articles:</b> Provides users with a webview to read the full content of the news articles.

<b>Responsive Design:</b> The app is built to look great on different screen sizes.

<b>Real-time Updates:</b> Refresh news with the latest updates using API calls.

<b>Provider for State Management:</b> All state management is done using the Provider package, ensuring a clear separation of concerns and easy scalability.

## Project Structure

```
lib/
│
├── customWidgets/
│   ├── constants.dart            # Contains constant values like colors, gradients
│   ├── customAppbar.dart         # Custom AppBar with gradients, actions
│   └── drawer.dart               # Drawer for navigation
│
├── model/
│   ├── articleModel.dart         # Data model for news articles fetched from API
│   └── bookmarkModel.dart        # Data model for bookmarks
│
├── provider/
│   └── news_provider.dart        # Manages news and bookmark states, fetches news from API
│
├── services/
│   └── news_api_service.dart     # Handles API requests and fetches data
│
├── view/
│   ├── webview/
│   │   └── readFullArticle.dart  # Webview to display full articles
│   ├── category.dart             # Category screen to filter articles by category
│   ├── news_details.dart         # Detailed view of a selected news article
│   ├── news_screen.dart          # Home screen showing top news and categories
│   └── show_bookmarks.dart       # Screen to show all bookmarked articles
│
└── main.dart                     # App entry point
```

## State Management

This app uses the **Provider** package for state management, which allows for an organized and scalable architecture. The `NewsProvider` class in `provider/news_provider.dart` handles:

- Fetching top headlines and category-based news.
- Storing bookmarks in a `Set` data structure for quick lookups and removal.
- Updating the UI based on state changes.

---

## Architecture

### 1. Layered Architecture

The app follows a layered architecture, which helps maintain clean separation of concerns and improves scalability and maintainability. The architecture is divided into the following layers:

1. **UI Layer (Views)**
2. **State Management Layer (Provider)**
3. **Business Logic Layer (Services)**
4. **Data Layer (Models)**

### 2. Architecture Layers

#### UI Layer (Views)
The UI layer consists of various screens and widgets responsible for rendering data and capturing user input. The UI components are structured as follows:

- **news_screen.dart**: Displays top headlines and categories on the home screen.
- **category.dart**: Filters and displays articles by specific categories.
- **news_details.dart**: Shows detailed information for a selected news article.
- **show_bookmarks.dart**: Displays all bookmarked articles.
- **readFullArticle.dart**: Opens a webview to read the full content of the news articles.

#### State Management Layer (Provider)
State management is decoupled from the UI and business logic using the Provider package. This ensures efficient management of the app's state and notifies the UI when changes occur.

- **news_provider.dart**: This is the central point for managing the state. It handles:
  - Loading and caching of news articles.
  - Fetching articles based on categories.
  - Storing and managing bookmarks.
  - Utilizing `ChangeNotifier` to notify the UI of state changes.

#### Business Logic Layer (Services)
The core business logic, such as making API calls, handling data transformation, and managing errors, is placed in this layer.

- **news_api_service.dart**: This service handles HTTP requests to fetch news data from the API. It abstracts API calls, error handling, and JSON parsing, then passes the data to the state management layer.

#### Data Layer (Models)
This layer defines the data structures used in the app, such as news articles and bookmarks.

- **articleModel.dart**: Defines the structure for a news article fetched from the API.
- **bookmarkModel.dart**: Defines the structure for a bookmarked news article.

---

## Flow of Data

1. **API Call**: On launch, the Provider (`news_provider.dart`) makes an API call through the `News API Service` (`news_api_service.dart`) to fetch the latest news articles or category-based news.
2. **State Management**: The Provider stores the fetched articles in its state and calls `notifyListeners()` to update the UI. The UI layer reflects the new state by displaying the articles.
3. **Bookmarking**: When a user bookmarks an article, the Provider stores the bookmark in a `Set` to avoid duplicates. The UI is notified about the state change, and the bookmarks list is updated accordingly.
4. **Webview**: When the user clicks on an article, they are navigated to the `readFullArticle.dart`, where they can view the full content in a webview.

---

## Key Design Patterns

### Provider Pattern
The app uses the Provider pattern to manage and share state across various screens. This avoids prop drilling and offers a centralized way to handle state and mutations.

### MVVM (Model-View-ViewModel)
While the app doesn't strictly follow the MVVM pattern, it aligns with MVVM principles by separating views, models, and state management.

- **View**: Screens that render the UI, such as `news_screen.dart`, `category.dart`, etc.
- **ViewModel**: The Provider (`news_provider.dart`) serves as the ViewModel, acting as the bridge between the view and the model, managing the business logic and updating the view when required.
- **Model**: Data models such as `articleModel.dart` and `bookmarkModel.dart` represent the app's data.

---

## Why This Architecture?

- **Separation of Concerns**: Each layer has a specific responsibility, improving maintainability and scalability.
- **Testability**: The layered structure allows for easy unit testing, particularly for the business logic and state management layers.
- **Reusability**: Models, services, and UI components can be easily reused across different parts of the app or in future projects.
- **Performance**: By efficiently managing state with Provider, only the necessary parts of the UI are rebuilt, ensuring optimal performance.

---
