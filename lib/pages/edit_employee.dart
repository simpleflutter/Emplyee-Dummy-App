import 'package:flutter/material.dart';

import 'package:emp_demo/models/employee.dart';
import 'package:emp_demo/services/emp_operations.dart';

class EditEmployee extends StatelessWidget {
  final Employee employee;
  final int index;

  EditEmployee({this.employee, this.index});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController postController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = employee.name;
    postController.text = employee.post;
    salaryController.text = employee.salary.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Employee'),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Employee Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: postController,
              decoration: InputDecoration(hintText: 'Employee Post'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: salaryController,
              decoration: InputDecoration(hintText: 'Employee Salary'),
            ),
            SizedBox(height: 16),
            RaisedButton(
              child: Text('Edit Employee'),
              onPressed: () {
                String n = nameController.text;
                String p = postController.text;
                int s = int.parse(salaryController.text);

                Employee e = Employee(name: n, post: p, salary: s);
                EmpOperations.editEmployee(e, index);

                // go back to home page
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
