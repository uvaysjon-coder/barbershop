import 'package:barbershop/core/themes/app_theme.dart';
import 'package:barbershop/features/auth/forgot/presentation/bloc/forgot_bloc.dart';
import 'package:barbershop/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:barbershop/features/auth/otp/presentation/bloc/otp_bloc.dart';
import 'package:barbershop/features/auth/register/presentation/bloc/register_bloc.dart';
import 'package:barbershop/features/bookings/presentations/bloc/booking_bloc.dart';
import 'package:barbershop/features/dashboard/presentations/bloc/dashboard_cubit.dart';
import 'package:barbershop/features/home/presentations/bloc/home_bloc.dart';
import 'package:barbershop/features/main/detail_barber/presentations/bloc/detail_barber_bloc.dart';
import 'package:barbershop/features/onboarding/presentations/bloc/onboarding_cubit.dart';
import 'package:barbershop/features/profile/presentations/bloc/profile_bloc.dart';
import 'package:barbershop/features/splash/presentation/bloc/splash_cubit.dart';
import 'package:barbershop/features/splash/presentation/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashCubit()),
        BlocProvider(create: (_) => OnboardingCubit()),
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => RegisterBloc()),
        BlocProvider(create: (_) => ForgotBloc()),
        BlocProvider(create: (_) => OtpBloc()),
        BlocProvider(create: (_) => DashboardCubit()),
        BlocProvider(create: (_) => HomeBloc()),
        BlocProvider(create: (_) => DetailBarberBloc()),
        BlocProvider(create: (_) => ProfileBloc()),
        BlocProvider(create: (_) => BookingBloc()..add(GetAllBookingEvent()) ),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        theme: lightThemeData,
        darkTheme: lightThemeData,
        home: const SplashPage(),
      ),
    );
  }
}
