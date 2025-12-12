class ToDoModel{
  String? _id;

  String get id => _id!;

  set id(String value) {
    _id = value;
  }

  String get title => _title!;

  set title(String value) {
    _title = value;
  }

  String? _title;
  String? _desc;

  String get desc => _desc!;

  set desc(String value) {
    _desc = value;
  }
  ToDoModel({String? id, String? title, String? desc}):
        _desc = desc,
        _title = title,
        _id = id;

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'desc': desc};
  }

  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      id: map['id']?.toString(),
      title: map['title'],
      desc: map['desc'],
    );
  }


}