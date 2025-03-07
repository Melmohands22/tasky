import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky/features/auth/presentation/manager/cubits/register_cubit/register_cubit.dart';
import 'package:tasky/features/auth/presentation/views/login_view.dart';
import 'package:tasky/features/auth/presentation/views/sign_up_view.dart';
import 'package:tasky/features/home/presentation/views/home_view.dart';
import 'package:tasky/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => RegisterCubit(),
          child: MaterialApp(
            routes: {
              HomeView.id: (context) => const HomeView(),
              LoginView.id: (context) => const LoginView(),
              SignUpView.id: (context) => const SignUpView(),
            },
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: GoogleFonts.dmSansTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            home: const SplashView(),
          ),
        );
      },
    );
  }
}
