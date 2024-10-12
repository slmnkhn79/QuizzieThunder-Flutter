class SearchDialogResponseModel {
  final int code;
  final bool status;
  final String message;
  final List<SearchValue>? searchResults;

  SearchDialogResponseModel(
      {required this.code,
      required this.status,
      required this.message,
      required this.searchResults});

  factory SearchDialogResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchDialogResponseModel(
      code: json["code"],
      status: json["status"],
      message: json["message"],
      searchResults: json["searchResults"] == null
          ? []
          : List<SearchValue>.from(
              json["searchResults"]?.map((x) => SearchValue.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "searchResults": searchResults?.map((x) => x.toJson()).toList()
      };
}

class SearchValue {
  final String id;
  final String value;
  final String displayValue;

  SearchValue(
      {required this.id, required this.value, required this.displayValue});

  factory SearchValue.fromJson(Map<String, dynamic> json) {
    return SearchValue(
        id: json["id"],
        value: json["value"],
        displayValue: json["displayValue"]);
  }

  Map<String, dynamic> toJson() =>
      {"id": id, "value": value, "displayValue": displayValue};
}
