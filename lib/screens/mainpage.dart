import 'package:flutter/material.dart';
import 'package:todo_app/models/tasklist.dart';
import 'package:todo_app/screens/note_delete.dart';
import 'package:todo_app/screens/todo_modify.dart';
import '../widgets/drawer.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<TaskList> task = [
    TaskList(
      taskId: 1,
      title: "Play football",
      Description: "We have a very important match against real madrid.",
      createdAt: DateTime.now(),
    ),
    TaskList(
      taskId: 2,
      title: "Study for exam",
      Description: "The exam is from the next week.",
      important: true,
      createdAt: DateTime.now(),
    ),
    TaskList(
      taskId: 2,
      title: "Study for exam",
      Description: "The exam is from the next week.",
      important: true,
      createdAt: DateTime.now(),
      isCompleted: true,
    )
  ];

  //int count = 0;
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        title: null,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: _size.height * 0.03,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/pp.jpeg'),
                radius: _size.height * 0.028,
              ),
            ),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _size.height * 0.03,
              ),
              Text(
                'To-Do List',
                style: TextStyle(
                    fontSize: _size.height * 0.03, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: _size.height * 0.03),
              Text(
                '"A Goal Without a Plan is Just A wish"',
                style: TextStyle(
                    fontSize: _size.height * 0.027,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(height: _size.height * 0.06),
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_size.height * 0.05),
                  topRight: Radius.circular(_size.height * 0.05),
                ),
              ),
              child: ListView.separated(
                  itemBuilder: (_, index) {
                    return Dismissible(
                      key: ValueKey(task[index].taskId),
                      direction: DismissDirection.startToEnd,
                      onDismissed: (direction) {}, //...
                      confirmDismiss: (direction) async {
                        final result = await showDialog(
                          context: context,
                          builder: (_) => const noteDelete(),
                        );
                      },
                      background: Container(
                        color: Colors.orange,
                        padding: EdgeInsets.only(left: 16),
                        child: const Align(
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ), //...
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => TodoModify(
                                    taskId: task[index].taskId,
                                    title: task[index].title,
                                    description: task[index].Description,
                                  )));
                        },
                        leading: task[index].important
                            ? Icon(
                                Icons.assignment_late_outlined,
                              )
                            : Icon(Icons.assignment),
                        contentPadding: EdgeInsets.only(
                            top: 20, left: 25, right: 25, bottom: 15),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: _size.height * 0.03,
                              ),
                            ),
                            SizedBox(
                              height: _size.height * 0.01,
                            ),
                            Text(
                              task[index].Description,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: _size.height * 0.01),
                          ],
                        ),
                        subtitle: Text(
                            'Created at : ${formatDateTime(DateTime.now())}'),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                  itemCount: task.length),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => TodoModify()));
          //_incrementCount();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}-${dateTime.month}-${dateTime.year}';
  }
  // void _incrementCount() {
  //   setState(() {
  //     count++;
  //   });
  // }
}
