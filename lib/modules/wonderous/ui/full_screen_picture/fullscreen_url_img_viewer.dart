import 'dart:async';

import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/gallery/gallery_header_controller.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/app_icons.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/app_loading_indicator.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/fullscreen_keyboard_listener.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/controls/app_header.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/controls/app_image.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/controls/circle_buttons.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/utils/app_haptics.dart';

class FullscreenUrlImgViewer extends StatelessWidget {
  FullscreenUrlImgViewer({super.key, required this.headerImageUrl});
  
  final String headerImageUrl;
  late List<String> urls = [];
  
  

  static const double imageScale = 2.5;
  final _isZoomed = ValueNotifier(false);
  final int index = 0;
  late final _controller = PageController(initialPage: index)
    ..addListener(_handlePageChanged);
  late final ValueNotifier<int> _currentPage = ValueNotifier(index);

  @override
  Widget build(BuildContext context) {
    // return Obx(() {
     return getDisplay([headerImageUrl]);
    // });
  }
  FullscreenKeyboardListener getDisplay(List<String> urls){
    Widget content = AnimatedBuilder(
          animation: _isZoomed,
          builder: (_, __) {
            final bool enableSwipe = !_isZoomed.value &&
                urls.length >
                    1;
            return PageView.builder(
              physics: enableSwipe
                  ? PageScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              controller: _controller,
              itemCount: urls.length,
              itemBuilder: (_, index) => _Viewer(
                  urls[index],
                  _isZoomed),
              onPageChanged: (_) => AppHaptics.lightImpact(),
            );
          },
        );

        content = Semantics(
          label:
              'FullScreenImageViewSemanticFull', //$strings.fullscreenImageViewerSemanticFull,
          container: true,
          image: true,
          child: ExcludeSemantics(child: content),
        );
return FullscreenKeyboardListener(
          onKeyDown: _handleKeyDown,
          child: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(child: content),
                AppHeader(onBack: _handleBackPressed, isTransparent: true),
                // Show next/previous btns if there are more than one image
                if (urls.length >
                    1) ...{
                  BottomCenter(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: ValueListenableBuilder(
                        valueListenable: _currentPage,
                        builder: (_, int page, __) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleIconBtn(
                                icon: AppIcons.prev,
                                onPressed: page == 0
                                    ? null
                                    : () => _animateToPage(page - 1),
                                semanticLabel:
                                    'Next', //$strings.semanticsNext(''),
                              ),
                              Gap(
                                  // $styles.insets.xs
                                  10),
                              CircleIconBtn(
                                  icon: AppIcons.prev,
                                  flipIcon: true,
                                  onPressed: page ==
                                          urls
                                                  .length -
                                              1
                                      ? null
                                      : () => _animateToPage(page + 1),
                                  semanticLabel: 'Next'
                                  // $strings.semanticsNext(''),
                                  )
                            ],
                          );
                        },
                      ),
                    ),
                  )
                }
              ],
            ),
          ),
        );
  }
  bool _handleKeyDown(KeyDownEvent event) {
    int dir = 0;
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      dir = -1;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      dir = 1;
    }
    if (dir != 0) {
      final focus = FocusManager.instance.primaryFocus;
      _animateToPage(_currentPage.value + dir);
      scheduleMicrotask(() {
        focus?.requestFocus();
      });
      return true;
    }
    return false;
  }

  void _handlePageChanged() => _currentPage.value = _controller.page!.round();

  void _handleBackPressed() =>
      // Navigator.pop(context, _controller.page!.round())
      Get.back();

  void _animateToPage(int page) {
    if (page >= 0 ||
        page <
            urls.length) {
      _controller.animateToPage(page,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }
}

class _Viewer extends StatefulWidget {
  const _Viewer(this.url, this.isZoomed);

  final String url;
  final ValueNotifier<bool> isZoomed;

  @override
  State<_Viewer> createState() => _ViewerState();
}

class _ViewerState extends State<_Viewer> with SingleTickerProviderStateMixin {
  final _controller = TransformationController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Reset zoom level to 1 on double-tap
  void _handleDoubleTap() => _controller.value = Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: _handleDoubleTap,
      child: InteractiveViewer(
        transformationController: _controller,
        onInteractionEnd: (_) =>
            widget.isZoomed.value = _controller.value.getMaxScaleOnAxis() > 1,
        minScale: 1,
        maxScale: 5,
        child: Hero(
          tag: widget.url,
          child: AppImage(
            image: NetworkImage(
              widget.url,
            ),
            fit: BoxFit.contain,
            scale: FullscreenUrlImgViewer.imageScale,
            progress: true,
          ),
        ),
      ),
    );
  }
}

