class Case {
  final String caseId; // Unique identifier for the case
  final String title;
  final DateTime filedDate;
  final String caseDescription;
  final String caseCategory;
  final String documentPath; // Path to the document in local storage (optional)
  final String
      caseStatus; // Status of the case (e.g., "Open", "Closed", "Pending")

  Case({
    required this.caseId,
    required this.title,
    required this.filedDate,
    required this.caseDescription,
    required this.caseCategory,
    this.documentPath = '',
    required this.caseStatus,
  });

  // Convert Case object to a Map for data storage (e.g., local storage, serialization)
  Map<String, dynamic> toMap() => {
        'caseId': caseId,
        'title': title,
        'filedDate': filedDate
            .toIso8601String(), // Use ISO8601String for date formatting
        'caseDescription': caseDescription,
        'caseCategory': caseCategory,
        'documentPath': documentPath,
        'caseStatus': caseStatus,
      };

  // Create a Case object from a Map (e.g., deserialization after data storage)
  factory Case.fromJson(Map<String, dynamic> json) {
    return Case(
      caseId: json['caseId'] as String,
      title: json['title'] as String,
      filedDate: DateTime.parse(json['filedDate'] as String),
      caseDescription: json['caseDescription'] as String,
      caseCategory: json['caseCategory'] as String,
      documentPath: json['documentPath'] as String,
      caseStatus: json['caseStatus'] as String,
    );
  }
}
