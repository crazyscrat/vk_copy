import 'package:flutter/material.dart';
import 'package:vk_m/widgets/main_screen/main_screen.dart';

import '../../settings/colors.dart';
import '../../settings/fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _textController = TextEditingController();
  final first_screen = true;

  @override
  void initState() {
    super.initState();
    _textController.text = '9999999';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: VkColors.mainBGColor,
      appBar: AppBar(
        backgroundColor: VkColors.mainBGColor,
        leading: first_screen ? null : IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: VkColors.mainBGColor,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 80),
            //LOGO
            SizedBox(
              width: 70,
              height: 70,
              child: Image(image: AssetImage('assets/icons/vk.png')),
            ),
            SizedBox(height: 30),
            Text(
              'Вход ВКонтакте',
              style: VkFonts.fontWhiteW600_24,
              textAlign: TextAlign.center,
            ),
            //_UserInfoWidget(),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 56,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: VkColors.mainLightBGColor,
                  border: Border.all(
                    width: 1,
                    color: Colors.blue,
                  )),
              child: TextField(
                controller: _textController,
                onChanged: (value) {
                  _checkPhone();
                },
                cursorColor: VkColors.whiteFont,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.number,
                //onSubmitted: (value){_auth();},
                decoration: InputDecoration(
                    hintText: 'Телефон или почта',
                    enabledBorder: InputBorder.none,
                    // contentPadding:
                    //     EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: VkColors.mainLightBGColor,
                    isCollapsed: true),
                style: TextStyle(
                    color: VkColors.whiteFont, fontSize: 20, height: 1.2),
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
            SizedBox(height: 20),
            FilledButton(
              onPressed: _textController.text.length > 4 ? _auth : null,
              child: Text(
                'Войти',
                style: VkFonts.fontBlackW400_18,
              ),
              style: ButtonStyle(
                backgroundColor: _textController.text.length > 4
                    ? MaterialStateProperty.all(VkColors.greyLightBGColor)
                    : MaterialStateProperty.all(VkColors.greyLight2BGColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                fixedSize: MaterialStateProperty.all(Size(160, 56)),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
            ),
            //_ActionButtonsWidget(),
            Expanded(child: SizedBox()),
            FilledButton(
              onPressed: _textController.text.length > 4 ? _registration : null,
              child: Text(
                'Регистрация',
                style: VkFonts.fontBlackW400_18,
              ),
              style: ButtonStyle(
                backgroundColor: _textController.text.length > 4
                    ? MaterialStateProperty.all(Colors.green)
                    : MaterialStateProperty.all(VkColors.greyLight2BGColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                fixedSize: MaterialStateProperty.all(Size(160, 56)),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _auth() {
    print('auth ${_textController.text}');

    //Navigator.of(context).pushNamed('/main_screen');
    Navigator.of(context).pushReplacementNamed('/main_screen');
  }

  void _registration() {
    print(_textController.text);
  }

  void _checkPhone() {
    setState(() {});
  }
}
