import 'dart:async';

import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quizzie_thunder/assets.dart';
import 'package:quizzie_thunder/logic/common/platform_info.dart';
import 'package:quizzie_thunder/logic/common/string_utils.dart';
import 'package:quizzie_thunder/logic/data/wonder_data.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/app_icons.dart';

import 'package:quizzie_thunder/modules/wonderous/ui/common/blend_mask.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/centered_box.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/comapss_divider.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/curved_clipper.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/fullscreen_keyboard_list_scroller.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/google_maps_marker.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/gradient_container.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/pop_router_on_over_scroll.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/scaling_list_item.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/static_text_scale.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/themed_text.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/controls/app_image.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/controls/button.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/controls/circle_buttons.dart';

import 'package:quizzie_thunder/modules/wonderous/ui/utils/context_utils.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/widgets/youtube_video_player.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/wonder_illustration/common/wonder_illustration.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/wonder_illustration/common/wonder_illustration_config.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/wonder_illustration/common/wonder_title_text.dart';
import 'package:quizzie_thunder/routes/app_routes.dart';
import 'package:quizzie_thunder/styles/styles.dart';
import 'package:quizzie_thunder/styles/wonders_color_extensions.dart';
import 'package:quizzie_thunder/utils/wonder_app_strings.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

part 'widgets/_app_bar.dart';
part 'widgets/_callout.dart';
part 'widgets/_circular_title_bar.dart';
part 'widgets/_collapsing_pull_quote_image.dart';
part 'widgets/_large_simple_quote.dart';
part 'widgets/_scrolling_content.dart';
part 'widgets/_section_divider.dart';
part 'widgets/_sliding_image_stack.dart';
part 'widgets/_title_text.dart';
part 'widgets/_top_illustration.dart';

class WonderEditorialScreen extends StatefulWidget {
  const WonderEditorialScreen(this.data,
      {super.key, required this.contentPadding});
  final WonderData data;
  // final SchoolDetailsModel data;
  //final void Function(double scrollPos) onScroll;
  final EdgeInsets contentPadding;

  @override
  State<WonderEditorialScreen> createState() => _WonderEditorialScreenState();
}

class _WonderEditorialScreenState extends State<WonderEditorialScreen> {
  late final ScrollController _scroller = ScrollController()
    ..addListener(_handleScrollChanged);
  final _scrollPos = ValueNotifier(0.0);
  final _sectionIndex = ValueNotifier(0);

  @override
  void dispose() {
    _scroller.dispose();
    super.dispose();
  }

  /// Various [ValueListenableBuilders] are mapped to the _scrollPos and will rebuild when it changes
  void _handleScrollChanged() {
    _scrollPos.value = _scroller.position.pixels;
  }

  // void _handleBackPressed() => context.go(ScreenPaths.home);
  void _handleBackPressed() => Get.toNamed(AppRoutes.dashboardPage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      bool shortMode = constraints.biggest.height < 700;
      double illustrationHeight = shortMode ? 250 : 280;
      double minAppBarHeight = shortMode ? 80 : 150;

      /// Attempt to maintain a similar aspect ratio for the image within the app-bar
      double maxAppBarHeight =
          min(context.widthPx, AppStyle().sizes.maxContentWidth1) * 1.2;
      // final backBtnAlign = appLogic.shouldUseNavRail() ? Alignment.topRight : Alignment.topLeft;
      final backBtnAlign = Alignment.topLeft;
      return PopRouterOnOverScroll(
        controller: _scroller,
        child: ColoredBox(
          color: AppStyle().colors.offWhite,
          child: Stack(
            children: [
              /// Background
              Positioned.fill(
                child: ColoredBox(color: widget.data.type.bgColor),
              ),

              /// Top Illustration - Sits underneath the scrolling content, fades out as it scrolls
              SizedBox(
                height: illustrationHeight,
                child: ValueListenableBuilder<double>(
                  valueListenable: _scrollPos,
                  builder: (_, value, child) {
                    // get some value between 0 and 1, based on the amt scrolled
                    double opacity = (1 - value / 700).clamp(0, 1);
                    return Opacity(opacity: opacity, child: child);
                  },
                  // This is due to a bug: https://github.com/flutter/flutter/issues/101872
                  child: RepaintBoundary(
                      child:
                          //      _TopIllustration(
                          //   widget.data.type,
                          //   widget.data,
                          //   // "tajMahal",
                          //   // Polish: Inject the content padding into the illustration as an offset, so it can center itself relative to the content
                          //   // this allows the background to extend underneath the vertical side nav when it has rounded corners.
                          //   fgOffset: Offset(widget.contentPadding.left / 2, 0),
                          // )
                          
                            AdaptiveImage(imageUrl: widget.data.headerPhoto, width: 600, height: 500)
                            ),
                ),
              ),

              // Scrolling content - Includes an invisible gap at the top, and then scrolls over the illustration
              TopCenter(
                // heightFactor: 1.0,
                child: Padding(
                  padding: widget.contentPadding,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    // height: double.infinity,
                    child: FocusTraversalGroup(
                      child: FullscreenKeyboardListScroller(
                        scrollController: _scroller,
                        child: CustomScrollView(
                          controller: _scroller,
                          scrollBehavior:
                              ScrollConfiguration.of(context).copyWith(),
                          key: PageStorageKey('editorial'),
                          slivers: [
                            /// Invisible padding at the top of the list, so the illustration shows through the btm
                            SliverToBoxAdapter(
                              child: SizedBox(height: illustrationHeight),
                            ),
                    
                            /// Text content, animates itself to hide behind the app bar as it scrolls up
                            SliverToBoxAdapter(
                              child: ValueListenableBuilder<double>(
                                valueListenable: _scrollPos,
                                builder: (_, value, child) {
                                  double offsetAmt = max(0, value * .3);
                                  double opacity =
                                      (1 - offsetAmt / 150).clamp(0, 1);
                                  return Transform.translate(
                                    offset: Offset(0, offsetAmt),
                                    child:
                                        Opacity(opacity: opacity, child: child),
                                  );
                                },
                                child: _TitleText(widget.data,
                                    scroller: _scroller),
                              ),
                            ),
                    
                            /// Collapsing App bar, pins to the top of the list
                            SliverAppBar(
                              pinned: true,
                              collapsedHeight: minAppBarHeight,
                              toolbarHeight: minAppBarHeight,
                              expandedHeight: maxAppBarHeight,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              leading: SizedBox.shrink(),
                              flexibleSpace: SizedBox.expand(
                                child: _AppBar(
                                  widget.data.type,
                                  widget.data,
                                  scrollPos: _scrollPos,
                                  sectionIndex: _sectionIndex,
                                ),
                              ),
                            ),
                    
                            /// Editorial content (text and images)
                            _ScrollingContent(widget.data,
                                scrollPos: _scrollPos,
                                sectionNotifier: _sectionIndex),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Home Btn
              // AnimatedBuilder(
              //   animation: _scroller,
              //   builder: (_, child) {
              //     return AnimatedOpacity(
              //       opacity: _scrollPos.value > 0 ? 0 : 1,
              //       duration: AppStyle().times.med,
              //       child: child,
              //     );
              //   },
              //   child: Align(
              //     alignment: backBtnAlign,
              //     child: Padding(
              //       padding: EdgeInsets.all(AppStyle().insets.sm),
              //       child: BackBtn(icon: AppIcons.north, onPressed: _handleBackPressed),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      );
    });
  }
}
class AdaptiveImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const  AdaptiveImage({super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Image>(
      future: _getImageWithAspectRatio(),
      builder: (BuildContext context, AsyncSnapshot<Image> snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return snapshot.data!;
        } else {
          return SizedBox(
            width: width,
            height: height,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
  Future<Image> _getImageWithAspectRatio() async {
    final Image image = Image.network(imageUrl);

    final Completer<Size> completer = Completer<Size>();
    image.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo info, bool _) {
          completer.complete(Size(
            info.image.width.toDouble(),
            info.image.height.toDouble(),
          ));
        },
      ),
    );
    final Size size = await completer.future;
    final double aspectRatio = size.width / size.height;

    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: width,
      height: height,
      alignment: Alignment.center,
    );
  }
}
