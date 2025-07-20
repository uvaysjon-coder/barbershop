import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/features/bookings/presentations/bloc/booking_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BookingTabBar extends StatelessWidget {
  final TabController tabController;
  const BookingTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingBloc, BookingState>(

      listenWhen: (previous, current) => previous.currentIndex != current.currentIndex,

        listener: (context,state){
    },

        child:  Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF1FB), // Light blue/gray background
            borderRadius: BorderRadius.circular(30),
          ),
          child: TabBar(
            padding: const EdgeInsets.all(4),
            labelPadding: const EdgeInsets.all(0),

            dividerColor: Colors.transparent,

            controller: tabController,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            splashFactory: NoSplash.splashFactory,
            tabs: [
              Tab(
                child: Center(
                  child: Text(
                    "Active booking",
                    style: context.textTheme.bodyMedium?.copyWith(),
                  ),
                ),
              ),
              Tab(
                child: Center(
                  child: Text(
                    "History",
                    style: context.textTheme.bodyMedium?.copyWith(),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
