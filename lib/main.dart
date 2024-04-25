import 'package:flutter/material.dart';
import 'package:vk_m/data/tests.dart';
import 'package:vk_m/data/vk_user_info.dart';
import 'package:vk_m/settings/colors.dart';
import 'package:vk_m/settings/sizes.dart';
import 'package:vk_m/widgets/account/acc_settings_screen.dart';
import 'package:vk_m/widgets/auth/auth_screen.dart';
import 'package:vk_m/widgets/auth/logon_screen.dart';
import 'package:vk_m/widgets/auth/registration_screen.dart';
import 'package:vk_m/widgets/main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VK Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: VkColors.mainBGColor,
          actionsIconTheme: IconThemeData(
            color: Colors.white,
            size: VkSizes.actionIconSize,
          )
        ),
        //primarySwatch: VkColors.blueFont,
        colorScheme: ColorScheme.dark(
          background: VkColors.mainBGColor,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: VkColors.mainLight2BGColor,
          selectedItemColor: VkColors.bottomIconsSelect,
          unselectedItemColor: VkColors.bottomIconsUnselect,
        )
      ),
      initialRoute: '/auth_screen',
      routes: {
        '/auth_screen': (context) => const AuthScreen(),
        '/main_screen': (context) => const MainScreen(),
        '/reg_screen': (context) => const RegistrationScreen(),
        '/logon_screen': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if(arguments is VkUserInfo) {
            return LogonScreen(user: arguments);
          }
          return LogonScreen(user: TestData.thisUser);//for test
        },
        '/account_settings_screen': (context) => const AccountSettingsScreen(),
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (context) {
      //     return Scaffold(body: Center(child: Text('ОШИБКА НАВИГАЦИИ')));
      //   },);
      // },
    );
  }
}
