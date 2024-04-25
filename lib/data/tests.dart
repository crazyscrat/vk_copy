import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:vk_m/data/vk_post.dart';
import 'package:vk_m/data/vk_user_info.dart';

class TestData {
  static final List<VkPost> posts = [
    new VkPost(
        users[0],
        'вчера 1',
        lorem(paragraphs: 1, words: 50),
        'postImageLink',
        '12',
        '2',
        '160'),
    new VkPost(
        users[1],
        'вчера 2',
        lorem(paragraphs: 1, words: 40),
        'postImageLink',
        '22',
        '12',
        '60'),
    new VkPost(
        users[2],
        'вчера 3',
        lorem(paragraphs: 1, words: 100),
        'postImageLink',
        '112',
        '24',
        '1680'),
    new VkPost(
        users[3],
        'вчера 4',
        lorem(paragraphs: 1, words: 5),
        'postImageLink',
        '12',
        '34',
        '80'),
  ];

  static VkUserInfo thisUser = VkUserInfo('Name', "Surname", 'assets/images/avatar.png', '+79991234567', '@mail');

  static final List<VkUserInfo> users = [
        new VkUserInfo('User1', 'Surname1', 'assets/images/avatar.png', '', ''),
        new VkUserInfo('User2', 'Surname2', 'assets/images/avatar.png', '', ''),
        new VkUserInfo('User3', 'Surname3', 'assets/images/avatar.png', '', ''),
        new VkUserInfo('User4', 'Surname4', 'assets/images/avatar.png', '', ''),
  ];
}