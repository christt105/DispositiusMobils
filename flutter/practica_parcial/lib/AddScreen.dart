import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add word'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              onEditingComplete: () {
                if (textEditingController.text.isNotEmpty)
                  Navigator.of(context).pop(textEditingController.text);
              },
              controller: textEditingController,
            ),
            RaisedButton(
              onPressed: () {
                if (textEditingController.text.isNotEmpty)
                  Navigator.of(context).pop(textEditingController.text);
              },
              child: Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}