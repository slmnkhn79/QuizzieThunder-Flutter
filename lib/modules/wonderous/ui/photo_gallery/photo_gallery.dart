import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizzie_thunder/models/gallery_details_response_model.dart';
import 'package:quizzie_thunder/modules/gallery/gallery_header_controller.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/app_loading_indicator.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/eight_way_swipe_detector.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/fullscreen_keyboard_listener.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common/hidden_collectible.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/controls/button.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/utils/app_haptics.dart';
import 'package:quizzie_thunder/styles/styles.dart';
import 'package:flutter/material.dart';

part '_animated_cutout_overlay.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({super.key, required this.eventId});

  final String eventId;

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  GalleryHeaderController galleryHeaderController =
      Get.find<GalleryHeaderController>();
  static const int _gridSize = 5;
  // Index starts in the middle of the grid (eg, 25 items, index will start at 13)
  int _index = ((_gridSize * _gridSize) / 2).round();
  Offset _lastSwipeDir = Offset.zero;
  final double _scale = 1;
  bool _skipNextOffsetTween = false;
  late Duration swipeDuration = AppStyle().times.med * .4;
  final _photoIds = ValueNotifier<List<EventsDetails>>([]);
  int get _imgCount => pow(_gridSize, 2).round();

  late final List<FocusNode> _focusNodes =
      List.generate(_imgCount, (index) => FocusNode());

  //TODO: Remove this field (and associated workarounds) once web properly supports ClipPath (https://github.com/flutter/flutter/issues/124675)
  final bool useClipPathWorkAroundForWeb = true;

  @override
  void initState() {
    super.initState();

    galleryHeaderController.getEventById();
    _initPhotoIds();
    _focusNodes[_index].requestFocus();
  }

  Future<void> _initPhotoIds() async {
    // var ids = unsplashLogic.getCollectionPhotos(widget.collectionId);
    var ids = galleryHeaderController.galleryDetailsResponseModel!.eventDetails;
    if (ids.isNotEmpty) {
      // Ensure we have enough images to fill the grid, repeat if necessary
      while (ids.length < _imgCount) {
        ids.addAll(List.from(ids));
        if (ids.length > _imgCount) ids.length = _imgCount;
      }
    }
    setState(() => _photoIds.value = ids ?? []);
  }

  void _setIndex(int value, {bool skipAnimation = false}) {
    if (value < 0 || value >= _imgCount) return;
    _skipNextOffsetTween = skipAnimation;
    setState(() => _index = value);
    _focusNodes[value].requestFocus();
  }

  /// Determine the required offset to show the current selected index.
  /// index=0 is top-left, and the index=max is bottom-right.
  Offset _calculateCurrentOffset(double padding, Size size) {
    double halfCount = (_gridSize / 2).floorToDouble();
    Size paddedImageSize = Size(size.width + padding, size.height + padding);
    // Get the starting offset that would show the top-left image (index 0)
    final originOffset = Offset(
        halfCount * paddedImageSize.width, halfCount * paddedImageSize.height);
    // Add the offset for the row/col
    int col = _index % _gridSize;
    int row = (_index / _gridSize).floor();
    final indexedOffset =
        Offset(-paddedImageSize.width * col, -paddedImageSize.height * row);
    return originOffset + indexedOffset;
  }

  /// Used for hiding collectibles around the photo grid.
  // int _getCollectibleIndex() {
  //   return switch (widget.wonderType) {
  //     WonderType.chichenItza || WonderType.petra => 0,
  //     WonderType.colosseum || WonderType.pyramidsGiza => _gridSize - 1,
  //     WonderType.christRedeemer || WonderType.machuPicchu => _imgCount - 1,
  //     WonderType.greatWall || WonderType.tajMahal => _imgCount - _gridSize
  //   };
  // }

  bool _handleKeyDown(KeyDownEvent event) {
    final key = event.logicalKey;
    Map<LogicalKeyboardKey, int> keyActions = {
      LogicalKeyboardKey.arrowUp: -_gridSize,
      LogicalKeyboardKey.arrowDown: _gridSize,
      LogicalKeyboardKey.arrowRight: 1,
      LogicalKeyboardKey.arrowLeft: -1,
    };

    // Apply key action, exit early if no action is defined
    int? actionValue = keyActions[key];
    if (actionValue == null) return false;
    int newIndex = _index + actionValue;

    // Block actions along edges of the grid
    bool isRightSide = _index % _gridSize == _gridSize - 1;
    bool isLeftSide = _index % _gridSize == 0;
    bool outOfBounds = newIndex < 0 || newIndex >= _imgCount;
    if ((isRightSide && key == LogicalKeyboardKey.arrowRight) ||
        (isLeftSide && key == LogicalKeyboardKey.arrowLeft) ||
        outOfBounds) {
      return false;
    }
    _setIndex(newIndex);
    return true;
  }

  /// Converts a swipe direction into a new index
  void _handleSwipe(Offset dir) {
    // Calculate new index, y swipes move by an entire row, x swipes move one index at a time
    int newIndex = _index;
    if (dir.dy != 0) newIndex += _gridSize * (dir.dy > 0 ? -1 : 1);
    if (dir.dx != 0) newIndex += (dir.dx > 0 ? -1 : 1);
    // After calculating new index, exit early if we don't like it...
    if (newIndex < 0 || newIndex > _imgCount - 1) {
      return; // keep the index in range
    }
    if (dir.dx < 0 && newIndex % _gridSize == 0) {
      return; // prevent right-swipe when at right side
    }
    if (dir.dx > 0 && newIndex % _gridSize == _gridSize - 1) {
      return; // prevent left-swipe when at left side
    }
    _lastSwipeDir = dir;
    AppHaptics.lightImpact();
    _setIndex(newIndex);
  }

  // Future<void> _handleImageTapped(int index, bool isSelected) async {
  //   if (_checkCollectibleIndex(index) && isSelected) return;
  //   if (_index == index) {
  //     final urls = _photoIds.value.map((e) {
  //       return UnsplashPhotoData.getSelfHostedUrl(e, UnsplashPhotoSize.xl);
  //     }).toList();
  //     int? newIndex = await appLogic.showFullscreenDialogRoute(
  //       context,
  //       FullscreenUrlImgViewer(urls: urls, index: _index),
  //     );

  //     if (newIndex != null) {
  //       _setIndex(newIndex, skipAnimation: true);
  //     }
  //   } else {
  //     _setIndex(index);
  //   }
  // }

  void _handleImageFocusChanged(int index, bool isFocused) {
    if (isFocused) {
      _setIndex(index);
    }
  }

  // bool _checkCollectibleIndex(int index) {
  //   return index == _getCollectibleIndex() && collectiblesLogic.isLost(widget.wonderType, 1);
  // }

  @override
  Widget build(BuildContext context) {
    return FullscreenKeyboardListener(
      onKeyDown: _handleKeyDown,
      child: ValueListenableBuilder<List<dynamic>>(
          valueListenable: _photoIds,
          builder: (_, value, __) {
            if (value.isEmpty) {
              return Center(child: AppLoadingIndicator());
            }
            Size imgSize =
                // context.isLandscape
                true
                    ? Size(context.widthPx * .5, context.heightPx * .66)
                    : Size(context.widthPx * .66, context.heightPx * .5);
            // imgSize = (widget.imageSize ?? imgSize) * _scale;
            // Get transform offset for the current _index
            final padding = AppStyle().insets.md;
            var gridOffset = _calculateCurrentOffset(padding, imgSize);
            gridOffset += Offset(0, -context.mq.padding.top / 2);
            final offsetTweenDuration =
                _skipNextOffsetTween ? Duration.zero : swipeDuration;
            final cutoutTweenDuration =
                _skipNextOffsetTween ? Duration.zero : swipeDuration * .5;
            return _AnimatedCutoutOverlay(
              animationKey: ValueKey(_index),
              cutoutSize: imgSize,
              swipeDir: _lastSwipeDir,
              duration: cutoutTweenDuration,
              opacity: _scale == 1 ? .7 : .5,
              enabled: useClipPathWorkAroundForWeb == false,
              child: SafeArea(
                bottom: false,
                // Place content in overflow box, to allow it to flow outside the parent
                child: OverflowBox(
                  maxWidth:
                      _gridSize * imgSize.width + padding * (_gridSize - 1),
                  maxHeight:
                      _gridSize * imgSize.height + padding * (_gridSize - 1),
                  alignment: Alignment.center,
                  // Detect swipes in order to change index
                  child: EightWaySwipeDetector(
                    onSwipe: _handleSwipe,
                    threshold: 30,
                    // A tween animation builder moves from image to image based on current offset
                    child: TweenAnimationBuilder<Offset>(
                      tween: Tween(begin: gridOffset, end: gridOffset),
                      duration: offsetTweenDuration,
                      curve: Curves.easeOut,
                      builder: (_, value, child) =>
                          Transform.translate(offset: value, child: child),
                      child: FocusTraversalGroup(
                        //policy: OrderedTraversalPolicy(),
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: _gridSize,
                          childAspectRatio: imgSize.aspectRatio,
                          mainAxisSpacing: padding,
                          crossAxisSpacing: padding,
                          children: List.generate(galleryHeaderController.galleryDetailsResponseModel!.eventDetails.length,
                              (i) => _buildImage(i, swipeDuration, imgSize)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _buildImage(int index, Duration swipeDuration, Size imgSize) {
    return FocusTraversalOrder(
        order: NumericFocusOrder(index.toDouble()),
        child: TweenAnimationBuilder<double>(
          duration: AppStyle().times.med,
          curve: Curves.easeOut,
          tween: Tween(begin: 1, end: index == _index ? 1.15 : 1),
          builder: (_, value, child) =>
              Transform.scale(scale: value, child: child),
          child: CachedNetworkImage(
            imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
            imageUrl: _photoIds.value[index].imageUrl,
            fit: BoxFit.cover,
            // size: UnsplashPhotoSize.large,
          ).animate().fade(),
        ));

    /// Bind to collectibles.statesById because we might need to rebuild if a collectible is found.
    // return FocusTraversalOrder(
    //   order: NumericFocusOrder(index.toDouble()),
    //   child: ValueListenableBuilder(
    //       valueListenable: collectiblesLogic.statesById,
    //       builder: (_, __, ___) {
    //         bool isSelected = index == _index;
    //         final imgUrl = _photoIds.value[index]['imageUrl'];
    //         late String semanticLbl;
    //         // if (_checkCollectibleIndex(index)) {
    //         //   semanticLbl = $strings.collectibleItemSemanticCollectible;
    //         // } else {
    //         //   semanticLbl = !isSelected
    //         //       ? $strings.photoGallerySemanticFocus(index + 1, _imgCount)
    //         //       : $strings.photoGallerySemanticFullscreen(index + 1, _imgCount);
    //         // }

    //         final photoWidget =

    //          TweenAnimationBuilder<double>(
    //           duration: AppStyle().times.med,
    //           curve: Curves.easeOut,
    //           tween: Tween(begin: 1, end: isSelected ? 1.15 : 1),
    //           builder: (_, value, child) => Transform.scale(scale: value, child: child),
    //           child: CachedNetworkImage(
    //             imageUrl: imgUrl,
    //             fit: BoxFit.cover,
    //             // size: UnsplashPhotoSize.large,
    //           ).animate().fade(),
    //         );

    //         return MergeSemantics(
    //           child: Semantics(
    //             focused: isSelected,
    //             image: !_checkCollectibleIndex(index),
    //             liveRegion: isSelected,
    //             onIncrease: () => _handleImageTapped(_index + 1, false),
    //             onDecrease: () => _handleImageTapped(_index - 1, false),
    //             child: _checkCollectibleIndex(index)
    //                 ? Center(
    //                     child: HiddenCollectible(widget.wonderType, index: 1, size: 100, focus: _focusNodes[index]),
    //                   )
    //                 : AppBtn.basic(
    //                     semanticLabel: semanticLbl,
    //                     focusNode: _focusNodes[index],
    //                     onFocusChanged: (isFocused) => _handleImageFocusChanged(index, isFocused),
    //                     onPressed: () => _handleImageTapped(index, isSelected),
    //                     child: ClipRRect(
    //                       borderRadius: BorderRadius.circular(8),
    //                       child: SizedBox(
    //                         width: imgSize.width,
    //                         height: imgSize.height,
    //                         child: (useClipPathWorkAroundForWeb == false)
    //                             ? photoWidget
    //                             : Stack(
    //                                 children: [
    //                                   photoWidget,
    //                                   // Because the web platform doesn't support clipPath, we use a workaround to highlight the selected image
    //                                   Positioned.fill(
    //                                     child: AnimatedOpacity(
    //                                       duration: AppStyle().times.med,
    //                                       opacity: isSelected ? 0 : .7,
    //                                       child: ColoredBox(color: AppStyle().colors.black),
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                       ),
    //                     ),
    //                   ),
    //           ),
    //         );
    //       }),
    // );
  }
}
