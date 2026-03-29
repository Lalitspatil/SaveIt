import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saveit/resources/base_model.dart';
import 'package:saveit/services/insta_services.dart';
import 'package:saver_gallery/saver_gallery.dart';

class InstaController extends BaseModel {
  final InstaServices _service = InstaServices();

  TextEditingController urlController = TextEditingController();

  bool isLoading = false;

  List<Map<String, dynamic>> mediaList = [];

  /// 🔥 FETCH MEDIA
  Future<void> fetchMedia() async {
    if (urlController.text.isEmpty) return;

    isLoading = true;
    mediaList.clear();
    notifyListeners();

    final response = await _service.fetchMedia(urlController.text);

    if (response?.data != null && response?.httpStatusCode?.name == "success") {
      final data = response?.data;

      if (data["status"] == "success") {
        List media = data["media"];

        mediaList = media.map<Map<String, dynamic>>((e) {
          return {
            "type": e["type"],
            "url": e["url"],
          };
        }).toList();
      }
    }

    isLoading = false;
    notifyListeners();
  }

  /// 🔥 DOWNLOAD
  Future<void> downloadMedia(String url) async {
  try {
    final response = await NetworkAssetBundle(Uri.parse(url)).load(url);
    Uint8List bytes = response.buffer.asUint8List();

    final fileName = url.contains(".mp4")
        ? "video_${DateTime.now().millisecondsSinceEpoch}.mp4"
        : "image_${DateTime.now().millisecondsSinceEpoch}.jpg";

    await SaverGallery.saveImage(
      bytes,
      quality: 100,
      fileName: fileName,
      skipIfExists: false,
    );

  } catch (e) {
    debugPrint("Download error: $e");
  }
}
}