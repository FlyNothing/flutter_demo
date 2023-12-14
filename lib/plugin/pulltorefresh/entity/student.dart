class Student {
  late int no;
  late String name;
  late String subject;
  late int score;

  Student(this.no, this.name, this.subject, this.score);
}

List<Student> _studentList = [
  Student(1, "赵一", "语文", 91),
  Student(2, "赵一", "数学", 87),
  Student(3, "赵一", "英语", 96),
  Student(4, "钱二", "语文", 90),
  Student(5, "钱二", "数学", 83),
  Student(6, "钱二", "英语", 99),
  Student(7, "孙三", "语文", 81),
  Student(8, "孙三", "数学", 82),
  Student(9, "孙三", "英语", 89),
  Student(10, "李四", "语文", 90),
  Student(11, "李四", "数学", 88),
  Student(12, "李四", "英语", 83),
  Student(13, "周五", "语文", 70),
  Student(14, "周五", "数学", 78),
  Student(15, "周五", "英语", 63),
  Student(16, "吴六", "语文", 50),
  Student(17, "吴六", "数学", 58),
  Student(18, "吴六", "英语", 73),
  Student(19, "郑七", "语文", 40),
  Student(20, "郑七", "数学", 48),
  Student(21, "郑七", "英语", 33),
  Student(22, "杨八", "语文", 90),
  Student(23, "杨八", "数学", 88),
  Student(24, "杨八", "英语", 83),
  Student(25, "王九", "语文", 95),
  Student(26, "王九", "数学", 98),
  Student(27, "王九", "英语", 93),
  Student(28, "卢十", "语文", 80),
  Student(29, "卢十", "数学", 81),
  Student(30, "卢十", "英语", 85),
];

List<Student> getStudent(int page, int pageSize) {
  int start = pageSize * (page - 1);
  if (start >= _studentList.length) {
    return List.empty();
  }
  int end = pageSize * page;
  end = end > _studentList.length ? _studentList.length : end;
  return _studentList.sublist(start, end);
}
