import 'package:dw_barbershop_app/src/features/splash/auth/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _scale = 10.0;
  var _animationOpacityLogo = 0.0;

  double get _logoAnimationWidh => 100 * _scale;
  double get _logoAnimationheight => 120 * _scale;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
        _scale = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_image_chair.jpg'),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            curve: Curves.ease,
            opacity: _animationOpacityLogo,
            onEnd: () {
              Navigator.of(context).pushAndRemoveUntil(
                  PageRouteBuilder(
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      settings: const RouteSettings(name: 'auth/login'),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const LoginPage();
                      }),
                  (route) => false);
            },
            child: AnimatedContainer(
              width: _logoAnimationWidh,
              height: _logoAnimationheight,
              curve: Curves.linearToEaseOut,
              duration: const Duration(seconds: 1),
              child: Image.asset(
                'assets/images/imgLogo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
