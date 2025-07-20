import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/core/widgets/custom_button.dart';
import 'package:barbershop/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class SearchBarApp extends StatelessWidget {
  final bool readOnly;

  const SearchBarApp({super.key, this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.a16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(

            onTap: () {
              readOnly ? context.read<HomeBloc>().add(ExploreBarber()) : null;
            },
            child: readOnly ? AbsorbPointer(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: CustomTextField.primary(
                      hintText: "Search",
                      readOnly: readOnly,
                      prefixIcon: Icon(
                          Icons.search, color: context.color.primary),
                      onChanged: (p0) {

                      },
                    ),
                  ),
                  8.gap,
                  CustomButton.icon(
                      padding: AppSpacing.a16,
                      onPressed: () {
                        context.read<HomeBloc>().add(FilterSummitButton());
                      }, icon: Assets.icon.setting.svg(
                    colorFilter: ColorFilter.mode(
                        context.color.white, BlendMode.srcIn),
                  )
                  ),

                ],
              ),
            ) : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<HomeBloc, HomeState>(

                  buildWhen: (previous, current) => previous.homeQueryEntities.barberQuery != current.homeQueryEntities.barberQuery,
                  builder: (context, state) {
                    return Expanded(
                      child: CustomTextField.primary(
                        hintText: "Search",
                        maxLines:1 ,
                        textFieldText: state.homeQueryEntities.barberQuery,
                        readOnly: readOnly,
                        prefixIcon: Icon(Icons.search, color: context.color
                            .primary),
                        onChanged: (value) {
                          context.read<HomeBloc>().add(SearchBarber(value));
                        },
                      ),
                    );
                  },
                ),
                8.gap,
                CustomButton.icon(
                    padding: AppSpacing.a16,
                    onPressed: () {
                      context.read<HomeBloc>().add(FilterSummitButton());
                    }, icon: Assets.icon.setting.svg(
                  colorFilter: ColorFilter.mode(
                      context.color.white, BlendMode.srcIn),
                )
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
