class ShowModel {
  final double score;
  final Show show;

  ShowModel({
    required this.score,
    required this.show,
  });

  factory ShowModel.fromJson(Map<String, dynamic> json) {
    return ShowModel(
      score: json['score'],
      show: Show.fromJson(json['show']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'show': show.toJson(),
    };
  }
}

class Show {
  final int id;
  final String url;
  final String name;
  final String type;
  final String language;
  final List<String> genres;
  final String status;
  final int? runtime;
  final int? averageRuntime;
  final String? premiered;
  final String? ended;
  final String? officialSite;
  final Schedule schedule;
  final Rating rating;
  final int? weight;
  final Network? network;
  final dynamic webChannel;
  final dynamic dvdCountry;
  final Externals externals;
  final Image? image;
  final String summary;
  final int? updated;
  final Links links;

  Show({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    required this.schedule,
    required this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    required this.externals,
    this.image,
    required this.summary,
    this.updated,
    required this.links,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    // print(json);

    return Show(
      id: json['id'],
      url: json['url'] ?? "",
      name: json['name'] ?? "",
      type: json['type'] ?? "",
      language: json['language'] ?? "",
      genres: List<String>.from(json['genres'] ?? []),
      status: json['status'] ?? "",
      runtime: json['runtime'] ?? -1,
      averageRuntime: json['averageRuntime'] ?? -1,
      premiered: json['premiered'] ?? "",
      ended: json['ended'] ?? "",
      officialSite: json['officialSite'] ?? "",
      schedule: Schedule.fromJson(json['schedule'] ?? {}),
      rating: Rating.fromJson(json['rating'] ?? {}),
      weight: json['weight'] ?? -1,
      network:
          (json['network'] != null && json['network'] is Map<String, dynamic>)
              ? Network.fromJson(json['network'])
              : null,
      webChannel: json['webChannel'],
      dvdCountry: json['dvdCountry'],
      externals: Externals.fromJson(json['externals'] ?? {}),
      image: (json['image'] != null && json['image'] is Map<String, dynamic>)
          ? Image.fromJson(json['image'])
          : null,
      summary: json['summary'] ?? "",
      updated: json['updated'] ?? -1,
      links: Links.fromJson(json['_links'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'name': name,
      'type': type,
      'language': language,
      'genres': genres,
      'status': status,
      'runtime': runtime,
      'averageRuntime': averageRuntime,
      'premiered': premiered,
      'ended': ended,
      'officialSite': officialSite,
      'schedule': schedule.toJson(),
      'rating': rating.toJson(),
      'weight': weight,
      'network': network?.toJson(),
      'webChannel': webChannel,
      'dvdCountry': dvdCountry,
      'externals': externals.toJson(),
      'image': image?.toJson(),
      'summary': summary,
      'updated': updated,
      '_links': links.toJson(),
    };
  }
}

class Schedule {
  final String time;
  final List<String> days;

  Schedule({
    required this.time,
    required this.days,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      time: json['time'],
      days: List<String>.from(json['days']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'days': days,
    };
  }
}

class Rating {
  final double? average;

  Rating({
    this.average,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: json['average']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'average': average,
    };
  }
}

class Network {
  final int id;
  final String name;
  final Country? country;
  final String? officialSite;

  Network({
    required this.id,
    required this.name,
    this.country,
    this.officialSite,
  });

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: json['id'],
      name: json['name'],
      country: Country?.fromJson(json['country'] ?? {}),
      officialSite: json['officialSite'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'country': country?.toJson(),
      'officialSite': officialSite,
    };
  }
}

class Country {
  final String name;
  final String code;
  final String timezone;

  Country({
    required this.name,
    required this.code,
    required this.timezone,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      code: json['code'],
      timezone: json['timezone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'timezone': timezone,
    };
  }
}

class Externals {
  final int? tvrage;
  final int? thetvdb;
  final String imdb;

  Externals({
    this.tvrage,
    this.thetvdb,
    required this.imdb,
  });

  factory Externals.fromJson(Map<String, dynamic> json) {
    return Externals(
      tvrage: json['tvrage'] != null
          ? json['tvrage']
          : null, // Assign null directly,
      thetvdb: json['thetvdb'] != null ? json['thetvdb'] : null,
      imdb: json['imdb'] != null ? json['imdb'] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tvrage': tvrage,
      'thetvdb': thetvdb,
      'imdb': imdb,
    };
  }
}

class Image {
  final String medium;
  final String original;

  Image({
    required this.medium,
    required this.original,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      medium: json['medium'],
      original: json['original'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'medium': medium,
      'original': original,
    };
  }
}

class Links {
  final Self self;
  final PreviousEpisode? previousepisode;

  Links({
    required this.self,
    this.previousepisode,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: Self.fromJson(json['self']),
      previousepisode: json['previousepisode'] != null
          ? PreviousEpisode.fromJson(json['previousepisode'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'self': self.toJson(),
      'previousepisode': previousepisode?.toJson(),
    };
  }
}

class Self {
  final String href;

  Self({
    required this.href,
  });

  factory Self.fromJson(Map<String, dynamic> json) {
    return Self(
      href: json['href'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
    };
  }
}

class PreviousEpisode {
  final String href;
  final String name;

  PreviousEpisode({
    required this.href,
    required this.name,
  });

  factory PreviousEpisode.fromJson(Map<String, dynamic> json) {
    return PreviousEpisode(
      href: json['href'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
      'name': name,
    };
  }
}
