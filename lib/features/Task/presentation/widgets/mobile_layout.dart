import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:provider/provider.dart';
import 'package:task/core/SmoothPageIndicator/smooth_page_indicator.dart';
import 'package:task/core/SmoothPageIndicator/src/smooth_page_indicator.dart';
import 'package:task/features/Task/presentation/manager/task_view_model.dart';
import 'package:task/features/Task/presentation/widgets/meidum_widget.dart';
import 'package:task/features/Task/presentation/widgets/top_widget.dart';

import 'bottom_widget.dart';

class MobileLayout extends StatelessWidget {
  PreloadPageController _controller;

  MobileLayout() {
    _controller = PreloadPageController();
  }

  @override
  Widget build(BuildContext context) {
    TaskViewModel vm = Provider.of<TaskViewModel>(context);
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ValueListenableBuilder(
          valueListenable: vm.loading,
          builder: (context, loading, child) {
            return ModalProgressHUD(inAsyncCall: loading, child: child);
          },
          child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    actions: <Widget>[
                      Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          vm.toggleFavourite();
                        },
                        child: Icon(
                          vm.entity.isFavourite ? Icons.star : Icons.star_border,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      )
                    ],
                    leading: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      background: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Stack(children: [
                          PreloadPageView(
                              controller: _controller,
                              physics: AlwaysScrollableScrollPhysics(),
                              onPageChanged: (index) {
                                vm.pageNumber = index;
                              },
                              preloadPagesCount: 3,
                              children: vm.entity.headerImages
                                  .map((e) => Image.network(
                                        e.url,
                                        fit: BoxFit.fill,
                                      ))
                                  .toList()),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: SmoothPageIndicator(
                                controller: _controller, // PageController
                                count: vm.entity.headerImages.length,
                                effect: JumpingDotEffect(
                                    radius: 18.0,
                                    dotHeight: 10.0,
                                    dotWidth: 10.0,
                                    activeDotColor: Colors.white,
                                    dotColor: Colors.white70), // your preferred effect
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                ];
              },
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    TopWidget(),
                    Divider(
                      height: 1.0,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    MediumWidget(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    BottomWidget(),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
