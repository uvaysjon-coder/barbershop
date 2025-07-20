import 'package:barbershop/core/themes/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../detail_barber/presentations/bloc/detail_barber_bloc.dart';

class SelectPaymentService extends StatefulWidget {
  const SelectPaymentService({super.key});

  @override
  State<SelectPaymentService> createState() => _SelectPaymentServiceState();
}

class _SelectPaymentServiceState extends State<SelectPaymentService> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBarberBloc, DetailBarberState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'Select Payment Method',
              style: context.text.titleMedium?.copyWith(
                color: context.color.primaryBrand700,
              ),
            ),
            12.gap,
            ListView.builder(
              itemBuilder: (_, index) {
                return PaymentItem(
                  img: paymentMethods[index].$1,
                  title: paymentMethods[index].$2,
                  isSelected: state.selectPaymentService == index,
                  isDisabled: paymentMethods[index].$3,
                  onTap: (value) {
                    context
                        .read<DetailBarberBloc>()
                        .add(SelectPaymentServiceEvent(index));
                  },
                );
              },
              itemCount: paymentMethods.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
            20.gap,
          ],
        );
      },
    );
  }
}

final List<(String, String, bool)> paymentMethods = [
  (Assets.icon.paymeLogo.path, 'Payme', true),
  (Assets.icon.clikLogo.path, 'Clik', true),
  (Assets.icon.cashPayment.path, 'Cash Payment', false),
];

class PaymentItem extends StatelessWidget {
  final String? img;
  final String title;
  final bool isSelected;
  final bool isDisabled;

  final Function(String)? onTap;

  const PaymentItem({
    super.key,
    this.img,
    required this.title,
    this.isSelected = false,
    this.isDisabled = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          !isDisabled ? onTap!(title) : null;
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isDisabled
                ? context.color.coolGray50
                : (isSelected
                    ? context.color.primaryBrand50
                    : context.color.coolGray50),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDisabled
                  ? context.color.coolGray200
                  : (isSelected
                      ? context.color.blueGray600
                      : context.color.white),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (img != null)
                SvgPicture.asset(
                  img!,
                  width: 24,
                  height: 24,
                ),
              if (img != null) const SizedBox(width: 4),
              Text(
                title,
                style: context.text.bodyMedium?.copyWith(
                  color: isDisabled ? context.color.coolGray200 : (isSelected
                      ? context.color.primary
                      : context.color.primaryBrand700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
