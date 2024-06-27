import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kick_flip_client/app/db_functions/client_functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _roomCodeController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _roomCodeController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      print("submitted");
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Theme.of(context).colorScheme.tertiary,
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Container(
                        height: 80,
                        width: 300,
                        color: Theme.of(context).colorScheme.primary,
                      )),
                  UserEntry(
                    textController: _roomCodeController,
                    title: 'Room Code',
                  ),
                  UserEntry(
                    textController: _usernameController,
                    title: 'Player Name',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          await addPlayerToRoom(
                              _usernameController.text.toUpperCase(),
                              _roomCodeController.text.toUpperCase(),
                              context);
                        }
                      },
                      child: Text("Play"))
                ],
              )),
        ),
      ),
    );
  }
}

class UserEntry extends StatelessWidget {
  final String title;
  final int maxLength;
  final TextEditingController textController;
  const UserEntry(
      {super.key,
      required this.textController,
      required this.title,
      this.maxLength = 20});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(title),
          ),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextFormField(
              controller: textController,
              maxLength: maxLength,
              inputFormatters: [UpperCaseTextFormatter()],
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.onPrimary,
                  labelStyle: const TextStyle(color: Colors.black),
                  counterText: '',
                  contentPadding: EdgeInsets.only(left: 16),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary),
                      borderRadius: BorderRadius.circular(15)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the room code';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return newValue.copyWith(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
