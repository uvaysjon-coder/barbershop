import 'package:barbershop/core/utils/print.dart';
import 'package:barbershop/features/home/presentations/widgets/banner_home.dart';
import 'package:barbershop/features/home/presentations/widgets/barber_location.dart';
import 'package:barbershop/features/home/presentations/widgets/barber_top.dart';
import 'package:barbershop/features/home/presentations/widgets/home_litsener.dart';
import 'package:barbershop/features/home/presentations/widgets/location_shops.dart';
import 'package:barbershop/features/home/presentations/widgets/search_bar.dart';
import 'package:barbershop/features/home/presentations/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/themes/index.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      pPrint("HomePageEntered $timeStamp") ;
      context.read<HomeBloc>().add(HomePageEntered());
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeListener(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: SafeArea(
                    child: Padding(
                  padding: AppSpacing.h12,
                  child: UserInfo(),
                )),
              ),

              pinned: true,
            ),
            SliverToBoxAdapter(
              child: BannerHome(),
            ),
            SliverToBoxAdapter(
              child: SearchBarApp(
                readOnly: true,
              ),
            ),

            SliverToBoxAdapter(
              child: BarberTop(),
            ),
            SliverToBoxAdapter(
              child: LocationShops(),
            ),
            SliverToBoxAdapter(
              child: BarberLocation(),
            ),

            /* SliverToBoxAdapter(child: TopStyle(),),
            SliverToBoxAdapter(child: Styles(),),

            SliverToBoxAdapter(
              child: TopBarber()
            )*/
          ],
        ),
      ),
    );
  }
}
