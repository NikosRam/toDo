import 'package:flutter/material.dart';

class AddToDoForm extends StatefulWidget {
  AddToDoForm({
    super.key,
  });

  @override
  State<AddToDoForm> createState() => _AddToDoFormState();
}

class _AddToDoFormState extends State<AddToDoForm> {
  final _formKey = GlobalKey<FormState>();

  var title = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(fontSize: 30, color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.yellow),
                  ),
                ),
                textInputAction: TextInputAction.done,
                cursorColor: Colors.black,
                cursorHeight: 25,
                style: const TextStyle(
                  fontSize: 25,
                ),
                onSaved: (value) {
                  title = value ?? '';
                },
                onFieldSubmitted: (_) {
                  _formKey.currentState?.save();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
