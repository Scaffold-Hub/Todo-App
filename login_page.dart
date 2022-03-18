import 'package:flutter/material.dart';
import 'package:todo_app/view/constant/strings.dart';
import 'package:todo_app/view/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = TextEditingController();
  final controller2 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: applicationColor,
      body: Padding(
        padding: const EdgeInsets.all(paddingCountMore),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LoginPageIconCircleAvatarBuild(),
            const SizedBox(height: 30.0),
            textFieldBuildFirst(),
            const SizedBox(height: 25.0),
            textFieldBuildSecond(),
            const SizedBox(height: 25.0),
            customButtonBuildWithContainer(context)
          ],
        ),
      ),
    );
  }

  Container customButtonBuildWithContainer(BuildContext context) {
    return Container(
      height: 45.0,
      width: 105.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(paddingCountLess),
        color: loginColor,
      ),
      child: Center(
        child: Row(
          children: [
            IconButton(
              icon: appBarIcon,
              color: loginColorDefault,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodoListTask(
                      userName: controller.text,
                      password: controller2.text,
                    ),
                  ),
                );
              },
              iconSize: iconSizeLess,
            ),
            const Text(
              loginButtonTitle,
              style: loginTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  TextField textFieldBuildSecond() {
    return TextField(
      controller: controller2,
      style: loginTextStyle,
      obscureText: true,
      maxLength: 8,
      decoration: InputDecoration(
        prefixIcon: appBarIcon2,
        border: const OutlineInputBorder(),
        labelText: textFieldLabelText2,
      ),
    );
  }

  TextField textFieldBuildFirst() {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      style: loginTextStyle,
      decoration: InputDecoration(
        prefixIcon: textFieldUserName,
        border: const OutlineInputBorder(),
        labelText: textFieldLabelText,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Center LoginPageIconCircleAvatarBuild() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: heightAndWidht,
            width: heightAndWidht,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: loginColor,
            ),
          ),
          const CircleAvatar(
            radius: heightAndWidhtLessOther,
            backgroundColor: Colors.orange,
            backgroundImage: AssetImage(imagePathFirst),
          ),
        ],
      ),
    );
  }
}
