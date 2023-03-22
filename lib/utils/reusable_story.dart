import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      // closedColor: const Color(0xFF101D25),
      openColor: const Color(0xFF101D25),
      // middleColor: const Color(0xFF101D25),
      closedElevation: 0.0,
      closedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (context, openWidget) {
        return const Center();
      },
      closedBuilder: (context, closeWidget) {
        return Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  radius: 38,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 33,
                    backgroundColor: Colors.white,
                    child: Container(
                      height: 63,
                      width: 63,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 65,
                child: const Text(
                  'in2odo2',
                  style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        );
      },
    );
    // return Column(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.only(left: 10),
    //       child: CircleAvatar(
    //         radius: 35,
    //         backgroundColor: Colors.black,
    //         child: CircleAvatar(
    //           radius: 33,
    //           backgroundColor: Colors.white,
    //           child: Container(
    //             height: 63,
    //             width: 63,
    //             decoration: const BoxDecoration(
    //               shape: BoxShape.circle,
    //               color: Colors.purple,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //     Container(
    //         width: 65,
    //         child: const Text(
    //           'in2odo2',
    //           style: TextStyle(
    //               fontFamily: 'NotoSans',
    //               fontWeight: FontWeight.w500,
    //               fontSize: 16),
    //           overflow: TextOverflow.ellipsis,
    //         ))
    //   ],
    // );
  }
}
