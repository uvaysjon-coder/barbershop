
import 'package:barbershop/core/themes/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentations/bloc/home_bloc.dart';
import '../../../home/presentations/widgets/barber_top.dart';
import '../../../home/presentations/widgets/search_bar.dart';
import 'widgets/barbers_list.dart';

class ExploreBarberPage extends StatefulWidget {
  const ExploreBarberPage({super.key});

  @override
  State<ExploreBarberPage> createState() => _ExploreBarberPageState();
}

class _ExploreBarberPageState extends State<ExploreBarberPage> {
  ScrollController? _scrollController;


  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController?.addListener(() {
      if (_scrollController!.offset >=
          _scrollController!.position.maxScrollExtent) {
        context.read<HomeBloc>().add(PaginationBarbers());
      }
    });// TODO: implement initState
    super.initState();
  }

  @override
  dispose() {
    _scrollController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: (){
            return Future.delayed(const Duration(seconds: 1), () {
              context.mounted ? context.read<HomeBloc>().add(RefreshBarbers()) : null;
            });
          },
          child: CustomScrollView(

            controller: _scrollController,
            slivers: [
              SliverAppBar(
                elevation: 0,
                forceMaterialTransparency: true,
                floating: false,
                snap: false,
                pinned: false,
                title:  Text("Explore Barbers",style: context.text.titleMedium,),

              ),
              const SliverToBoxAdapter(
                child: BarberTop(),
              ),
              const SliverToBoxAdapter(
                child: SearchBarApp(),
              ), /*SliverToBoxAdapter(
                child: ServiceBar(),
              ),*/
               const SliverToBoxAdapter(
                child: BarbersList(),
              ),
              /*SliverToBoxAdapter(
                child: CustomButton.primary(
                  backgroundColor:*//* context.color.green*//* Color(0xff27AE60),
                text: "Detail page", onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailBarberPage() ));
                }),
              ),*/

            ],
          ),
        ),
      )
    );
  }
}
