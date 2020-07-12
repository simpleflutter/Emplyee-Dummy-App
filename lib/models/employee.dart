// Model class Employee
class Employee {
  final String name;
  final String post;
  final int salary;

  Employee({this.name, this.post, this.salary});
}

// Global object used by all page to add, edit & delete employee
List<Employee> employeeList = [];
