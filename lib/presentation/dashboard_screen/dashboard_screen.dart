import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sufi_ishq/core/app_export.dart';
import 'package:sufi_ishq/core/utils/constant.dart';
import 'package:sufi_ishq/core/utils/responsive.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/widget/home_app_bar.dart';
import 'package:sufi_ishq/presentation/dashboard_screen/widget/side_menu.dart';
import 'package:sufi_ishq/presentation/home_screen/home_screen.dart';
import 'package:sufi_ishq/theme/color_initializer.dart';
import 'package:sufi_ishq/core/audio_player_manager.dart';
import 'package:sufi_ishq/theme/app_style.dart';

class DashboardScreen extends StatelessWidget {
  final Responsive responsive = Responsive();
  final DashboardController controller = Get.put(DashboardController());

  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.width.value = MediaQuery.of(context).size.width;
    responsive.setContext(context);
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [

          Column(
            children: [
              controller.width.value < Constant.mobileSize
                  ? HomeAppBar()
                  : Container(),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.width.value < Constant.mobileSize
                        ? Container()
                        : Container(
                            color: getBackgroundColor(
                                ColorInitializer.background, context),
                            child: SideMenu()),
                    Expanded(
                      child: HomeScreen(),
                    ),
                    controller.width.value < Constant.mobileSize
                        ? Container()
                        : Container(
                            width: Constant.rightTabBarWidth,
                            color: getBackgroundColor(
                                ColorInitializer.background, context),
                          ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom:0,
            left: 0,
            right: 0,
            child: Container(
              height: responsive.setHeight(Constant.playerHeight),
              color: Colors.transparent,
              child: Column(
                children: [
                  StreamBuilder<DurationState>(
                    stream: controller.manager.durationState,
                    builder: (context, snapshot) {
                      final durationState = snapshot.data;
                      final progress = durationState?.progress ?? Duration.zero;
                      final buffered = durationState?.buffered ?? Duration.zero;
                      final total = durationState?.total ?? Duration.zero;
                      return ProgressBar(
                        progress: progress,
                        buffered: buffered,
                        progressBarColor: getBackgroundColor(ColorInitializer.secondaryContainer, context),
                        baseBarColor: getBackgroundColor(ColorInitializer.secondary, context),
                        bufferedBarColor: getBackgroundColor(ColorInitializer.secondary, context),
                        thumbColor: getBackgroundColor(ColorInitializer.secondary, context),
                        thumbCanPaintOutsideBar:false,
                        barCapShape:BarCapShape.square,
                        timeLabelTextStyle:const TextStyle(fontSize: 1,color: Colors.transparent),
                        total: total,
                        onSeek: controller.manager.player.seek,
                        onDragUpdate: (details) {
                          debugPrint(
                              '${details.timeStamp}, ${details.localPosition}');
                        },
                      );
                    },
                  ),
                  Container(
                    color: getBackgroundColor(ColorInitializer.background, context),
                    child: Row(
                      children: [
                        Container(
                          color:
                          getBackgroundColor(ColorInitializer.primary, context),
                          padding: const EdgeInsets.all(25),
                          child: Image.asset(
                            ImageConstant.imgCassette,
                            width: Constant.menuIconSize24,
                            height: Constant.menuIconSize24,
                          ),
                        ),
                        const SizedBox(
                          width: Constant.space10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Rawalpindi 101",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtUbuntuRegular14w500.copyWith(
                                    color: getForegroundColor(
                                        ColorInitializer.background, context))),
                            const SizedBox(
                              height: Constant.space5,
                            ),
                            Text("16 march, 1989",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtUbuntuRegular11w500.copyWith(
                                    color: getForegroundColor(
                                        ColorInitializer.background, context))),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text("00:00:00",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtUbuntuRegular14w500.copyWith(
                                    color: getForegroundColor(
                                        ColorInitializer.background, context))),
                            const SizedBox(
                              width: Constant.space10,
                            ),
                            StreamBuilder<PlayerState>(
                              stream: controller.manager.player.playerStateStream,
                              builder: (context, snapshot) {
                                final playerState = snapshot.data;
                                final processingState =
                                    playerState?.processingState;
                                final playing = playerState?.playing;
                                if (processingState == ProcessingState.loading ||
                                    processingState == ProcessingState.buffering) {
                                  return Container(
                                    margin: const EdgeInsets.all(Constant.space10),
                                    width: Constant.menuIconSize32,
                                    height: Constant.menuIconSize32,
                                    child: const CircularProgressIndicator(),
                                  );
                                } else if (playing != true) {
                                  return IconButton(
                                    icon: const Icon(Icons.play_arrow),
                                    iconSize: Constant.menuIconSize48,
                                    onPressed: controller.manager.player.play,
                                  );
                                } else if (processingState !=
                                    ProcessingState.completed) {
                                  return IconButton(
                                    icon: const Icon(Icons.pause),
                                    iconSize: Constant.menuIconSize48,
                                    onPressed: controller.manager.player.pause,
                                  );
                                } else {
                                  return IconButton(
                                    icon: const Icon(Icons.replay),
                                    iconSize: Constant.menuIconSize48,
                                    onPressed: () => controller.manager.player
                                        .seek(Duration.zero),
                                  );
                                }
                              },
                            ),
                            const SizedBox(
                              width: Constant.space10,
                            ),
                            Text("01:20:33",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtUbuntuRegular14w500.copyWith(
                                    color: getForegroundColor(
                                        ColorInitializer.background, context))),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 10),
                              child: Image.asset(
                                ImageConstant.imgAdd,
                                width: Constant.menuIconSize24,
                                height: Constant.menuIconSize24,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 10),
                              child: Image.asset(
                                ImageConstant.imgFavorite,
                                width: Constant.menuIconSize24,
                                height: Constant.menuIconSize24,
                              ),
                            ),
                            const SizedBox(
                              width: Constant.space10,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.muteUnMuteVolume();
                              },
                              child: Obx(
                                    () => (Icon(
                                  controller.isMute.value
                                      ? Icons.volume_off_rounded
                                      : Icons.volume_up_rounded,
                                  size: Constant.menuIconSize32,
                                )),
                              ),
                            ),
                            const SizedBox(
                              width: Constant.space10,
                            ),
                            Text("01:20:33",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtUbuntuRegular14w500.copyWith(
                                    color: getForegroundColor(
                                        ColorInitializer.background, context))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
