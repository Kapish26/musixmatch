class Tracks {
  final List<TrackList> trackList;

  Tracks({required this.trackList});

  factory Tracks.fromJson(Map<String, dynamic> j) {
    var json = j['message']['body']['track_list'] as List;
    return Tracks(
      trackList: json.map((e) => TrackList.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['track_list'] = trackList.map((v) => v.toJson()).toList();

    return data;
  }
}

class TrackList {
  Track? track;

  TrackList({this.track});

  factory TrackList.fromJson(Map<String, dynamic> json) =>
      TrackList(track: Track.fromJson(json['track']));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['track'] = track != null ? track!.toJson() : null;

    return data;
  }
}

class Track {
  final int trackId;
  String? trackName;
  int? trackRating;
  int? commonTrackId;
  int? instrumental;
  int? explicit;
  int? hasLyrics;
  int? hasSubtitles;
  int? hasRichSync;
  int? numFavourite;
  int? albumId;
  String? albumName;
  int? artistId;
  String? artistName;
  String? trackShareUrl;
  String? trackEditUrl;
  int? restricted;
  String? updatedTime;
  PrimaryGenres? primaryGenres;

  Track(
      {required this.trackId,
      this.trackName,
      this.trackRating,
      this.commonTrackId,
      this.instrumental,
      this.explicit,
      this.hasLyrics,
      this.hasSubtitles,
      this.hasRichSync,
      this.numFavourite,
      this.albumId,
      this.albumName,
      this.artistId,
      this.artistName,
      this.trackShareUrl,
      this.trackEditUrl,
      this.restricted,
      this.updatedTime,
      this.primaryGenres});

  factory Track.fromJson(Map<String, dynamic> json) => Track(
      trackId: json['track_id'],
      trackName: json['track_name'],
      trackRating: json['track_rating'],
      commonTrackId: json['commontrack_id'],
      instrumental: json['instrumental'],
      explicit: json['explicit'],
      hasLyrics: json['has_lyrics'],
      hasSubtitles: json['has_subtitles'],
      hasRichSync: json['has_richsync'],
      numFavourite: json['num_favourite'],
      albumId: json['album_id'],
      albumName: json['album_name'],
      artistId: json['artist_id'],
      artistName: json['artist_name'],
      trackShareUrl: json['track_share_url'],
      trackEditUrl: json['track_edit_url'],
      restricted: json['restricted'],
      updatedTime: json['updated_time'],
      primaryGenres: json['primary_genres'] != null
          ? PrimaryGenres.fromJson(json['primary_genres'])
          : null);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['track_id'] = trackId;
    data['track_name'] = trackName;
    data['track_rating'] = trackRating;
    data['commontrack_id'] = commonTrackId;
    data['instrumental'] = instrumental;
    data['explicit'] = explicit;
    data['has_lyrics'] = hasLyrics;
    data['has_subtitles'] = hasSubtitles;
    data['has_richsync'] = hasRichSync;
    data['num_favourite'] = numFavourite;
    data['album_id'] = albumId;
    data['album_name'] = albumName;
    data['artist_id'] = artistId;
    data['artist_name'] = artistName;
    data['track_share_url'] = trackShareUrl;
    data['track_edit_url'] = trackEditUrl;
    data['restricted'] = restricted;
    data['updated_time'] = updatedTime;
    if (primaryGenres != null) {
      data['primary_genres'] = primaryGenres!.toJson();
    }
    return data;
  }
}

class PrimaryGenres {
  List<MusicGenreList>? musicGenreList;

  PrimaryGenres({this.musicGenreList});

  factory PrimaryGenres.fromJson(Map<String, dynamic> j) {
    var json = j['music_genre_list'] as List;
    return PrimaryGenres(
      musicGenreList: json.map((e) => MusicGenreList.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (musicGenreList != null) {
      data['music_genre_list'] =
          musicGenreList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MusicGenreList {
  MusicGenre? musicGenre;

  MusicGenreList({this.musicGenre});

  factory MusicGenreList.fromJson(Map<String, dynamic> json) => MusicGenreList(
      musicGenre: json['music_genre'] != null
          ? MusicGenre.fromJson(json['music_genre'])
          : null);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (musicGenre != null) {
      data['music_genre'] = musicGenre!.toJson();
    }
    return data;
  }
}

class MusicGenre {
  int? musicGenreId;
  int? musicGenreParentId;
  String? musicGenreName;
  String? musicGenreNameExtended;
  String? musicGenreVanity;

  MusicGenre(
      {this.musicGenreId,
      this.musicGenreParentId,
      this.musicGenreName,
      this.musicGenreNameExtended,
      this.musicGenreVanity});

  factory MusicGenre.fromJson(Map<String, dynamic> json) => MusicGenre(
        musicGenreId: json['music_genre_id'],
        musicGenreParentId: json['music_genre_parent_id'],
        musicGenreName: json['music_genre_name'],
        musicGenreNameExtended: json['music_genre_name_extended'],
        musicGenreVanity: json['music_genre_vanity'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['music_genre_id'] = musicGenreId;
    data['music_genre_parent_id'] = musicGenreParentId;
    data['music_genre_name'] = musicGenreName;
    data['music_genre_name_extended'] = musicGenreNameExtended;
    data['music_genre_vanity'] = musicGenreVanity;
    return data;
  }
}
