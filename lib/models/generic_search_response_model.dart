class GenericSearchResponseModel {
  final int code;
  final bool status;
  final String message;
  final List<SearchValue> searchResults;

  GenericSearchResponseModel(
      {required this.code,
      required this.status,
      required this.message,
      required this.searchResults
      });

  factory GenericSearchResponseModel.fromJson(Map<String, dynamic> json) {
    return GenericSearchResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"]
      ,
      searchResults: List<SearchValue>.from(
              json["searchValues"]!.map((x) => SearchValue.fromJson(x))),

    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "searchResults": searchResults.map((x) => x.toJson()).toList()
      };
}

class SearchValue {
  final String id;
  final int rank;
  final String displayValue;

  SearchValue(
      {required this.id, required this.rank, required this.displayValue});

  factory SearchValue.fromJson(Map<String, dynamic> json) {
    return SearchValue(
        id: json["id"],
        rank: json["search_rank"],
        displayValue: json["search_name"]);
  }

  Map<String, dynamic> toJson() =>
      {"id": id, "search_rank": rank, "search_name": displayValue};
}
