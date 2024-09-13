import 'package:flutter/material.dart';
import 'package:sample_exam_5/src/exam_screen_2.dart';

class ExamScreen1 extends StatefulWidget {
  const ExamScreen1({super.key});

  @override
  State<ExamScreen1> createState() => _ExamScreen1State();
}

class _ExamScreen1State extends State<ExamScreen1> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speichern'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ExamScreen2(),
            ),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _nameValidator,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Alter',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // TODO: validate age
                ),
                SizedBox(height: 16),
                FilledButton(
                  child: Text('Speichern'),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Speichern erfolgreich'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Speichern fehlgeschlagen'),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _nameValidator(String? value) {
    // TODO: Implement name validation
    return null;
  }
}
