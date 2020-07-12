import 'package:emp_demo/pages/add_employee.dart';
import 'package:emp_demo/pages/edit_employee.dart';
import 'package:emp_demo/services/emp_operations.dart';
import 'package:flutter/material.dart';

import 'package:emp_demo/models/employee.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: AppBar(
        title: Text('My Employee'),
      ),

      // Add button to navigate for AddEmployee
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddEmployee(),
            ),
          );

          setState(() {
            //
          });
        },
      ),

      // Body section
      body: employeeList.length == 0
          ? Center(
              child: Text('No Employee'),
            )
          : ListView.builder(
              itemCount: employeeList.length,
              itemBuilder: (BuildContext context, int index) {
                // get individual employee form array
                Employee e = employeeList[index];

                return ListTile(
                  leading: CircleAvatar(child: Text(e.name[0])),
                  title: Text(e.name),
                  subtitle: Text('${e.post} (${e.salary})'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          EmpOperations.deleteEmployee(index);
                          setState(() {
                            //
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                         await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => EditEmployee(
                                employee: e,
                                index: index,
                              ),
                            ),
                          );
                          setState(() {
                            //
                          });
                        },
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
