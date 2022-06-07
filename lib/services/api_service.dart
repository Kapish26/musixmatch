import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:musixmatch/constants/constants.dart';
import 'package:musixmatch/models/errors.dart';
import 'package:musixmatch/models/lyrics.dart';
import 'package:musixmatch/models/tracks.dart';

abstract class IApiService {
  Future<Tracks> getTrackList(int pageSize);

  Future<Map<String, dynamic>> getTrackDetails({required int trackId});
}

class ApiService implements IApiService {
  final String baseUrl = REMOTE_URL;
  final String apiKey = API_KEY;

  @override
  Future<Tracks> getTrackList(int pageSize) async {
    var response = await http.get(Uri.parse(
        '$baseUrl/chart.tracks.get?apikey=$apiKey&page_size=$pageSize&f_has_lyrics=1'));
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return Tracks.fromJson(jsonDecode(response.body));
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorFetchingRequest('Error in fetching the track list');
    }
  }

  @override
  Future<Map<String, dynamic>> getTrackDetails({required int trackId}) async {
    var trackDetailResponse = await http
        .get(Uri.parse('$baseUrl/track.get?apikey=$apiKey&track_id=$trackId'));
    var lyricsResponse = await http.get(Uri.parse(
        '$baseUrl/track.lyrics.get?apikey=$apiKey&track_id=$trackId'));
    if (trackDetailResponse.statusCode == 200 &&
        lyricsResponse.statusCode == 200) {
      if (trackDetailResponse.body.isNotEmpty &&
          lyricsResponse.body.isNotEmpty) {
        return {
          'trackDetail': Track.fromJson(
              jsonDecode(trackDetailResponse.body)['message']['body']['track']),
          'lyrics': Lyrics.fromJson(
              jsonDecode(lyricsResponse.body)['message']['body']['lyrics']),
        };
      }
      throw ErrorEmptyResponse();
    }
    throw ErrorFetchingRequest('Error in fetching track detail list');
  }
}
