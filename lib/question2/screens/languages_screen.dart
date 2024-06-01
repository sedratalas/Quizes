import 'package:flutter/material.dart';
import 'package:quiz_1/question2/get_data.dart';

class LanguagesScreen extends StatefulWidget {
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  List<String>? _languages;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeLanguages();
  }

  void _initializeLanguages() async {
    if (_languages == null) {
      await Future.delayed(Duration(seconds: 5));
    }
    _loadLanguages();
  }

  void _loadLanguages() async {
    var languagesFuture = GetData.languagesLoader.data;
    var languages = await languagesFuture;
    setState(() {
      _languages = languages;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Languages'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _languages == null || _languages!.isEmpty
          ? Center(child: Text('No languages found'))
          : ListView.builder(
        itemCount: _languages!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_languages![index]),
          );
        },
      ),
    );
  }
}

