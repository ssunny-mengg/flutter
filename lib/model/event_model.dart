class EventModel {
    EventModel({
        required this.id,
        required this.name,
        required this.detail,
        required this.priority,
        required this.deadLine,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });


    int id;
    String name;
    String detail;
    String priority;
    String deadLine;
    String status;
    String createdAt;
    String updatedAt;

    factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        name: json["name"],
        detail: json["detail"],
        priority: json["priority"],
        deadLine: json["dead_line"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );
}
