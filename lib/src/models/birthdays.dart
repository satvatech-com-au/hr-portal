class Birthday {
  final String name;
  final DateTime date;

  Birthday({
    required this.name,
    required this.date,
  });
}

final List<Birthday> upcomingBirthdays = [
  Birthday(name: 'Alice Johnson', date: DateTime(1998, 04, 07)),
  Birthday(name: 'Bob Smith', date: DateTime(1998, 04, 07)),
  Birthday(name: 'Alice Johnson', date: DateTime(1998, 04, 07)),
  Birthday(name: 'Bob Smith', date: DateTime(1998, 04, 07)),
];
