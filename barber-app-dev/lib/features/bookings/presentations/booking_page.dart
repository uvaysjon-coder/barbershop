import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/core/widgets/custum_toast.dart';
import 'package:barbershop/features/bookings/presentations/bloc/booking_bloc.dart';
import 'package:barbershop/features/bookings/presentations/pages/active_booking_page.dart';
import 'package:barbershop/features/bookings/presentations/pages/history_booking_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/booking_tab_bar.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(
            () {
          if (_tabController.indexIsChanging) {
            context.read<BookingBloc>().add(
                BookingChangeTabIndex(_tabController.index));
          }
        },
      );
    super.initState();
  }

  @override
  dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingBloc, BookingState>(
      listenWhen: (previous, current) {
        return previous.currentIndex != current.currentIndex;
      },
      listener: (context, state) {
        _tabController.animateTo(state.currentIndex);


        // TODO: implement listener
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: context.color.primary,
            actions: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.icon.appIcon.svg(
                    width: 36,
                    height: 36,
                    fit: BoxFit.scaleDown,
                  ),
                  8.gap,
                  Text(
                    "GoBar",
                    style: context.text.titleMedium?.copyWith(
                      color: context.color.white,
                    ),
                  ),
                  16.gap,
                ],
              ),
            ],
            title: Text(
              'Booking',
              style: context.text.titleMedium?.copyWith(
                color: context.color.white,
              ),
            )),
        body: BlocListener<BookingBloc, BookingState>(
          listener: (context, state) {

            if(state.errorMessage != null){

              context.toast.error(state.errorMessage!);

             /* ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                  duration: const Duration(seconds:4 ),
                ),
              );*/
            }

            if(state.successMessage != null){
              context.toast.success(state.successMessage!);
             /* ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.successMessage!),
                  duration: const Duration(seconds:4 ),
                ),
              );*/
            }


            // TODO: implement listener
          },
          child: Column(
            children: [
              BookingTabBar(
                tabController: _tabController,
              ),

              Expanded(
                child: TabBarView(controller: _tabController, children: const [

                  ActiveBookingPage(),
                  HistoryBookingPage(),

                ],),
              )

              /*ActiveBooking(barber: BookingEntities(

          ),
            onTap: (_) {

            },
          ),*/

            ],
          ),
        ),
      ),
    );
  }
}
