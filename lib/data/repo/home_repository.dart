import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import '../model/video_model.dart';

class HomeRepository {
  final Client _client;
  static HomeRepository? _instance;

  HomeRepository._internal() : _client = Client();

  factory HomeRepository() {
    _instance ??= HomeRepository._internal();
    return _instance!;
  }

  Future<List<VideoModel>> getVideoData() async {
    List<VideoModel> data = [];

    try {
      const baseUrl = 'https://hajjmanagment.online/api/external/atab/m360ict/get/video/app/test';
      final url = Uri.parse(baseUrl);

      var response = await _client.get(url);
      var decodedData = json.decode(response.body);
      if (response.statusCode == 200) {
        final List<VideoModel> videoData = List<VideoModel>.from(
          (decodedData['data'] as List).map(
            (e) => VideoModel.fromJson(e as Map<String, dynamic>),
          ),
        ).toList();
        data.addAll(videoData);
      } else {
        log('Error in api call : code ${response.statusCode}');
        throw Exception('An error occurred in fetching video data');
      }

      return data;
    } catch (e) {
      log('getVideoData() error : $e');
      throw Exception('An error occurred in fetching video data');
    }
  }
}
