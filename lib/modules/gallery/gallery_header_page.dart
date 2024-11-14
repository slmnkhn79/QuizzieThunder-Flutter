import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/modules/gallery/gallery_header_controller.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';

class GalleryHeader extends StatelessWidget {
  const GalleryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    GalleryHeaderController galleryHeaderController =
        Get.find<GalleryHeaderController>();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ThemeColor.white,
              )),
          title: Obx(() => Text(
                galleryHeaderController.isLoading.value
                    ? "School Details"
                    : "School Details",
                // addPostController.quizCategoryName.isEmpty
                //     ? "Quizzes"
                //     : "${quizzesController.quizCategoryName} Quizzes",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ThemeColor.white),
              )),
          backgroundColor: ThemeColor.headerOne,
          centerTitle: false,
          elevation: 0,
        ),
        body: Obx(() => RefreshIndicator(
              onRefresh: () async {
                //fill the refresh value
              },
              child: galleryHeaderController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: ThemeColor.headerOne,
                    ))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80.0,
                            child: ScrollConfiguration(
                              behavior: MyCustomScrollBehavior(),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 100.0,
                                    // margin: EdgeInsets.all(5.0),
                                    // color: Colors.green,
                                    child: Center(child: InkWell(
                                      onTap: (){},
                                      child: Card( child : ListTile( title: Text(textAlign: TextAlign.center ,galleryHeaderController.galleryDatesResponse!.dates[index].year.toString())))
                                    )),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80.0,
                            child: ScrollConfiguration(
                              behavior: MyCustomScrollBehavior(),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 100.0,
                                    child: Center(child: InkWell(
                                      onTap: (){},
                                      child: Card( child : ListTile( title: Text(textAlign: TextAlign.center ,galleryHeaderController.galleryDatesResponse!.dates[index].month.toString())))
                                    )),
                                  );
                                },
                              ),
                            ),
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 100,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: EdgeInsets.all(10.0),
                                child: ListTile(
                                  leading: Icon(Icons.timeline),
                                  title: Text('Timeline Event $index'),
                                  subtitle: Text('Details about the event.'),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
            )));
  }
}
 class MyCustomScrollBehavior extends MaterialScrollBehavior {
      // Override behavior methods and getters like dragDevices
      @override
      Set<PointerDeviceKind> get dragDevices => { 
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
    }
