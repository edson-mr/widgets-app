class Invitados {
  final String id;
  final String name;
  final DateTime? completedAt;

  Invitados({
    required this.id,
    required this.name,
    this.completedAt,
  });

  bool get done {
    return completedAt != null;
  }

  Invitados copywith({
    String? id,
    String? name,
    DateTime? completedAt,
  }) =>
      Invitados(
        id: id ?? this.id,
        name: name ?? this.name,
        completedAt: completedAt,
      );
}
