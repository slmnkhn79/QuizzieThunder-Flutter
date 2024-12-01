part of '../editorial_screen.dart';

class _ScrollingContent extends StatelessWidget {
  const _ScrollingContent(this.data, {super.key, required this.scrollPos, required this.sectionNotifier});
  // final WonderData data;
  final dynamic data;
  final ValueNotifier<double> scrollPos;
  final ValueNotifier<int> sectionNotifier;

  String _fixNewlines(String text) {
    const nl = '\n';
    final chunks = text.split(nl);
    while (chunks.last == nl) {
      chunks.removeLast();
    }
    chunks.removeWhere((element) => element.trim().isEmpty);
    final result = chunks.join('$nl$nl');
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Widget buildText(String value) => Focus(child: Text(_fixNewlines(value), style:AppStyle().text.body));

    Widget buildDropCapText(String value) {
      final TextStyle dropStyle =AppStyle().text.dropCase;
      final TextStyle bodyStyle =AppStyle().text.body;
      final String dropChar = value.substring(0, 1);
      final textScale = MediaQuery.of(context).textScaleFactor;
      final double dropCapWidth = StringUtils.measure(dropChar, dropStyle).width * textScale;
      final bool skipCaps = false;//!localeLogic.isEnglish;
      return Semantics(
        label: value,
        child: ExcludeSemantics(
          child: !skipCaps
              ? DropCapText(
                  _fixNewlines(value).substring(1),
                  dropCap: DropCap(
                    width: dropCapWidth,
                    height:AppStyle().text.body.fontSize! *AppStyle().text.body.height! * 2,
                    child: Transform.translate(
                      offset: Offset(0, bodyStyle.fontSize! * (bodyStyle.height! - 1) - 2),
                      child: Text(
                        dropChar,
                        overflow: TextOverflow.visible,
                        style:AppStyle().text.dropCase.copyWith(
                          color:AppStyle().colors.accent1,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  style:AppStyle().text.body,
                  dropCapPadding: EdgeInsets.only(right: 6),
                  dropCapStyle:AppStyle().text.dropCase.copyWith(
                    color:AppStyle().colors.accent1,
                    height: 1,
                  ),
                )
              : Text(value, style: bodyStyle),
        ),
      );
    }

    Widget buildHiddenCollectible({required int slot}) {
      List<
      // WonderType
      dynamic> getTypesForSlot(slot) {
        return ["getTypesForSlot"];
        // return switch (slot) {
          // 0 => [WonderType.chichenItza, WonderType.colosseum],
          // 1 => [WonderType.pyramidsGiza, WonderType.petra],
          // 2 => [WonderType.machuPicchu, WonderType.christRedeemer],
          // _ => [WonderType.tajMahal, WonderType.greatWall]
        // };
      }

      // return HiddenCollectible(
      //   data.type,
      //   index: 0,
      //   matches: getTypesForSlot(slot),
      //   size: 128,
      // );
      return Text("Hidden Collectible");
    }

    return SliverBackgroundColor(
      color:AppStyle().colors.offWhite,
      sliver: SliverPadding(
        padding: EdgeInsets.symmetric(vertical:AppStyle().insets.md),
        sliver: SliverList(
          delegate: SliverChildListDelegate.fixed([
            Center(
              child: SizedBox(
                width:AppStyle().sizes.maxContentWidth1,
                child: Column(children: [
                  ..._contentSection([
                    Center(child: buildHiddenCollectible(slot: 0)),

                    /// History 1
                    buildDropCapText(data.historyInfo1),

                    /// Quote1
                    _CollapsingPullQuoteImage(data: data, scrollPos: scrollPos),
                    Center(child: buildHiddenCollectible(slot: 1)),

                    /// Callout1
                    _Callout(text: data.callout1),

                    /// History 2
                    buildText(data.historyInfo2),
                    _SectionDivider(scrollPos, sectionNotifier, index: 1),

                    /// Construction 1
                    buildDropCapText(data.constructionInfo1),
                    Center(child: buildHiddenCollectible(slot: 2)),
                  ]),
                  Gap(AppStyle().insets.md),
                  _YouTubeThumbnail(id: data.videoId, caption: data.videoCaption),
                  Gap(AppStyle().insets.md),
                  ..._contentSection([
                    /// Callout2
                    Gap(AppStyle().insets.xs),
                    _Callout(text: data.callout2),

                    /// Construction 2
                    buildText(data.constructionInfo2),
                    _SlidingImageStack(scrollPos: scrollPos, type: data.type),
                    _SectionDivider(scrollPos, sectionNotifier, index: 2),

                    /// Location
                    buildDropCapText(data.locationInfo1),
                    _LargeSimpleQuote(text: data.pullQuote2, author: data.pullQuote2Author),
                    buildText(data.locationInfo2),
                  ]),
                  Gap(AppStyle().insets.md),
                  _MapsThumbnail(data),
                  Gap(AppStyle().insets.md),
                  ..._contentSection([Center(child: buildHiddenCollectible(slot: 3))]),
                  Gap(150),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  /// Helper widget to provide hz padding to multiple widgets. Keeps the layout of the scrolling content cleaner.
  List<Widget> _contentSection(List<Widget> children) {
    return [
      for (int i = 0; i < children.length - 1; i++) ...[
        Padding(
          padding: EdgeInsets.symmetric(horizontal:AppStyle().insets.md),
          child: children[i],
        ),
        Gap(AppStyle().insets.md)
      ],
      Padding(
        padding: EdgeInsets.symmetric(horizontal:AppStyle().insets.md),
        child: children.last,
      ),
    ];
  }
}

class _YouTubeThumbnail extends StatelessWidget {
  const _YouTubeThumbnail({super.key, required this.id, required this.caption});
  final String id;
  final String caption;

  String get imageUrl => 'https://www.wonderous.info/youtube/$id.jpg';

  @override
  Widget build(BuildContext context) {
    // On btn pressed:
    // void handlePressed() => context.go(ScreenPaths.video(id));
    void handlePressed()=> {};

    return MergeSemantics(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 400),
        child: Column(
          children: [
            AppBtn.basic(
              // semanticLabel: $strings.scrollingContentSemanticYoutube,
              semanticLabel: "scrollingContentSemanticYoutube",
              onPressed: handlePressed,
              child: Stack(children: [
                AppImage(image: NetworkImage(imageUrl), fit: BoxFit.cover, scale: 1.0),
                Positioned.fill(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(AppStyle().insets.xs),
                      decoration: BoxDecoration(
                        color:AppStyle().colors.black.withOpacity(0.66),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color:AppStyle().colors.white,
                        size:AppStyle().insets.xl,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Gap(AppStyle().insets.xs),
            Padding(
                padding: EdgeInsets.symmetric(horizontal:AppStyle().insets.md),
                child: Text(caption, style:AppStyle().text.caption)),
          ],
        ),
      ),
    );
  }
}

class _MapsThumbnail extends StatefulWidget {
  const _MapsThumbnail(this.data, {super.key});
  // final WonderData data;
  final dynamic data;

  @override
  State<_MapsThumbnail> createState() => _MapsThumbnailState();
}

class _MapsThumbnailState extends State<_MapsThumbnail> {
  CameraPosition get startPos => CameraPosition(target: LatLng(widget.data.lat, widget.data.lng), zoom: 3);

  @override
  Widget build(BuildContext context) {
    // void handlePressed() => context.go(ScreenPaths.maps(widget.data.type));
    void handlePressed()=> {};
    if (PlatformInfo.isDesktop) return SizedBox.shrink();
    return AspectRatio(
      aspectRatio: 1.65,
      child: MergeSemantics(
        child: Column(
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppStyle().corners.md),
                child: AppBtn.basic(
                  // semanticLabel: $strings.scrollingContentSemanticOpen,
                  semanticLabel: "scrollingContentSemanticOpen",
                  onPressed: handlePressed,

                  /// To prevent the map widget from absorbing the onPressed action, use a Stack + IgnorePointer + a transparent Container
                  child: Stack(
                    children: [
                      Positioned.fill(child: ColoredBox(color: Colors.transparent)),
                      IgnorePointer(
                        child: GoogleMap(
                          markers: {getMapsMarker(startPos.target)},
                          zoomControlsEnabled: false,
                          mapType: MapType.normal,
                          mapToolbarEnabled: false,
                          initialCameraPosition: startPos,
                          myLocationButtonEnabled: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Gap(AppStyle().insets.xs),
            Semantics(
              sortKey: OrdinalSortKey(0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:AppStyle().insets.md),
                child: Text(widget.data.mapCaption, style:AppStyle().text.caption),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliverBackgroundColor extends SingleChildRenderObjectWidget {
  const SliverBackgroundColor({
    super.key,
    required this.color,
    Widget? sliver,
  }) : super(child: sliver);

  final Color color;

  @override
  RenderSliverBackgroundColor createRenderObject(BuildContext context) {
    return RenderSliverBackgroundColor(
      color,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderSliverBackgroundColor renderObject) {
    renderObject.color = color;
  }
}

class RenderSliverBackgroundColor extends RenderProxySliver {
  RenderSliverBackgroundColor(this._color);

  Color get color => _color;
  Color _color;
  set color(Color value) {
    if (value == color) {
      return;
    }
    _color = color;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null && child!.geometry!.visible) {
      final SliverPhysicalParentData childParentData = child!.parentData! as SliverPhysicalParentData;
      final Rect childRect =
          offset + childParentData.paintOffset & Size(constraints.crossAxisExtent, child!.geometry!.paintExtent);
      context.canvas.drawRect(
          childRect,
          Paint()
            ..style = PaintingStyle.fill
            ..color = color);
      context.paintChild(child!, offset + childParentData.paintOffset);
    }
  }
}
