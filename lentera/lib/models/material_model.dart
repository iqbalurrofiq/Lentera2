enum CourseMaterialType { pdf, video, quiz }

class MaterialItem {
  final String title;
  final CourseMaterialType type;
  final bool isCompleted;

  MaterialItem({
    required this.title,
    required this.type,
    this.isCompleted = false,
  });
}
