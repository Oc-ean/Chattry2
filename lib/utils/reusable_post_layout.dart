import 'package:chattry_app/models/user_model.dart';
import 'package:chattry_app/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(
      context,
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black,
                child: Container(
                  height: 45,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.only(top: 9, left: 2),
                height: 45,
                width: 260,
                color: Colors.grey,
                child: Text(
                  userProvider.getUser!.userName,
                  style: const TextStyle(fontSize: 18, fontFamily: 'NotoSans'),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.more_vert,
                  size: 33,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 270,
          width: 375,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black, width: 3),
            color: Colors.purple,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 13),
              height: 25,
              width: 110,
              color: Colors.grey,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(CupertinoIcons.heart),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(CupertinoIcons.arrow_2_squarepath),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(CupertinoIcons.paperplane),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(CupertinoIcons.bookmark),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
              margin: const EdgeInsets.only(left: 15.0),
              width: 100,
              height: 20,
              color: Colors.indigo,
              child: const Center(child: Text('4222.88k likes'))),
        ),
        Row(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 15.0),
                width: 100,
                height: 25,
                color: Colors.indigo,
                child: const Center(
                  child: Text(
                    'Ocean',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
