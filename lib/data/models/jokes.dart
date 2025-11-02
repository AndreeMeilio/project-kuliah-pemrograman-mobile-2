import 'dart:convert';

Jokes jokesFromJson(String str) => Jokes.fromJson(json.decode(str));

String jokesToJson(Jokes data) => json.encode(data.toJson());

class Jokes {
    String? type;
    String? setup;
    String? punchline;
    int? id;

    Jokes({
        this.type,
        this.setup,
        this.punchline,
        this.id,
    });

    factory Jokes.fromJson(Map<String, dynamic> json) => Jokes(
        type: json["type"],
        setup: json["setup"],
        punchline: json["punchline"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "setup": setup,
        "punchline": punchline,
        "id": id,
    };
}
