import 'package:barbershop/features/main/booking_appointment/presentation/widgets/select_service_item_small.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../detail_barber/presentations/bloc/detail_barber_bloc.dart';

class SelectService extends StatelessWidget {
  const SelectService({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBarberBloc, DetailBarberState>(
      builder: (context, state) {
        //pPrint("servise ${state.detailBarber?.haircutStyles?.length }");
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(state.detailBarber?.haircutStyles?.length ??0, (index) {
                final haircutStyle = state.detailBarber?.haircutStyles?[index];
                return SelectServiceItemSmall(
                  img: haircutStyle?.serviceImageUrl ?? "",
                  title: haircutStyle?.name ?? "",
                  isSelected: state.selectedTimeSlots.where((e) => e == haircutStyle).isNotEmpty,
                  price: haircutStyle?.price.toString() ?? "",
                  onTap: (value) {

                      context.read<DetailBarberBloc>().add(
                        SelectTimeSlots(haircutStyle),
                      );

                    /*context.read<DetailBarberBloc>().add(
                      SelectTimeSlots( index),
                    );*/

                  },
                );
              })
            ]
          ),
        );
      },
    );
  }
}

class SelectServiceModel {
  final String img;
  final String title;
  final String price;
  final bool isSelected;

  SelectServiceModel({
    required this.img,
    required this.title,
    required this.price,
    required this.isSelected,
  });
}

List<SelectServiceModel> _list = [
  SelectServiceModel(
      img: 'https://picsum.photos/400/320',
      title: 'Haircut',
      isSelected: false,
      price: "25"
  ),
  SelectServiceModel(
      img: 'https://picsum.photos/400/321',
      title: 'Hair Coloring',
      isSelected: false,
      price: "15"
  ),
  SelectServiceModel(
      img: 'https://picsum.photos/400/322',
      title: 'Shaving',
      isSelected: false,
      price: "14"
  ),
  SelectServiceModel(
      img: 'https://picsum.photos/400/323',
      title: 'Facial',
      isSelected: false,
      price: "25"
  ),
  SelectServiceModel(
      img: 'https://picsum.photos/400/324',
      title: 'Manicure',
      isSelected: false,
      price: "14"
  ),
  SelectServiceModel(
      img: 'https://picsum.photos/400/325',
      title: 'Pedicure',
      isSelected: false,
      price: "10"
  ),
  SelectServiceModel(
      img: 'https://picsum.photos/400/326',
      title: 'Massage',
      isSelected: false,
      price: "10"
  ),
  SelectServiceModel(
      img: 'https://picsum.photos/400/327',
      title: 'Hair Treatment',
      isSelected: false,
      price: '12'
  ),
];
