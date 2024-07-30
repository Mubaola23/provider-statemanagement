class TodoModel {
  final String title;
  bool isCompleted;

  TodoModel({
    required this.title,
    this.isCompleted = false,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        title: json["title"],
        isCompleted: json["isCompleted"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "isCompleted": isCompleted,
      };
}
