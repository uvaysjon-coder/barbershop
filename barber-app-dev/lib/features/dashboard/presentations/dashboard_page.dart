import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/features/home/presentations/home_page.dart';
import 'package:barbershop/features/profile/presentations/profile_page.dart';
import 'package:barbershop/features/saved/presentations/saved_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bookings/presentations/booking_page.dart';
import 'bloc/dashboard_cubit.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return IndexedStack(

              index:state.currentIndex,
              children: const [
                HomePage(),
                BookingPage(),
                ChatPage(),
                ProfilePage(),

              ],
            );
          },
        ),
        bottomNavigationBar: SafeArea(
          child: BottomNavigationBar(
            showSelectedLabels: true,

            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            currentIndex: context.select((DashboardCubit cubit) => cubit.state.currentIndex),
            onTap: (index) {
              context.read<DashboardCubit>().changeIndex(index);
            },
            items:  [
              BottomNavigationBarItem(
                icon: Assets.icon.home.svg(
                  colorFilter: ColorFilter.mode(
                      context.color.blueGray400, BlendMode.srcIn),
                ),
                label: 'Home',
                activeIcon: Assets.icon.home.svg(
                  colorFilter: ColorFilter.mode(
                      context.color.primary, BlendMode.srcIn),
                ),
              ),
              BottomNavigationBarItem(
                icon: Assets.icon.calendarNavigation.svg(
                  colorFilter: ColorFilter.mode(
                      context.color.blueGray400, BlendMode.srcIn),
                ),
                activeIcon: Assets.icon.calendarNavigation.svg(
                  colorFilter: ColorFilter.mode(
                      context.color.primary, BlendMode.srcIn),
                ),
                label: 'Booking',
              ),BottomNavigationBarItem(
                icon: Assets.icon.chat.svg(
                  colorFilter: ColorFilter.mode(
                      context.color.blueGray400, BlendMode.srcIn),
                ),
                activeIcon: Assets.icon.chat.svg(
                  colorFilter: ColorFilter.mode(
                      context.color.primary, BlendMode.srcIn),
                ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Assets.icon.user.svg(
                  colorFilter: ColorFilter.mode(
                      context.color.blueGray400, BlendMode.srcIn),
                ),
                activeIcon: Assets.icon.user.svg(
                  colorFilter: ColorFilter.mode(
                      context.color.primary, BlendMode.srcIn),
                ),

                label: 'Profile',
              ),

            ],
          ),
        )
    );
  }
}
