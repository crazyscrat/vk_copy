import 'package:vk_m/data/vk_user_info.dart';

class VkPost{
  final VkUserInfo userInfo;
  final String postDate;
  final String postText;
  final String postImageLink;
  final String postLikes;
  final String postMessages;
  final String postView;

  VkPost(this.userInfo, this.postDate, this.postText, this.postImageLink, this.postLikes, this.postMessages, this.postView);
}