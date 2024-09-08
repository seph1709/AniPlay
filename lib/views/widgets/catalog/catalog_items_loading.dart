import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingItems extends StatelessWidget {
  const LoadingItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 16, 16, 16),
      highlightColor: const Color.fromARGB(255, 60, 60, 60),
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 95, horizontal: 13).h,
        itemCount: 15,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 0,
            childAspectRatio: (3 / 5),
            crossAxisCount: 3),
        itemBuilder: (context, index) {
          // var movieData = c.  var homeScreenData[index].entries.first;
          return IntrinsicWidth(
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AspectRatio(
                        aspectRatio: 3 / 4,
                        child: Container(
                          color: Colors.white,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 2, left: 2),
                    child: Text(
                      "",
                      style: TextStyle(
                          fontSize: 11.5.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Quicksand"),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
