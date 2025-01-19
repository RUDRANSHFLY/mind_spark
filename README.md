Mind Spark Quiz App

Mind Spark is a dynamic and interactive Flutter-based quiz application that combines engaging gamification elements such as audio feedback, haptic responses, and smooth navigation. The app uses the MVC architecture for clean and maintainable code, making it easy to extend and scale.

Features

API Integration: Fetch quiz data dynamically using the Dio package.
Gamification:
  Audio Feedback: Play positive or negative audio clips for correct and incorrect answers using just_audio.
  Haptic Feedback: Provide tactile responses for user interactions (light impact for correct answers and heavy impact for wrong ones).
Screens:
  Home Screen: Displays quiz details and allows users to start the quiz.
  Quiz Screen: Presents questions with multiple-choice answers and provides immediate feedback.
  Result Screen: Displays the user's score and allows restarting the quiz.
Clean Architecture: Implements the MVC pattern to separate concerns and ensure modular code.

Screenshots

| Screen Description | Screenshot |
|---|---|
| Home Screen | ![Home Screen](https://drive.google.com/uc?id=FILE_ID "Home Screen") |
| Question Screen (Empty Selection) | ![Question Screen](https://drive.google.com/uc?id=FILE_ID "Question Screen") |
| Correct Option Selected | ![Correct Option](https://drive.google.com/uc?id=FILE_ID "Correct Option") |
| Wrong Option Selected | ![Wrong Option](https://drive.google.com/uc?id=FILE_ID "Wrong Option") |
| Result Screen | ![Result Screen](https://drive.google.com/uc?id=FILE_ID "Result Screen") |
| Result Screen (After Retaking Quiz) | ![Result Screen (Retake)](https://drive.google.com/uc?id=FILE_ID "Result Screen (Retake)") |

Technologies Used

Framework: Flutter
State Management: Provider
Networking: Dio for API calls
Audio: just_audio for playing sound effects
Haptics: Flutter's HapticFeedback for tactile responses
Architecture: MVC (Model-View-Controller)

Project Structure

The project follows the MVC structure for better maintainability and scalability:

lib/
├── components/          # Reusable UI components (e.g., QuizCard, QuestionCard)
├── modal/               # Models for data handling (e.g., QuizInfo, QuizModel)
├── services/            # External service integration (e.g., API service for fetching quiz data)
├── state/               # State management logic using Provider
├── screens/             # Screens of the app (HomeScreen, QuizScreen, ResultScreen)
├── main.dart            # Main entry point of the app

How to Run

Prerequisites

Install Flutter on your machine.
Ensure you have a code editor like VSCode or Android Studio.

Steps

Clone the repository:
```bash
git clone <repository_url>
