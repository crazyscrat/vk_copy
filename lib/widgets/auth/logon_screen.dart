import 'package:flutter/material.dart';
import 'package:vk_m/data/vk_user_info.dart';
import 'package:vk_m/settings/colors.dart';
import 'package:vk_m/settings/fonts.dart';

class LogonScreen extends StatelessWidget {
  final VkUserInfo user;
  const LogonScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: VkColors.mainBGColor,
      appBar: AppBar(
        backgroundColor: VkColors.mainBGColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Image(
                image: AssetImage('assets/icons/vk.png'),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'ID',
              style: VkFonts.fontWhiteNormal_24,
            ),
          ],
        ),
      ),
      body: Container(
        color: VkColors.mainBGColor,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 80,
            ),
            //LOGO
            SizedBox(
              width: 70,
              height: 70,
              child: Image(image: AssetImage('assets/icons/vk.png')),
            ),
            SizedBox(
              height: 80,
            ),
            _UserInfoWidget(user: user),
            SizedBox(
              height: 24,
            ),
            _ActionButtonsWidget(),
            Expanded(child: SizedBox(),),
            _EnterOtherWidget(),
            SizedBox(
              height: 14,
            ),
            _RegistrationWidget(),
            SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }
}

class _UserInfoWidget extends StatelessWidget {
  final VkUserInfo user;
  const _UserInfoWidget({
    super.key, required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: Image(image: AssetImage(user.userAvatarLink),),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '9',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Имя',
            style: VkFonts.fontBlackW400_18,
          )
        ],
      ),
    );
  }
}

class _ActionButtonsWidget extends StatelessWidget {
  const _ActionButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FilledButton(
          onPressed: _logon,
          child: Text('Продолжить', style: VkFonts.fontBlackW400_18,),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(VkColors.whiteFont),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            fixedSize: MaterialStateProperty.all(Size(160, 50)),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        FilledButton(
          onPressed: _settings,
          child: Icon(Icons.settings, color: VkColors.greyLightBGColor, size: 28,),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(VkColors.mainLightBGColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            fixedSize: MaterialStateProperty.all(Size(50, 50)),
            maximumSize: MaterialStateProperty.all(Size(50, 50)),
            minimumSize: MaterialStateProperty.all(Size(50, 50)),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
        ),
      ],
    );
  }

  void _logon() {
    //logon
  }

  void _settings() {
    //settings
  }
}

class _EnterOtherWidget extends StatelessWidget {
  const _EnterOtherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: _enterOtherAccount, child: Text('Войти в другой аккаунт', style: VkFonts.fontWhiteW600_14,));
  }

  void _enterOtherAccount () {
    //select other
  }
}

class _RegistrationWidget extends StatelessWidget {
  const _RegistrationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: _registration, child: Text('Зарегистрироваться', style: VkFonts.fontWhiteW600_14,));
  }

  void _registration() {
    //registration
  }
}
