# Project Structure

This document outlines the structure and purpose of the folders and files within the `lib/` directory of this Flutter project. This project uses a combination of the BLoC pattern to manage state and data flow.

## Folder Structure

### `lib/`

#### `core/`
- **Purpose:** Contains core utilities and shared components used throughout the application.
  - **`errors/`**
    - `exceptions.dart`: Defines custom exceptions for the application, helping to manage and categorize errors that may occur.
  - **`network/`**
    - `network_client.dart`: Configures and manages the `Dio` instance used for network requests. Includes setup for interceptors and network configuration.

#### `data/`
- **Purpose:** Handles data management including API services, repositories, and data models.
  - **`repositories/`**
    - `user_repository_impl.dart`: Implements the user repository interface, handling data operations related to user data and communication with the data sources.
    - `auth_repository_impl.dart`: Implements the authentication repository interface, managing authentication operations and data retrieval from the API.
  - **`sources/`**
    - **`services/`**
      - `api_service.dart`: Contains methods for making API requests using `Dio`. This class abstracts away the details of network requests and provides a simple interface for network operations.
      - `auth_service.dart`: Handles authentication-specific API requests and interactions with the authentication endpoints.

#### `domain/`
- **Purpose:** Contains business logic and domain-specific entities and repositories.
  - **`entities/`**
    - `user.dart`: Defines the user entity used throughout the application, representing the data model for user information.
    - `auth.dart`: Defines the authentication entity, including details such as tokens and user credentials.
  - **`repositories/`**
    - `user_repository.dart`: Defines the interface for user-related data operations, providing a contract for how user data should be managed.
    - `auth_repository.dart`: Defines the interface for authentication-related data operations, specifying the methods required for authentication and token management.

#### `presentation/`
- **Purpose:** Manages the UI and state management components, including BLoC logic and UI pages.
  - **`blocs/`**
    - **`authentication/`**
      - `authentication_bloc.dart`: Manages authentication state and business logic using BLoC.
      - `authentication_event.dart`: Defines events that can trigger changes in the authentication state.
      - `authentication_state.dart`: Defines various states of the authentication process (e.g., loading, authenticated, error).
    - **`user/`**
      - `user_bloc.dart`: Manages user-related state and business logic using BLoC.
      - `user_event.dart`: Defines events that can trigger changes in the user state.
      - `user_state.dart`: Defines various states related to user data (e.g., loading, loaded, error).
  - **`pages/`**
    - `login_page.dart`: The login page UI where users can enter their credentials to authenticate.
    - `home_page.dart`: The home page UI that is displayed after successful authentication.

#### `injections.dart`
- **Purpose:** Configures dependency injection using `GetIt`. This file sets up the services and repositories for dependency injection throughout the app.

#### `main.dart`
- **Purpose:** The entry point of the application. It initializes the app, sets up dependencies using `GetIt`, and runs the app's root widget.

## Summary

This project structure separates concerns into distinct layers:
- **Core Layer:** For fundamental utilities and configurations.
- **Data Layer:** For data handling, including API calls and repository implementations.
- **Domain Layer:** For business logic and domain-specific data models.
- **Presentation Layer:** For UI components and state management.

This organization helps maintain a clean and scalable codebase, adhering to best practices for Flutter development.
