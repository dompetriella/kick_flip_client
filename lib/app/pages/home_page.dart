import 'package:flutter/material.dart';

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
                      onPressed: () => _submitForm, child: Text("Play"))
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
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextFormField(
              controller: textController,
              maxLength: maxLength,
              decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.black),
                  counterText: '',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 5),
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
