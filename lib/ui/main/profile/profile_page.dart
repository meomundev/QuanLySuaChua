import 'package:app_maintain/other/color.dart';
import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainAppGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildFormAvatar(),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildFormInfomation(),
                  _buildFormEdit(),
                  _buildFormHelp(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ///
  Widget _buildFormAvatar() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [blueDark, mainAppGrey]),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          _buildAvatar(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: mainAppWhite,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  "assets/debug/debug.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFormInfomation() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: mainAppWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _buildUserName(),
          _buildGmail(),
        ],
      ),
    );
  }

  Widget _buildUserName() {
    return Text(
      'Mèo Mèo',
      style: TextStyle(
        color: mainAppBlack,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildGmail() {
    return Text(
      'meomeo1231@gmail.com',
      style: TextStyle(
        color: greyColorForText,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  ///
  Widget _buildFormEdit() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        Text(
          'Cài đặt',
          style: TextStyle(
            color: blueDark,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
          width: double.infinity,
          decoration: BoxDecoration(
              color: mainAppWhite, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserProfileSettings(),
              _buildAccountManagement(),
              _buildNotificationSettings(),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildUserProfileSettings() {
    return SizedBox(
      height: 40,
      child: OutlinedButton(
        onPressed: () {},
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return blueDarkO5;
                }
                return mainAppWhite;
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                return mainAppWhite;
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                side: BorderSide.none,
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
            surfaceTintColor:
                MaterialStateColor.resolveWith((states) => mainAppWhite)),
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: orangeLight,
              size: 24,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Cài đặt thông tin',
              style: TextStyle(fontSize: 16, color: mainAppBlack),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24,
              color: orangeLight,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAccountManagement() {
    return OutlinedButton(
      onPressed: () {},
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return blueDarkO5;
              }
              return mainAppWhite;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return mainAppWhite;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              side: BorderSide.none,
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
          surfaceTintColor:
              MaterialStateColor.resolveWith((states) => mainAppWhite)),
      child: Row(
        children: [
          Icon(
            Typicons.business_card,
            color: orangeLight,
            size: 24,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'Quản lý tài khoản/thẻ',
            style: TextStyle(fontSize: 16, color: mainAppBlack),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 24,
            color: orangeLight,
          )
        ],
      ),
    );
  }

  Widget _buildNotificationSettings() {
    return OutlinedButton(
      onPressed: () {},
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return blueDarkO5;
              }
              return mainAppWhite;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return mainAppWhite;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              side: BorderSide.none,
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
          surfaceTintColor:
              MaterialStateColor.resolveWith((states) => mainAppWhite)),
      child: Row(
        children: [
          Icon(
            Icons.notifications,
            color: orangeLight,
            size: 24,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'Cài đặt thông báo',
            style: TextStyle(fontSize: 16, color: mainAppBlack),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 24,
            color: orangeLight,
          )
        ],
      ),
    );
  }

  Widget _buildFormHelp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        Text(
          'Trợ Giúp',
          style: TextStyle(
            color: blueDark,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
          width: double.infinity,
          decoration: BoxDecoration(
              color: mainAppWhite, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHelpCenter(),
              _buildApplicationInformation(),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildHelpCenter() {
    return SizedBox(
      height: 40,
      child: OutlinedButton(
        onPressed: () {},
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return blueDarkO5;
                }
                return mainAppWhite;
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                return mainAppWhite;
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                side: BorderSide.none,
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
            surfaceTintColor:
                MaterialStateColor.resolveWith((states) => mainAppWhite)),
        child: Row(
          children: [
            Icon(
              Icons.help_outline_outlined,
              color: orangeLight,
              size: 24,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Trung tâm trợ giúp',
              style: TextStyle(fontSize: 16, color: mainAppBlack),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24,
              color: orangeLight,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildApplicationInformation() {
    return SizedBox(
      height: 40,
      child: OutlinedButton(
        onPressed: () {},
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return blueDarkO5;
                }
                return mainAppWhite;
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                return mainAppWhite;
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                side: BorderSide.none,
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
            surfaceTintColor:
                MaterialStateColor.resolveWith((states) => mainAppWhite)),
        child: Row(
          children: [
            Icon(
              Icons.app_shortcut,
              color: orangeLight,
              size: 24,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Thông tin ứng dụng',
              style: TextStyle(fontSize: 16, color: mainAppBlack),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24,
              color: orangeLight,
            )
          ],
        ),
      ),
    );
  }
}
