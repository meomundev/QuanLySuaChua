import 'package:app_maintain/other/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainAppWhite,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: mainAppWhite,
        title: Text(
          'Home',
          style: TextStyle(
              color: blueDark, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         const SizedBox(
      //           height: 24,
      //         ),
      //         _buildLikedTracks(),
      //         const SizedBox(
      //           height: 8,
      //         ),
      //         _buildPlaylists(),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget _buildLikedTracks() {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: transparentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [
            Text(
              'Liked tracks',
              style: TextStyle(fontSize: 18, color: greyLightColor),
            ),
            // const Spacer(),
            // Image.asset(
            //   'assets/icons/arrowRight.png',
            //   height: 20,
            //   width: 20,
            //   fit: BoxFit.contain,
            //   color: greyLightColor,
            // )
          ],
        ),
      ),
    );
  }

  Widget _buildPlaylists() {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: transparentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [
            Text(
              'Playlists',
              style: TextStyle(fontSize: 18, color: greyLightColor),
            ),
            const Spacer(),
            // Image.asset(
            //   'assets/images/icons/arrowRight.png',
            //   height: 20,
            //   width: 20,
            //   fit: BoxFit.contain,
            //   color: greyLightColor,
            // )
          ],
        ),
      ),
    );
  }
}
