import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/core/widgets/custom_starts_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ReviewsInfo extends StatelessWidget {
  const ReviewsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Text("Users Opinion", style: context.text.titleMedium),
        12.gap,
        Expanded(
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return _items[index];
            },
          ),
        ),
        12.gap,
      ],
    );
  }
}

const  _items = [
  ReviewItem(
    title: "John Doe",
    image: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde",
    description: "Best barber in town",
    starts: 5,
  ),
  ReviewItem(
    title: "Jane Smith",
    image: "https://images.unsplash.com/photo-1554151228-14d9def656e4",
    description: "Great service and friendly staff",
    starts: 4,
  ),
  ReviewItem(
    title: "Alice Johnson",
    image: "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d",
    description: "Highly recommend this place",
    starts: 5,
  ),
  ReviewItem(
    title: "Bob Brown",
    image: "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
    description: "Good experience overall",
    starts: 4,
  ),
  ReviewItem(
    title: "Charlie Davis",
    image: "https://img.freepik.com/free-photo/androgynous-avatar-non-binary-queer-person_23-2151100205.jpg",
    description: "Will definitely come back",
    starts: 5,
  ),
];

class ReviewItem extends StatelessWidget {
  final String title;
  final String image;
  final int starts;


  final String description;

  const ReviewItem({
    super.key,
    required this.title,
    required this.image,
    required this.description, required this.starts,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: CachedNetworkImageProvider(
            image,
          ),
        ),
        12.gap,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.text.titleMedium,
            ),
            4.gap,
             CustomStartsBar(
              starts: starts,
            ),
            4.gap,
            Text(
              maxLines: 2,
              description,
              style: context.text.bodyMedium?.copyWith(
                  color: context.color.coolGray500),
            ),
          ],
        ),
      ],
    );
  }
}
