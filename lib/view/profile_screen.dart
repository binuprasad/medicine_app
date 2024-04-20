import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: CurveClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                color: Colors.black,
                child:  Center(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                      const CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/profile_image.jpg'),
                        ),
                      ),
                      const Text(
                        'Rebecca Max',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const Text(
                        'rebeccairfad@gmail.com',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ShadowContainer(
                  title: 'Personal Details',
                  subtitle: Row(
                    children: [
                      Icon(Icons.verified_user, color: Colors.black),
                      SizedBox(width: 8),
                      Text(
                        'Verified',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  trailingIcon: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Center(
                        child: Text('100'),
                      ),
                    ),
                  ),
                ),
                ShadowContainer(
                  title: 'My Shop',
                  subtitle: const Text(
                    'Verification under process',
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailingIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/timer.png'),
                  ),
                ),
                const ShadowContainer(title: 'Settings'),
                const ShadowContainer(title: 'Aboutus'),
                const ShadowContainer(title: 'Help')
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Version - 6.9',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({
    super.key,
    required this.title,
    this.subtitle,
    this.trailingIcon,
  });
  final String title;
  final Widget? subtitle;
  final Widget? trailingIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: subtitle,
          trailing: trailingIcon,
        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
