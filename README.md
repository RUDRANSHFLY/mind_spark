---

# **Mind Spark Quiz App**

Mind Spark is a dynamic and interactive Flutter-based quiz application that combines engaging gamification elements such as audio feedback, haptic responses, and smooth navigation. The app uses the MVC architecture for clean and maintainable code, making it easy to extend and scale.

---

## **Features**
- **API Integration**: Fetch quiz data dynamically using the Dio package.
- **Gamification**:  
  - **Audio Feedback**: Play positive or negative audio clips for correct and incorrect answers using `just_audio`.  
  - **Haptic Feedback**: Provide tactile responses for user interactions (light impact for correct answers and heavy impact for wrong ones).
- **Screens**:  
  - **Home Screen**: Displays quiz details and allows users to start the quiz.  
  - **Quiz Screen**: Presents questions with multiple-choice answers and provides immediate feedback.  
  - **Result Screen**: Displays the user's score and allows restarting the quiz.
- **Clean Architecture**: Implements the **MVC pattern** to separate concerns and ensure modular code.

---

## **Screenshots**
_Include screenshots of your app here (e.g., Home Screen, Quiz Screen, and Result Screen)._

| Screen Description                                    | Screenshot                                                                                                                               | Width | Height |
|--------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|-------|--------|
| Home Screen (Replace with yours)             | ![Home Screen](https://drive.google.com/drive/u/3/folders/115JMevEHOY-8mYDY8M9O_XsqGr1cmr8J)                                                                | 600   | 400   |
| Question Screen (Empty Selection) (Replace with yours) | ![Question Screen](https://drive.google.com/drive/u/3/folders/115JMevEHOY-8mYDY8M9O_XsqGr1cmr8J)                                                                | 600   | 400   |
| Correct Option Selected (Replace with yours)           | ![Correct Option](https://drive.google.com/drive/u/3/folders/115JMevEHOY-8mYDY8M9O_XsqGr1cmr8J)                                                                  | 600   | 400   |
| Wrong Option Selected (Replace with yours)             | ![Wrong Option](https://drive.google.com/drive/u/3/folders/115JMevEHOY-8mYDY8M9O_XsqGr1cmr8J)                                                                  | 600   | 400   |
| Result Screen (Replace with yours)                      | ![Result Screen](https://drive.google.com/drive/u/3/folders/115JMevEHOY-8mYDY8M9O_XsqGr1cmr8J)                                                                  | 600   | 400   |
| Result Screen (After Retaking Quiz) (Replace with yours) | ![Result Screen (Retake)](https://drive.google.com/drive/u/3/folders/115JMevEHOY-8mYDY8M9O_XsqGr1cmr8J)                                                              | 600   | 400   |

---

## **Technologies Used**
- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **Networking**: [Dio](https://pub.dev/packages/dio) for API calls
- **Audio**: [just_audio](https://pub.dev/packages/just_audio) for playing sound effects
- **Haptics**: Flutter's [HapticFeedback](https://api.flutter.dev/flutter/services/HapticFeedback-class.html) for tactile responses
- **Architecture**: MVC (Model-View-Controller)

---

## **Project Structure**

The project follows the **MVC structure** for better maintainability and scalability:

```
lib/
├── components/          # Reusable UI components (e.g., QuizCard, QuestionCard)
├── modal/               # Models for data handling (e.g., QuizInfo, QuizModel)
├── services/            # External service integration (e.g., API service for fetching quiz data)
├── state/               # State management logic using Provider
├── screens/             # Screens of the app (HomeScreen, QuizScreen, ResultScreen)
├── main.dart            # Main entry point of the app
```

---

## **How to Run**

### **Prerequisites**
- Install [Flutter](https://flutter.dev/docs/get-started/install) on your machine.
- Ensure you have a code editor like [VSCode](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).

### **Steps**
1. Clone the repository:
   ```bash
   git clone <repository_url>
   cd mind_spark
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Add the necessary assets (e.g., audio files) in your `pubspec.yaml`:
   ```yaml
   flutter:
     assets:
       - assets/sound/right.mp3
       - assets/sound/wrong.mp3
   ```
4. Run the app:
   ```bash
   flutter run
   ```

---

## **API Details**
The app fetches quiz data from a remote API using the Dio package. Example API response structure:
```json
{
  "title": "General Knowledge",
  "topic": "GK Quiz",
  "duration": 10,
  "correctAnswerPoint": 4,
  "wrongAnswerPoint": -1,
  "questions": [
    {
      "questionDesc": "What is the capital of France?",
      "options": [
        { "id": 1, "text": "Paris" },
        { "id": 2, "text": "London" },
        { "id": 3, "text": "Berlin" },
        { "id": 4, "text": "Madrid" }
      ],
      "answer": 1
    }
  ]
}
```

---

## **Key Functionalities**

1. **Home Screen**  
   - Displays quiz information (title, topic, duration, points for correct and wrong answers).  
   - Button to start the quiz.

2. **Quiz Screen**  
   - Displays questions with multiple-choice options.
   - Provides immediate feedback (audio and haptics) on answers.
   - Automatically navigates to the next question.

3. **Result Screen**  
   - Displays the final score and total number of questions.
   - Button to retake the quiz.

---

## **Future Improvements**
- Add support for multiple quizzes.
- Include a leaderboard for gamification.
- Add user authentication for personalized quizzes.

---

## **Contributing**
Contributions are welcome! Feel free to submit a pull request or open an issue for suggestions.

---

## **License**
This project is licensed under the MIT License.

---

This `README.md` is structured to provide an overview of your app, showcase its features, and guide users on running the project. Let me know if you'd like to tweak any sections! 🚀
