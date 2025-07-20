import 'package:barbershop/core/extension/num_extension.dart';
import 'package:barbershop/core/themes/app_borders.dart';
import 'package:barbershop/core/themes/app_spacing.dart';
import 'package:barbershop/core/themes/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class TopStyle extends StatefulWidget {
  const TopStyle({super.key});

  @override
  State<TopStyle> createState() => _TopStyleState();
}

class _TopStyleState extends State<TopStyle> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<String> imageUrls = [
    "https://media.istockphoto.com/id/506514230/photo/beard-grooming.jpg?s=612x612&w=0&k=20&c=QDwo1L8-f3gu7mcHf00Az84fVU8oNpQLgvUw6eGPEkc=",
    "https://media.istockphoto.com/id/506514230/photo/beard-grooming.jpg?s=612x612&w=0&k=20&c=QDwo1L8-f3gu7mcHf00Az84fVU8oNpQLgvUw6eGPEkc=",
    "https://media.istockphoto.com/id/506514230/photo/beard-grooming.jpg?s=612x612&w=0&k=20&c=QDwo1L8-f3gu7mcHf00Az84fVU8oNpQLgvUw6eGPEkc=",
    "https://media.istockphoto.com/id/506514230/photo/beard-grooming.jpg?s=612x612&w=0&k=20&c=QDwo1L8-f3gu7mcHf00Az84fVU8oNpQLgvUw6eGPEkc=",
    // ...barcha URL lar
  ];

  void _onNextPage() {
    if (currentPage < imageUrls.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _onPreviousPage() {
    if (currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 5,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              10.gap,
              Expanded(
                child: Text(
                  "Top Styles",
                  style: context.text.titleLarge,
                ),
              ),
              // Navigation buttons
              _NavigationButton(
                icon: Icons.arrow_back_ios,
                isActive: currentPage > 0,
                onTap: _onPreviousPage,
              ),
              10.gap,
              _NavigationButton(
                icon: Icons.arrow_forward_ios,
                isActive: currentPage < imageUrls.length - 1,
                onTap: _onNextPage,
              ),
            ],
          ),
        ),
        16.gap,

        // Asosiy PageView qismi
        SizedBox(
          height: 430,
          child: PageView.builder(
            allowImplicitScrolling: true,
            controller: _pageController,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return ImagePage(imageUrl: imageUrls[index]);
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class ImagePage extends StatelessWidget {
  final String imageUrl;
  const ImagePage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rasm qismi
          ClipRRect(
            borderRadius: AppBorders.r12,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          12.gap,

          // Matnlar qismi
          Text(
            "Style Name",
            style: context.text.titleMedium,
          ),
          4.gap,
          /*Text(
            "Style Description",
            style: context.text.bodyMedium?.copyWith(
              color: context.color.grey,
            ),
          ),
          12.gap,*/

          // User info
           UserAbout(
            user: UserModel(
              name: "John Doe",
              imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6AxFslMa5TmB5SyqRxe5T-6lBmOaJyoRBKA&s",
              date: "12.12.2021",
              isLiked: false,
            ),
          ),
        ],
      ),
    );
  }
}

class UserAbout extends StatefulWidget {
  final UserModel user;
  const UserAbout({super.key, required this.user});

  @override
  State<UserAbout> createState() => _UserAboutState();
}

class _UserAboutState extends State<UserAbout> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Container(
        decoration: BoxDecoration(
         // color: context.color.lightGreyBackground,
          borderRadius: AppBorders.r12,
        ),
        child: Row(
          children: [
            16.gap,
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(widget.user.imageUrl),
            ),
            16.gap,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.name,
                  style: context.text.titleMedium,
                ),
                4.gap,
                Text(
                  widget.user.date,
                  style: context.text.bodySmall?.copyWith(
                    //color: context.color.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                widget.user.isLiked
                    ? Icons.bookmark
                    : Icons.bookmark_border,
              //  color: context.color.grey,
              ),
              onPressed: () => setState(() {
                widget.user.isLiked = !widget.user.isLiked;
              }),
            ),
            16.gap,
          ],
        ),
      ),
    );
  }
}

class _NavigationButton extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _NavigationButton({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
        padding: AppSpacing.a12,
        decoration: BoxDecoration(
         // color: context.color.lightGreyBackground,
          borderRadius: AppBorders.r12,
        ),
        child: Icon(
          icon,
          size: 16,
          // color: isActive
          //     ? context.color.pureBlack
          //     : context.color.pureBlack.withOpacity(0.25),
        ),
      ),
    );
  }
}

class UserModel {
  final String name;
  final String imageUrl;
  final String date;
  bool isLiked;

  UserModel({
    required this.name,
    required this.imageUrl,
    required this.date,
    required this.isLiked,
  });
}