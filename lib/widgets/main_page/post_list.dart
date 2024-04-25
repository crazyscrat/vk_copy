import 'package:flutter/material.dart';
import 'package:vk_m/data/tests.dart';
import 'package:vk_m/data/vk_post.dart';
import 'package:vk_m/settings/vk_icons.dart';

import '../../settings/colors.dart';

class PostListWidget extends StatefulWidget {
  ScrollController controller;

  PostListWidget({super.key, required this.controller});

  @override
  State<PostListWidget> createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  final List<VkPost> posts = TestData.posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.controller,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return _VkPostWidget(postData: posts[index]);
      },
    );
  }
}

class _VkPostWidget extends StatefulWidget {
  final postData;

  const _VkPostWidget({
    super.key,
    required this.postData,
  });

  @override
  State<_VkPostWidget> createState() => _VkPostWidgetState();
}

class _VkPostWidgetState extends State<_VkPostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12),
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: VkColors.mainLight2BGColor,
      ),
      // height: 200,
      child: Column(
        children: [
          //head
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(36)),
                  width: 36,
                  height: 36,
                  child: Image(
                    //image: AssetImage('assets/images/avatar.png'),
                    image: AssetImage(widget.postData?.userInfo?.userAvatarLink),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //status
                    Row(
                      children: [
                        Text(
                            '${widget.postData?.userInfo?.userName} ${widget.postData?.userInfo?.userSurname}'),
                        SizedBox(
                          width: 4,
                        ),
                        SizedBox(width: 16, height: 16, child: Placeholder())
                      ],
                    ),
                    //post time
                    Text(widget.postData?.postDate)
                  ],
                ),
                Expanded(child: SizedBox()),
                IconButton(
                  onPressed: () {},
                  icon: Icon(VkIcons.three_dots_vertical),
                )
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          //message
          Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.topLeft,
              child: Text(
                //lorem(paragraphs: 1, words: 120),
                widget.postData?.postText,
                textAlign: TextAlign.left,
                maxLines: 5,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(),
              )),
          //image
          Container(
            height: 200,
            padding: EdgeInsets.only(top: 12),
            child: Placeholder(),
          ),
          //post row
          Container(
            margin: EdgeInsets.only(bottom: 8),
            padding: EdgeInsets.only(left: 12, right: 12, top: 12),
            child: Row(
              children: [
                //like
                SizedBox(
                  height: 32,
                  child: FilledButton(
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 242, 243, 245)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                    ),
                    onPressed: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      margin: EdgeInsets.zero,
                      child: Row(
                        children: [
                          Icon(
                            Icons.heart_broken_outlined,
                            size: 24,
                            color: Color.fromARGB(255, 129, 140, 153),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            widget.postData?.postLikes,
                            style: TextStyle(
                                color: Color.fromARGB(255, 129, 140, 153),
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                //comments
                SizedBox(
                  height: 32,
                  child: FilledButton(
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 242, 243, 245)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                    ),
                    onPressed: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      child: Row(
                        children: [
                          Icon(
                            Icons.messenger_outline,
                            size: 24,
                            color: Color.fromARGB(255, 129, 140, 153),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            widget.postData?.postMessages,
                            style: TextStyle(
                                color: Color.fromARGB(255, 129, 140, 153),
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                //shrink
                SizedBox(
                  height: 32,
                  width: 44,
                  child: FilledButton(
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 242, 243, 245)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                    ),
                    onPressed: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Icon(
                        Icons.send_to_mobile_outlined,
                        size: 24,
                        color: Color.fromARGB(255, 129, 140, 153),
                      ),
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
                //viewers
                Container(
                  height: 32,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        size: 24,
                        color: Color.fromARGB(255, 129, 140, 153),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.postData?.postView,
                        style: TextStyle(
                            color: Color.fromARGB(255, 129, 140, 153),
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
