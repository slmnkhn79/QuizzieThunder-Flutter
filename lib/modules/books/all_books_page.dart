import 'package:animated_gradient/animated_gradient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:quizzie_thunder/modules/books/all_books_controller.dart';
import 'package:quizzie_thunder/theme/colors_theme.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';
import 'package:quizzie_thunder/utils/constants.dart';

class AllBooksPage extends StatelessWidget {
  const AllBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    AllBooksController allBooksController = Get.find<AllBooksController>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "All Books",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.white),
          ),
          backgroundColor: ThemeColor.headerOne,
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.facebook_light_4,
        body: Obx(() => RefreshIndicator(
            onRefresh: () async {
              allBooksController.getAllBooks();
            },
            child: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width > 600
                      ? 600
                      : MediaQuery.of(context).size.width,
                  child: Container(
                    color: ThemeColor.headerThree,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: allBooksController.isLoading.value
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.9,
                              child: const Center(
                                  child: CircularProgressIndicator(
                                color: ThemeColor.white,
                              )),
                            )
                          : getAllBooksContainer(context, allBooksController),
                    ),
                  ),
                ),
              ),
            ))));
  }

  Column getAllBooksContainer(
      BuildContext context, AllBooksController allBooksController) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Text("Filters"),
        ),
        Divider(),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
                itemCount:
                    allBooksController.allBooksResponseModel!.books!.length,
                itemBuilder: (context, index) {
                  var item =
                      allBooksController.allBooksResponseModel!.books![index];
                  return InkWell(
                    onTap: () {
                      Get.toNamed('/bookById',
                          arguments: {ARG_BOOK_ID: item.id});
                    },
                    child: Container(
                      height: 100.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Card(
                          child: ListTile(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.bookName,
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                  style: TextStyle(
                                    // color: ThemeColor.headerOne,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Author - ${item.bookAuthor}, ",
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            // color: ThemeColor.headerOne
                                            fontSize: 12)),
                                    Text("Publisher - ${item.bookPublisher}",
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(fontSize: 12
                                            // color: ThemeColor.headerOne
                                            )),
                                  ],
                                ),
                              ],
                            ),
                            leading: Icon(Icons.book),
                            trailing: Text(
                              item.bookCategory,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }))
      ],
    );
  }
}
