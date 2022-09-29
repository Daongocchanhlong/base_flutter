import 'package:base_src/extension/map_ex.dart';

class WorkResult {
  WorkResult({
    this.title,
    this.isDone,
  });

  factory WorkResult.fromMap(Map<String, dynamic> map) => WorkResult(
        title: map.getData('title') as String?,
        isDone: map.getData('isDone') as bool?,
      );

  String? title;
  bool? isDone;
}
