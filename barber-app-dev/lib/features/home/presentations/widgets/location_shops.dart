import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/core/widgets/custom_button.dart';
import 'package:barbershop/core/widgets/small_barber_item.dart';
import 'package:barbershop/features/home/presentations/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/barber_entities.dart';
import '../../../../core/utils/print.dart';
import '../../../../core/widgets/all_shimmer.dart';

class LocationShops extends StatelessWidget {
  const LocationShops({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.h12,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {

          if(state.isLoading ){
            return const NearestBarberShopShimmer();
          }

          // if (state.homeBarberEntities == null || state.homeBarberEntities!.isEmpty) {
          //   return const NearestBarberShopShimmer();
          // }


          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nearest Babershop ",
                style: context.text.titleLarge,
              ),
              8.gap,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.homeBarberEntities?.length ?? 0,
                itemBuilder: (context, index) {
                  return SmallBarberItem(
                    barberEntities: state.homeBarberEntities![index],
                    onTap: (id) {
                      context.read<HomeBloc>().add(GetBarber(id));

                      // context.read<HomeBloc>().add(
                      //   BarberDetailPage(id),
                      // );
                      pPrint("Barber id: $id");
                    },
                  );
                },
              ),
              8.gap,
              state.homeBarberEntities?.isNotEmpty == false
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: context.width * 0.3,
                          child: CustomButton.secondary(
                            text: "See All",
                            onPressed: () {
                              context.read<HomeBloc>().add(ExploreBarber());
                            },
                            leading: Assets.icon.arrowUpOutline.svg(
                              colorFilter: ColorFilter.mode(
                                  context.color.primary, BlendMode.srcIn),
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          );
        },
      ),
    );
  }
}

const listBarber = [
  BarberEntities(
    id: "1",
    name: "John Doe",
    address: "123 Main Street",
    barberType: "Barber",
    distance: "0.5",
    largeImg:
        "https://cdn.shopify.com/s/files/1/0001/9211/8835/files/Happy_Barber_and_Customer_Men_s_Hairstyle_480x480.png?v=1621594670",
    smallImg:
        "https://cdn.shopify.com/s/files/1/0001/9211/8835/files/Happy_Barber_and_Customer_Men_s_Hairstyle_480x480.png?v=1621594670",
    lat: "40.7128",
    long: "74.0060",
    phoneNumber: "123-456-7890",
    rating: 4.5,
    status: "Open",
  ),
  BarberEntities(
    id: "2",
    name: "Jane Smith",
    address: "456 Elm Street",
    barberType: "Stylist",
    distance: "1.2",
    largeImg: "https://example.com/images/jane_smith_large.png",
    smallImg: "https://example.com/images/jane_smith_small.png",
    lat: "40.7138",
    long: "74.0070",
    phoneNumber: "987-654-3210",
    rating: 4.7,
    status: "Open",
  ),
  BarberEntities(
    id: "3",
    name: "Mike Johnson",
    address: "789 Oak Street",
    barberType: "Barber",
    distance: "2.0",
    largeImg: "https://example.com/images/mike_johnson_large.png",
    smallImg: "https://example.com/images/mike_johnson_small.png",
    lat: "40.7148",
    long: "74.0080",
    phoneNumber: "555-123-4567",
    rating: 4.3,
    status: "Closed",
  ),
  BarberEntities(
    id: "4",
    name: "Emily Davis",
    address: "101 Pine Street",
    barberType: "Stylist",
    distance: "0.8",
    largeImg: "https://example.com/images/emily_davis_large.png",
    smallImg: "https://example.com/images/emily_davis_small.png",
    lat: "40.7158",
    long: "74.0090",
    phoneNumber: "444-987-6543",
    rating: 4.8,
    status: "Open",
  ),
  BarberEntities(
    id: "5",
    name: "Chris Brown",
    address: "202 Maple Street",
    barberType: "Barber",
    distance: "1.5",
    largeImg: "https://example.com/images/chris_brown_large.png",
    smallImg: "https://example.com/images/chris_brown_small.png",
    lat: "40.7168",
    long: "74.0100",
    phoneNumber: "333-456-7890",
    rating: 4.6,
    status: "Open",
  ),
];
