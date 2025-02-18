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

## Demo Videos

- [Home Screen Demo](https://drive.google.com/file/d/12GxXopO62vvTmtM2uWj3GPocMKYS77b5/view?usp=sharing)
- [Quiz Workflow Demo](https://drive.google.com/file/d/12HYEtsEDLCmY53fhyIkN79-_sHrPyhVE/view?usp=sharing)


## **Screenshots**
_Include screenshots of your app here (e.g., Home Screen, Quiz Screen, and Result Screen)._
<div style="display: flex; justify-content: space-between; overflow-x: auto; width: 100%;">

  <img src="assets/screenshots/home.jpg" alt="Home Screen" width="200" style="margin-right: 10px;">
  <img src="assets/screenshots/option.jpg" alt="Question Screen" width="200" style="margin-right: 50px;margin-bottom: 50px;">
  <img src="assets/screenshots/correct_answer.jpg" alt="Correct Option" width="200" style="margin-right:50px;margin-bottom: 50px;">
  <img src="assets/screenshots/wrong_answer.jpg" alt="Wrong Option" width="200" style="margin-right: 50px;margin-bottom: 50px;">
  <img src="assets/screenshots/result_screen.jpg" alt="Result Screen" width="200" style="margin-right: 50px;margin-bottom: 50px;">
  <img src="assets/screenshots/result2.jpg" alt="Result Screen (Retake)" width="200">

</div>





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
