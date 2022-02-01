import 'package:flutter/material.dart';

class TodoModify extends StatefulWidget {
  final int? taskId;
  final String? title;
  final String? description;
  TodoModify({this.taskId, this.title, this.description});

  @override
  State<TodoModify> createState() => _TodoModifyState();
}

class _TodoModifyState extends State<TodoModify> {
  bool get isEditing => widget.taskId != null;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text(isEditing ? 'Edit Task' : 'Assign Task'),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                print('saved');
              },
              child: Icon(
                Icons.save,
                size: _size.height * 0.05,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 15),
        child: Column(
          children: [
            TextField(
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                labelText: 'Title:',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 25,
                ),
                hintText: isEditing ? '${widget.title}' : null,
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            SizedBox(
              height: _size.height * 0.035,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(
                fontSize: 19,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                labelText: 'Description: ',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 25,
                ),
                hintText: isEditing ? '${widget.description}' : null,
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                ),
                hintMaxLines: 2,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
