import 'package:barbershop/core/constants/app_constants.dart';
import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/detail_barber_bloc.dart';

class ServiceInfo extends StatelessWidget {
  const ServiceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBarberBloc, DetailBarberState>(
      builder: (context, state) {
        if (state.detailBarber?.haircutStyles?.isEmpty ?? true) {
          return Center(
            child: Text(
              "No Service",
              style: context.text.titleMedium
                  ?.copyWith(color: context.color.red500),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Our Services", style: context.text.titleMedium),
            12.gap,
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                
                itemCount: state.detailBarber?.haircutStyles?.length ?? 0,
                itemBuilder: (context, index) {
                  return ServiceItem(
                    title: state.detailBarber?.haircutStyles?[index].name ?? "",
                    price: state.detailBarber?.haircutStyles?[index].price ?? "",
                    image: state.detailBarber?.haircutStyles?[index]
                            .serviceImageUrl ??
                        "",
                    description:
                        state.detailBarber?.haircutStyles?[index].description ??
                            "",
                    onPressed: () {},
                  );
                },
              ),
            ),
            12.gap,
          ],
        );
      },
    );
  }
}

final listServiceUsers = [
  ServiceItem(
    title: "Haircut",
    price: "10 \$",
    image:
        "https://s3.r29static.com/bin/entry/5d2/0,0,2000,2400/720x864,85/1567778/image.webp",
    description: "Haircut",
    onPressed: () {},
  ),
  ServiceItem(
    title: "Shave",
    price: "5 \$",
    image:
        "https://theultimatebarber.com/wp-content/uploads/2020/03/3.14-ultimate-barber.jpg",
    description: "Shave",
    onPressed: () {},
  ),
  ServiceItem(
    title: "Beard Trim",
    price: "7 \$",
    image: "https://example.com/beard_trim_image.webp",
    description: "Beard Trim",
    onPressed: () {},
  ),
  ServiceItem(
    title: "Hair Coloring",
    price: "20 \$",
    image:
        "https://cdn11.bigcommerce.com/s-h7l2pcerei/product_images/uploaded_images/trimming-beard.jpg",
    description: "Hair Coloring",
    onPressed: () {},
  ),
  ServiceItem(
    title: "Facial",
    price: "15 \$",
    image:
        "https://thevaletlondon.com/wp-content/uploads/2023/07/24-Carat-Gold-Facial-Treatment-at-The-Valet-Barber-Shop-Croydon-South-London-shutterstock_413266930-645x426.jpg",
    description: "Facial",
    onPressed: () {},
  ),
];

class ServiceItem extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final String? description;

  final VoidCallback onPressed;

  const ServiceItem({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    pPrint("Image Service $image");
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: CachedNetworkImageProvider(
            AppConstants.imgUrl+image,
          ),
        ),
        12.gap,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title.split("_").join(" "), style: context.text.titleMedium),
              8.gap,
              description == null
                  ? const SizedBox()
                  : Text(description!,
                      style: context.text.bodyMedium
                          ?.copyWith(color: context.color.coolGray500)),
            ],
          ),
        ),
        8.gap,
        Text(price, style: context.text.titleMedium),
        4.gap,
      ],
    );
  }
}
