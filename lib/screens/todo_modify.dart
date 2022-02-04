import 'package:flutter/material.dart';

class TodoModify extends StatefulWidget {
  final int? taskId;
  final String? title;
  final String? description;
  TodoModify({
    this.taskId,
    this.title,
    this.description,
  });

  @override
  State<TodoModify> createState() => _TodoModifyState();
}

class _TodoModifyState extends State<TodoModify> {
  String _title = '';
  String _description = '';
  bool get isEditing => widget.taskId != null;
  TextEditingController? _titleController;
  TextEditingController? _descriptionController;
  @override
  void initState() {
    _titleController = TextEditingController(text: widget.title);
    _descriptionController = TextEditingController(text: widget.description);
    super.initState();
  }

  @override
  void dispose() {
    _titleController?.dispose();
    _descriptionController?.dispose();
    super.dispose();
  }

  //int count = 1;
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text(isEditing ? 'Edit Task' : 'Assign Task'),
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {}, //.....
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.check_sharp,
                size: _size.height * 0.05,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.title,
                //controller: _titleController,
                onChanged: (titlee) => setState(
                  () => titlee = _title,
                ),
                autofocus: true, //...
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  labelText: 'Title: ',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: _size.height * 0.035,
              ),
              TextFormField(
                initialValue: widget.description,
                onChanged: (desc) => setState(() => desc = _description),
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
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              // FloatingActionButton(
              //   onPressed: () {
              //     setState(() {
              //       count += 1;
              //     });
              //   },
              //   child: Text('+1'),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     setState(() {
              //       count = 0;
              //     });
              //   },
              //   child: Text('Reset count'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
