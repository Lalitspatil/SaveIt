import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saveit/pages/instagram/insta_controller.dart';
import 'package:saveit/resources/colors.dart';
import 'package:saveit/resources/sizes.dart';
import 'package:saveit/widgets/app_bar.dart';
import 'package:saveit/widgets/text_button.dart';
import 'package:saveit/widgets/text_field.dart';
import 'package:video_player/video_player.dart';

class InstaView extends StatelessWidget {
  const InstaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InstaController>(
      builder: (_, viewModel, __) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Sizes.s60),
          child: CommanAppBar(
            text: viewModel.getValue("tittle"),
            isBackButon: true,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(Sizes.s15),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(Sizes.s20),
                decoration: BoxDecoration(
                  color: CColors.white,
                  border: Border.all(color: CColors.borderGrey),
                  borderRadius: BorderRadius.all(
                      Radius.circular(DeviceRadius.s15)),
                ),
                child: Column(
                  children: [
                    AppTextField(
                      controller: viewModel.urlController,
                      hintText: viewModel.getValue('paste'),
                      prefixIcon: Icon(Icons.link),
                    ),
                    SizedBox(height: DeviceHeight.s10),
                    SizedBox(
                      width: double.infinity,
                      height: DeviceHeight.s50,
                      child: AppButton(
                        text: viewModel.getValue('fetch_media'),
                        onPressed: viewModel.fetchMedia,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: DeviceHeight.s20),

              /// 🔥 LOADING
              if (viewModel.isLoading)
                CircularProgressIndicator(),

              /// 🔥 MEDIA LIST
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.mediaList.length,
                  itemBuilder: (context, index) {
                    final item = viewModel.mediaList[index];

                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: CColors.borderGrey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          /// 🎥 VIDEO
                          if (item["type"] == "video")
                            VideoPlayerWidget(url: item["url"]),

                          /// 🖼 IMAGE
                          if (item["type"] == "image")
                            Image.network(item["url"]),

                          SizedBox(height: 10),

                          /// ⬇ DOWNLOAD
                          SizedBox(
                            width: double.infinity,
                            child: AppButton(
                              text: "Download",
                              onPressed: () =>
                                  viewModel.downloadMedia(item["url"]),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 🎥 VIDEO PLAYER WIDGET
class VideoPlayerWidget extends StatefulWidget {
  final String url;

  const VideoPlayerWidget({super.key, required this.url});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return CircularProgressIndicator();
    }

    return Column(
      children: [
        AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
        IconButton(
          icon: Icon(
            controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
          onPressed: () {
            setState(() {
              controller.value.isPlaying
                  ? controller.pause()
                  : controller.play();
            });
          },
        )
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}