import 'package:emp_demo/services/emp_operations.dart';
import 'package:flutter/material.dart';

import 'package:emp_demo/models/employee.dart';

class AddEmployee extends StatelessWidget {
  final TextEditingController nameCotroller = TextEditingController();
  final TextEditingController postCotroller = TextEditingController();
  final TextEditingController salaryCotroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            // Text filed for name
            TextField(
              controller: nameCotroller,
              decoration: InputDecoration(hintText: 'Employee Name'),
            ),
            SizedBox(height: 16),

            // Text field for post
            TextField(
              controller: postCotroller,
              decoration: InputDecoration(hintText: 'Employee Post'),
            ),
            SizedBox(height: 16),

            // text field for salary
            TextField(
              controller: salaryCotroller,
              decoration: InputDecoration(hintText: 'Employee Salary'),
            ),
            SizedBox(height: 16),

            // do operation on button click
            RaisedButton(
              child: Text('Add Employee'),
              onPressed: () {
                String n = nameCotroller.text;
                String p = postCotroller.text;
                int s = int.parse(salaryCotroller.text);

                Employee e = Employee(name: n, post: p, salary: s);

                // add employee to database
                EmpOperations.addEmployee(e);

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
