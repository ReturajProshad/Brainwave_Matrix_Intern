import 'package:hive/hive.dart';
part 'todoModel.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  bool isCompleted;

  TodoModel({
    required this.title,
    this.isCompleted = false, //
  });
}