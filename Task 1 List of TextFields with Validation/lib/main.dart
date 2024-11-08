import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[100],
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Professional Form")),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: MyForm(),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  bool _isSubmitting = false;

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) return 'Name is required';

    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value))
      return 'Only alphabetic characters allowed';

    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';

    if (!RegExp(r'^[\w-]+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$').hasMatch(value))
      return 'Enter a valid email';

    return null;
  }

  String? _cnicValidator(String? value) {
    if (value == null || value.isEmpty) return 'CNIC is required';

    if (!RegExp(r'^\d{13}$').hasMatch(value))
      return 'Should be exactly 13 digits';

    return null;
  }

  String? _contactValidator(String? value) {
    if (value == null || value.isEmpty) return 'Contact Number is required';

    if (!RegExp(r'^\d{10,12}$').hasMatch(value)) return 'Should be 11 digits';

    return null;
  }

  String? _addressValidator(String? value) {
    if (value == null || value.isEmpty) return 'Address is required';

    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';

    if (!RegExp(
            r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$')
        .hasMatch(value))
      return 'At least 8 chars with letters, numbers, symbols';

    return null;
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);

      await Future.delayed(Duration(seconds: 2)); // Simulate loading

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Form submitted successfully!')));

      setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Name', hintText: 'Enter your full name'),
            validator: _nameValidator,
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Email', hintText: 'example@domain.com'),
            validator: _emailValidator,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'CNIC', hintText: '13-digit CNIC number'),
            validator: _cnicValidator,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Contact Number', hintText: '11 digit phone number'),
            validator: _contactValidator,
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Address', hintText: 'Enter your address'),
            validator: _addressValidator,
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Password', hintText: 'At least 8 characters'),
            obscureText: true,
            validator: _passwordValidator,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: _isSubmitting ? null : _submitForm,
            child: _isSubmitting
                ? CircularProgressIndicator(color: Colors.white)
                : Text('Submit', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
