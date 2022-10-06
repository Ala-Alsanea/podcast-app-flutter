// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:podcast_app/Config/components/bottom_app_bar_item.dart';
import 'package:podcast_app/Config/size_config.dart';
import 'package:podcast_app/Config/style.dart';

// import 'SizeConfig.dart';
class BottomBar extends StatelessWidget {
  final int? bottomNu;
  final Function? callBack;
  const BottomBar({Key? key, this.bottomNu, this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    final btns = [Icons.home, Icons.search, null, Icons.podcasts, Icons.person];

    //
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: dark100,
      child: SizedBox(
        width: SizeOfConfig.widthScreen,
        height: getHeight(70),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => GestureDetector(
            child: Container(
              width: (SizeOfConfig.widthScreen - 40) / 5,
              padding: EdgeInsets.symmetric(vertical: 0),
              // decoration: bottomNu == index
              //     ? const BoxDecoration(
              //         border: Border(
              //           top: BorderSide(
              //             width: 3,
              //             color: blue,
              //             style:BorderStyle.none,
              //           ),
              //         ),
              //       )
              //     : null,
              child: IconButton(
                icon: bottom_app_bar_item(
                    onPressed: () => callBack!(index),
                    icon: btns[index],
                    color: bottomNu == index ? blue : white),
                iconSize: 30,
                color: bottomNu == index ? blue : white,
                onPressed: () => callBack!(index),
              ),
            ),
            onTap: () {},
          ),
          separatorBuilder: (_, index) => const SizedBox(
            width: 10,
          ),
          itemCount: btns.length,
        ),
      ),
    );
  }
}
