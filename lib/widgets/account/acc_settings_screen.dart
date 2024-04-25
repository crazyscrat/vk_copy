import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vk_m/settings/fonts.dart';
import 'package:vk_m/settings/vk_icons.dart';
import '../../data/tests.dart';
import '../../settings/colors.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  final _user = TestData.thisUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: VkColors.mainBGColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Настройки',
            style: VkFonts.fontWhiteNormal_24,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24),
            color: VkColors.mainBGColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    color: VkColors.mainLight2BGColor,
                  ),
                  child: InkWell(
                    onTap: _logon,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Image(image: AssetImage(_user.userAvatarLink),),
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_user.userName} ${_user.userSurname}',
                              style: VkFonts.fontWhiteNormal_18,
                            ),
                            Text(
                              '${_user.userPhone}',
                              style: VkFonts.fontGreyW400_16,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Аккаунт VK ID',
                              style: VkFonts.fontBlueW400_20,
                            )
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.chevron_right,
                              size: 28,
                            ))
                      ],
                    ),
                  ),
                ),
                _menuItemWidget(
                    icon: Icons.notifications_none_outlined,
                    text: 'Уведомления',
                    callback: _selectNotifications),
                _menuItemWidget(
                    icon: Icons.not_interested,
                    text: 'Не беспокоить',
                    callback: null),
                Container(
                    margin: EdgeInsets.only(top: 8),
                    height: 1,
                    color: VkColors.mainLightBGColor),
                _menuItemWidget(
                    icon: Icons.manage_accounts,
                    text: 'Аккаунт',
                    callback: null),
                _menuItemWidget(
                    icon: Icons.color_lens_outlined,
                    text: 'Внешний вид',
                    callback: null),
                _menuItemWidget(
                    icon: Icons.settings, text: 'Приложение', callback: null),
                _menuItemWidget(
                    icon: Icons.front_hand_outlined,
                    text: 'Приватность',
                    callback: null),
                _menuItemWidget(
                    icon: Icons.people_alt_outlined,
                    text: 'Чёрный список',
                    callback: null),
                _menuItemWidget(
                    icon: Icons.phone_locked_outlined,
                    text: 'Определитель номера',
                    callback: null),
                Container(
                    margin: EdgeInsets.only(top: 8),
                    height: 1,
                    color: VkColors.mainLightBGColor),
                _menuItemWidget(
                    icon: Icons.stacked_line_chart,
                    text: 'Баланс',
                    callback: null),
                _menuItemWidget(
                    icon: Icons.monetization_on_outlined,
                    text: 'Подписки',
                    callback: null),
                _menuItemWidget(
                    icon: Icons.account_balance_wallet_outlined,
                    text: 'Денежные переводы',
                    callback: null),
                Container(height: 1, color: VkColors.mainLightBGColor),
                _menuItemWidget(
                    icon: Icons.info_outline,
                    text: 'О приложении',
                    callback: null),
                _menuItemWidget(
                    icon: Icons.help_outline, text: 'Помощь', callback: null),
                _menuItemWidget(
                    icon: VkIcons.vk_logo_outline,
                    text: '${_user.userName}, хочешь в команду VK?',
                    callback: null),
                Container(
                    margin: EdgeInsets.only(top: 8),
                    height: 1,
                    color: VkColors.mainLightBGColor),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Добавить аккаунт',
                        style: VkFonts.fontBlueW400_18,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: VkColors.blueLight,
                        ),
                        child: Text(
                          'New',
                          style: VkFonts.fontWhiteNormal_16,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16, bottom: 48),
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: null,
                    child: Text(
                      'Выйти',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontFamily: 'Roboto',
                          fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _selectNotifications() {
    print('_selectNotifications');
  }

  void _logon() {
    Navigator.of(context).pushNamed('/logon_screen', arguments: _user);
  }
}

class _menuItemWidget extends StatelessWidget {
  final icon;
  final text;
  final callback;

  const _menuItemWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(LinearBorder.none),
          overlayColor: MaterialStateProperty.all(VkColors.blueLightAlpha)),
      onPressed: this.callback,
      child: Row(
        children: [
          Icon(
            this.icon,
            color: VkColors.blueLight,
            size: 24,
          ),
          SizedBox(width: 16),
          Text(text, style: VkFonts.fontWhiteNormal_18),
        ],
      ),
    );
  }
}
