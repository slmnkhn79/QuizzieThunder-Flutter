class AllBooksResponseModel {
AllBooksResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.books,
  });

  final int? code;
  final bool? status;
  final String? message;
  final List<Book>? books;

  factory AllBooksResponseModel.fromJson(Map<String, dynamic> json) {
    return AllBooksResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      books: json["books"] == null
          ? []
          : List<Book>.from(json["books"]!
              .map((x) => Book.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "books":
            books?.map((x) => x.toJson()).toList()
      };
}


class Book {
  final String id;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String bookName;
  final String bookAuthor;
  final String bookPublisher;
  final String bookDate; // If the date is not a standard format, you might want to keep it as a string
  final String bookPdfLink;
  final List<dynamic>? searchKeywords;
  final String bookType;
  final String bookCategory;

  Book({
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    required this.bookName,
    required this.bookAuthor,
    required this.bookPublisher,
    required this.bookDate,
    required this.bookPdfLink,
    required this.searchKeywords,
    required this.bookType,
    required this.bookCategory,
  });

  factory Book.fromJson(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      updatedAt: DateTime.parse(map['updatedAt']),
      createdAt: DateTime.parse(map['createdAt']),
      bookName: map['bookName'],
      bookAuthor: map['bookAuthor'] ?? 'Unknown', // handle null or default value
      bookPublisher: map['bookPublisher'] ?? 'Unknown',
      bookDate: map['bookDate'] ?? '',
      bookPdfLink: map['bookPdfLink'],
      searchKeywords: map['searchKeywords'] ?? [],
      bookType: map['bookType'],
      bookCategory: map['bookCategory'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'updatedAt': updatedAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'bookName': bookName,
      'bookAuthor': bookAuthor,
      'bookPublisher': bookPublisher,
      'bookDate': bookDate,
      'bookPdfLink': bookPdfLink,
      'searchKeywords': searchKeywords,
      'bookType': bookType,
      'bookCategory': bookCategory,
    };
  }
}