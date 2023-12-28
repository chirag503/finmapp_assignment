import 'dart:convert';

// Convert JSON string to QuestionModel object
QuestionModel questionModelFromJson(String str) =>
    QuestionModel.fromJson(json.decode(str));

// Convert QuestionModel object to JSON string
String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

// Model class representing the overall structure of the questionnaire
class QuestionModel {
  final String? title;
  final String? name;
  final String? slug;
  final String? description;
  final QuestiionModelSchema1? schema;

  QuestionModel({
    this.title,
    this.name,
    this.slug,
    this.description,
    this.schema,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        title: json["title"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        schema: json["schema"] == null
            ? null
            : QuestiionModelSchema1.fromJson(json["schema"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "name": name,
        "slug": slug,
        "description": description,
        "schema": schema?.toJson(),
      };
}

// Model class representing the schema of the questionnaire
class QuestiionModelSchema1 {
  final List<QuestiionModelField>? fields;

  QuestiionModelSchema1({
    this.fields,
  });

  factory QuestiionModelSchema1.fromJson(Map<String, dynamic> json) =>
      QuestiionModelSchema1(
        fields: json["fields"] == null
            ? []
            : List<QuestiionModelField>.from(
                json["fields"]!.map((x) => QuestiionModelField.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fields": fields == null
            ? []
            : List<dynamic>.from(fields!.map((x) => x.toJson())),
      };
}

// Model class representing the fields of the questionnaire
class QuestiionModelField {
  final String? type;
  final int? version;
  final QuestiionModelSchema2? schema;

  QuestiionModelField({
    this.type,
    this.version,
    this.schema,
  });

  factory QuestiionModelField.fromJson(Map<String, dynamic> json) =>
      QuestiionModelField(
        type: json["type"],
        version: json["version"],
        schema: json["schema"] == null
            ? null
            : QuestiionModelSchema2.fromJson(json["schema"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "version": version,
        "schema": schema?.toJson(),
      };
}

// Model class representing the schema of a field in the questionnaire
class QuestiionModelSchema2 {
  final String? name;
  final String? label;
  final bool? hidden;
  final String? hiddenExpression;
  final bool? readonly;
  String? answer;
  final List<Option>? options;
  final List<QuestiionModelField>? fields;

  QuestiionModelSchema2({
    this.name,
    this.label,
    this.hidden,
    this.readonly,
    this.options,
    this.answer,
    this.fields,
    this.hiddenExpression,
  });

  factory QuestiionModelSchema2.fromJson(Map<String, dynamic> json) =>
      QuestiionModelSchema2(
        name: json["name"],
        label: json["label"],
        hidden: json["hidden"] is bool ? json["hidden"] : null,
        hiddenExpression: json["hidden"] is String ? json["hidden"] : null,
        readonly: json["readonly"],
        options: json["options"] == null
            ? []
            : List<Option>.from(
                json["options"]!.map((x) => Option.fromJson(x))),
        fields: json["fields"] == null
            ? []
            : List<QuestiionModelField>.from(
                json["fields"]!.map((x) => QuestiionModelField.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "label": label,
        "hidden": hidden,
        "readonly": readonly,
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
        "fields": fields == null
            ? []
            : List<dynamic>.from(fields!.map((x) => x.toJson())),
      };
}

// Model class representing an option in the questionnaire
class Option {
  final String? key;
  final String? value;

  Option({
    this.key,
    this.value,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}
