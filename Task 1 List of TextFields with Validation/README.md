# Professional Form App

This Flutter application provides a professional form interface with several fields that have specific validation rules. The form includes fields for name, email, CNIC, contact number, address, and password, with validation to ensure correct data input. The app is styled with a modern UI, providing feedback on invalid input and a loading indicator during form submission.

## Features
- Validates multiple fields with customized error messages.
- User-friendly interface with smooth UI interactions.
- Input validation for each field to ensure correct format and data requirements.
- Displays a success message upon successful form submission.

## Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your machine.
- A code editor, such as [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).

### Running the App

1. **Clone the Repository:**
   ```bash
   git clone <repository_url>
   cd <repository_directory>
Install Dependencies: Ensure all required Flutter packages are installed.

bash
Copy code
flutter pub get
Run the App:

To run on an Android emulator or iOS simulator:
bash
Copy code
flutter run
To run on a connected device:
bash
Copy code
flutter devices
flutter run -d <device_id>
Form Field Validations
The following fields are validated with custom rules:

Name: Must contain only alphabetic characters.
Email: Must follow a valid email format.
CNIC: Must be exactly 13 digits.
Contact Number: Must be between 10 to 12 digits.
Address: Required, with no specific format.
Password: Must be at least 8 characters long, containing letters, numbers, and symbols.
Dependencies
flutter/material.dart: Provides the foundational Flutter widgets and material design.
App Preview
The app displays each TextField in a clean, filled style with rounded borders. It also uses a loading indicator when submitting the form.
