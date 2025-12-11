// To parse this JSON data, do
//
//     final movieCreditModel = movieCreditModelFromJson(jsonString);

import 'dart:convert';

MovieCreditModel movieCreditModelFromJson(String str) => MovieCreditModel.fromJson(json.decode(str));

// String movieCreditModelToJson(MovieCreditModel data) => json.encode(data.toJson());

class MovieCreditModel {
    final int? id;
    final List<Cast>? cast;
    final List<Cast>? crew;

    MovieCreditModel({
        this.id,
        this.cast,
        this.crew,
    });

    factory MovieCreditModel.fromJson(Map<String, dynamic> json) => MovieCreditModel(
        id: json["id"],
        cast: json["cast"] == null ? [] : List<Cast>.from(json["cast"]!.map((x) => Cast.fromJson(x))),
        crew: json["crew"] == null ? [] : List<Cast>.from(json["crew"]!.map((x) => Cast.fromJson(x))),
    );


}

class Cast {
    final bool? adult;
    // final int? gender;
    final int? id;
    // final Department? knownForDepartment;
    final String? name;
    final String? originalName;
    // final double? popularity;
    final String? profilePath;
    final int? castId;
    final String? character;
    // final String? creditId;
    // final int? order;
    // final Department? department;
    // final String? job;

    Cast({
        this.adult,
        // this.gender,
        this.id,
        // this.knownForDepartment,
        this.name,
        this.originalName,
        // this.popularity,
        this.profilePath,
        this.castId,
        this.character,
        // this.creditId,
        // this.order,
        // this.department,
        // this.job,
    });

    factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        // gender: json["gender"],
        id: json["id"],
        // knownForDepartment: departmentValues.map[json["known_for_department"]]!,
        name: json["name"],
        originalName: json["original_name"],
        // popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"],
        character: json["character"],
        // creditId: json["credit_id"],
        // order: json["order"],
        // department: departmentValues.map[json["department"]]!,
        // job: json["job"],
    );

   
}