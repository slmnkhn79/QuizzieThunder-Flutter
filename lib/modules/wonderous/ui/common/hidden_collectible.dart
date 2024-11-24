import 'dart:async';

import 'package:quizzie_thunder/modules/wonderous/ui/common/app_icons.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/fullscreen_keyboard_listener.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/controls/app_image.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/controls/circle_buttons.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/utils/app_haptics.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/styles/styles.dart';


class FullscreenUrlImgViewer extends StatefulWidget {
  const FullscreenUrlImgViewer({super.key, required this.urls, this.index = 0});
  final List<String> urls;
  final int index;

  static const double imageScale = 2.5;

  @override
  State<FullscreenUrlImgViewer> createState() => _FullscreenUrlImgViewerState();
}

class _FullscreenUrlImgViewerState extends State<FullscreenUrlImgViewer> {
  final _isZoomed = ValueNotifier(false);
  late final _controller = PageController(initialPage: widget.index)..addListener(_handlePageChanged);
  late final ValueNotifier<int> _currentPage = ValueNotifier(widget.index);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

  void _handleBackPressed() => Navigator.pop(context, _controller.page!.round());

  void _animateToPage(int page) {
    if (page >= 0 || page < widget.urls.length) {
      _controller.animateToPage(page, duration: 300.ms, curve: Curves.easeOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = AnimatedBuilder(
      animation: _isZoomed,
      builder: (_, __) {
        final bool enableSwipe = !_isZoomed.value && widget.urls.length > 1;
        return PageView.builder(
          physics: enableSwipe ? PageScrollPhysics() : NeverScrollableScrollPhysics(),
          controller: _controller,
          itemCount: widget.urls.length,
          itemBuilder: (_, index) => _Viewer(widget.urls[index], _isZoomed),
          onPageChanged: (_) => AppHaptics.lightImpact(),
        );
      },
    );

    content = Semantics(
      // label: $strings.fullscreenImageViewerSemanticFull,
      label:"FullScreenImageViewerSemanticsFull",
      container: true,
      image: true,
      child: ExcludeSemantics(child: content),
    );

    return FullscreenKeyboardListener(
      onKeyDown: _handleKeyDown,
      child: Container(
        // color: $styles.colors.black,
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(child: content),
            // AppHeader(onBack: _handleBackPressed, isTransparent: true),
            // Show next/previous btns if there are more than one image
            if (widget.urls.length > 1) ...{
              BottomCenter(
                child: Padding(
                  // padding: EdgeInsets.only(bottom: $styles.insets.md),
                  padding: EdgeInsets.only(bottom: 8),
                  child: ValueListenableBuilder(
                    valueListenable: _currentPage,
                    builder: (_, int page, __) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleIconBtn(
                            icon: AppIcons.prev,
                            onPressed: page == 0 ? null : () => _animateToPage(page - 1),
                            semanticLabel: 'Next',
                          ),
                          Gap(AppStyle().insets.xs),
                          CircleIconBtn(
                            icon: AppIcons.prev,
                            flipIcon: true,
                            onPressed: page == widget.urls.length - 1 ? null : () => _animateToPage(page + 1),
                            semanticLabel: 'Next',
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
        onInteractionEnd: (_) => widget.isZoomed.value = _controller.value.getMaxScaleOnAxis() > 1,
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