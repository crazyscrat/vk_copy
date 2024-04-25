import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:vk_m/settings/fonts.dart';

import '../../settings/colors.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: VkColors.mainBGColor,
      appBar: AppBar(
        backgroundColor: VkColors.mainBGColor,
        title: const Row(
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
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto'),
            ),
          ],
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
            SizedBox(
              height: 30,
            ),
            Text(
              'Введите номер',
              style: VkFonts.fontWhiteW600_24,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Ваш номер телефона будет\n использоваться для входа в аккаунт',
              style: VkFonts.fontGreyW400_18,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 32,
            ),
            //PHONE NUMBER
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: VkColors.mainLightBGColor,
                  border: Border.all(
                    width: 1,
                    color: Colors.blue,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '+7',
                    style: TextStyle(color: VkColors.whiteFont, fontSize: 20),
                  ),
                  Container(
                    width: 2,
                    height: 32,
                    margin: EdgeInsets.only(left: 24, right: 16),
                    color: Colors.grey,
                  ),
                  Flexible(
                    child: TextField(
                      controller: _phoneController,
                      onChanged: (value) {
                        _checkPhone();
                      },
                      cursorColor: VkColors.whiteFont,
                      textAlign: TextAlign.left,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$'),
                        ),
                      ],
                      onSubmitted: (value) {
                        _auth();
                      },
                      decoration: InputDecoration(
                          hintText: 'Номер телефона',
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
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            FilledButton(
              onPressed: _phoneController.text.length == 10 ? _auth : null,
              child: Text(
                'Продолжить',
                style: VkFonts.fontBlackW400_18,
              ),
              style: ButtonStyle(
                backgroundColor: _phoneController.text.length == 10
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
            SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: VkFonts.fontGreyW400_14,
                children: [
                  TextSpan(
                    text: 'Нажимая "Продолжить", вы принимаете\n',
                  ),
                  TextSpan(
                    text: 'пользовательское соглашение',
                    style: VkFonts.fontWhiteNorm_14,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //link to 1
                      },
                  ),
                  TextSpan(
                    text: ' и ',
                  ),
                  TextSpan(
                      text: 'политику\n',
                      style: VkFonts.fontWhiteNorm_14,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //link to 2
                        }),
                  TextSpan(
                      text: 'конфеденциальности',
                      style: VkFonts.fontWhiteNorm_14,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //link to 2
                        }),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _checkPhone() {
    if (_phoneController.text.length > 10) {
      _phoneController.text = _phoneController.text.substring(0, 10);
    }
    setState(() {});
  }

  void _auth() {
    print(_phoneController.text);
  }
}
