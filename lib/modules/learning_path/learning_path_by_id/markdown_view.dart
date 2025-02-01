import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:quizzie_thunder/modules/wonderous/ui/common_libs.dart';
import 'package:shimmer/shimmer.dart';

class MainTitle extends StatelessWidget {
  final String heading;

  MainTitle(this.heading);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        heading,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 51, 102)),
      ),
    );
  }
}

class ImageView extends StatelessWidget {
  final String imageUrl;

  const ImageView(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: CachedNetworkImage(
            imageUrl: imageUrl,
            imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.white,
                    child: Image.asset("assets/images/placeholder.png")),
            errorWidget: (context, url, error) => Icon(Icons.error)),
        // child: Image.network(imageUrl)
      ),
    );
  }
}

class SecondaryTitle extends StatelessWidget {
  final String heading;
  final String content;

  SecondaryTitle(this.heading, this.content);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          if (content.isNotEmpty)
            Padding(
                padding: const EdgeInsets.only(top: 4.0),
                // child: Text(content),
                child: formatText(content)),
        ],
      ),
    );
  }
}

class TertiaryTitle extends StatelessWidget {
  final String heading;
  final String content;

  TertiaryTitle(this.heading, this.content);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              heading,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 75, 46, 46)),
            ),
          ),
          if (content.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 16.0),
              // child: Text(content,style: TextStyle( color: Color.fromARGB(255,77,77,77)),),
              child: formatText(content),
            ),
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  final String heading;
  final String content;

  Content(this.heading, this.content);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              heading,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          if (content.isNotEmpty)
            Padding(
                padding: const EdgeInsets.only(
                  top: 4.0,
                  left: 16.0,
                ),
                // child: Text(content, style: TextStyle(color: Color.fromARGB(255,77,77,77)),),
                child: formatText(content)),
        ],
      ),
    );
  }
}

class MaterialTitle extends StatelessWidget {
  final String heading;
  final String content;

  MaterialTitle(this.heading, this.content);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              heading,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 127, 255)),
            ),
          ),
          if (content.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
                left: 16.0,
              ),
              // child: Text(content, style: TextStyle(color: Color.fromARGB(255,255 ,87,51)),),
              child: formatText(content),
            ),
        ],
      ),
    );
  }
}

RichText formatText(String text) {
  List<TextSpan> spans = [];
  RegExp exp = RegExp(r'\*\*(.*?)\*\*');
  Iterable<RegExpMatch> matches = exp.allMatches(text);
  int lastMatchEnd = 0;

  for (RegExpMatch match in matches) {
    if (match.start > lastMatchEnd) {
      spans.add(TextSpan(
        text: text.substring(lastMatchEnd, match.start),
        style: TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
      ));
    }
    spans.add(TextSpan(
      text: match.group(1),
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 127, 251)),
    ));
    lastMatchEnd = match.end;
  }

  if (lastMatchEnd < text.length) {
    spans.add(TextSpan(
      text: text.substring(lastMatchEnd),
      style: TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
    ));
  }

  return RichText(
    text: TextSpan(children: spans),
  );
}
