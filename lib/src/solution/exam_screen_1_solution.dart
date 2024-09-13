import 'package:flutter/material.dart';
import 'package:sample_exam_5/src/exam_screen_2.dart';

class ExamScreen1Solution extends StatefulWidget {
  const ExamScreen1Solution({super.key});

  @override
  State<ExamScreen1Solution> createState() => _ExamScreen1SolutionState();
}

class _ExamScreen1SolutionState extends State<ExamScreen1Solution> {
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
                  validator: _ageValidator,
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
    String name = value ?? '';
    if (name.length < 3) {
      return 'Der Name muss mindestens 3 Zeichen lang sein';
    } else {
      return null;
    }
  }

  String? _ageValidator(String? value) {
    int? age = int.tryParse(value ?? '');
    if (age == null) {
      return 'Bitte geben Sie eine Zahl ein';
    } else if (age < 18) {
      return 'Das Alter muss mindestens 18 sein';
    } else if (age > 99) {
      return 'Das Alter darf maximal 99 sein';
    }
    return null;
  }
}
