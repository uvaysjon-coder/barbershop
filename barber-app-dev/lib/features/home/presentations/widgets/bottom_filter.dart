import 'package:barbershop/core/extension/num_extension.dart';
import 'package:barbershop/core/themes/app_borders.dart';
import 'package:barbershop/core/themes/app_theme.dart';
import 'package:barbershop/core/themes/extensions/context_extension.dart';
import 'package:barbershop/core/widgets/custom_button.dart';
import 'package:barbershop/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/themes/app_spacing.dart';
import '../bloc/home_bloc.dart';

class BottomFilter extends StatefulWidget {
  const BottomFilter({super.key});

  @override
  State<BottomFilter> createState() => _BottomFilterState();
}

class _BottomFilterState extends State<BottomFilter> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
  builder: (context, state) {
    return ClipRRect(
      borderRadius: AppBorders.t24,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.color.white,

        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom + 10),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ColoredBox(
                color: context.color.primaryBrand50,
                child: Padding(
                  padding: AppSpacing.a16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: AppSpacing.a8,
                          decoration: BoxDecoration(
                            color: context.color.white,
                            borderRadius: AppBorders.r8,
                          ),
                          child: Assets.icon.questionSquare.svg()),
                      Text("Filter", style: context.text.titleLarge),
                      GestureDetector(onTap: (){
                        Navigator.pop(context);
                      },child: Assets.icon.close.svg()),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: context.width,
                child: Padding(
                  padding: AppSpacing.h16,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      12.gap,
                      Text("General Category", style: context.text.titleMedium),
                      8.gap,
                      FilterChipsWrap(
                        filters: listFilter,
                        initialSelectedIndex:listFilter
                            .indexWhere((element) => element == state.homeQueryEntities.haircutStyles),
                        onFilterSelected: (value) {
                          context.read<HomeBloc>().add(FilterHaircutStyles(value));
                        },
                      ),
                      12.gap,
                      Text("Distance", style: context.text.titleMedium),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Text("Nearest", style: context.text.titleSmall?.copyWith(color: context.color.primaryBrand500)),
                              8.gap,
                              SizedBox(
                                width: context.width * 0.2,

                                child: CustomTextField.primary(


                                  maxLength: 2,
                                  onChanged: (value) {

                                  },
                                  onSubmitted: (value)  {
                                    final doubleValue = double.tryParse(value);
                                    if (doubleValue != null) {
                                      context.read<HomeBloc>().add(FilterNearestDistance(doubleValue));
                                    }
                                  },

                                  textFieldText: (state.homeQueryEntities.nearestDistance?? 0.0) >0 ? state.homeQueryEntities.nearestDistance.toString() :null ,
                                  hintText: "0",
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          4.gap,
                          Text("km", style: context.text.titleSmall?.copyWith(color: context.color.primary)),
                          8.gap,
                          Center(
                            child: Container(
                              margin: AppSpacing.v24,
                              height: 5,
                              width: 20,
                              decoration: BoxDecoration(
                                color: context.color.primary,
                                borderRadius: AppBorders.r8,
                              ),
                            ),
                          ),
                          16.gap,
                          Column(
                            children: [
                              Text("Farthest", style: context.text.titleSmall?.copyWith(color: context.color.primaryBrand500)),
                              8.gap,
                              SizedBox(
                                width: context.width * 0.2,

                                child: CustomTextField.primary(

                                  maxLength: 2,
                                  onChanged: (value) {

                                  },
                                  onSubmitted: (value){
                                    final doubleValue = double.tryParse(value);
                                    if (doubleValue != null) {
                                      context.read<HomeBloc>().add(FilterFarthestDistance(doubleValue));
                                    }
                                  },
                                  textFieldText: (state.homeQueryEntities.farthestDistance?? 0.0) >0 ? state.homeQueryEntities.farthestDistance.toString() :null ,

                                  hintText: "0",
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          8.gap,
                          Text("km", style: context.text.titleSmall?.copyWith(color: context.color.primary)),

                        ],
                      ),

                      12.gap,

                      CustomButton.naked(text: "Reset", onPressed:(){
                        context.read<HomeBloc>().add(FilterReset());
                        Navigator.pop(context);

                      },),
                      CustomButton.primary(
                        onPressed: () {
                          context.read<HomeBloc>().add( FilterSaveButton());
                          Navigator.pop(context);
                        },
                        text: "Apply",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}

const List<String> listFilter = [
  "Basic_haircut",
  "Kids_haircut"
  "Special_Massage",
  "Hair_coloring",
  "Haircut_with_beard_trim",
  "Hair_treatment",
];
class FilterChipsWrap extends StatefulWidget {
  final List<String> filters;
  final int? initialSelectedIndex;
  final Function(String value)? onFilterSelected;

  const FilterChipsWrap({
    super.key,
    required this.filters,
    this.initialSelectedIndex,
    this.onFilterSelected,
  });

  @override
  State<FilterChipsWrap> createState() => _FilterChipsWrapState();
}

class _FilterChipsWrapState extends State<FilterChipsWrap> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      children: List.generate(
        widget.filters.length,
            (index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            if (widget.onFilterSelected != null) {
              widget.onFilterSelected!(widget.filters[index]);
            }
          },
          child: Container(
            padding: AppSpacing.a8,
            margin: AppSpacing.h8,
            decoration: BoxDecoration(
              color: selectedIndex == index
                  ? context.color.primaryBrand50
                  : context.color.white,
              borderRadius: AppBorders.r8,
              border: Border.all(
                color: selectedIndex == index
                    ? context.color.primary
                    : context.color.white,
                width: 1,
              ),
            ),
            child: Text(
              widget.filters[index].split("_").join(" "),
              style: context.text.bodyMedium?.copyWith(
                color: selectedIndex == index
                    ? context.color.primary
                    : context.color.primaryBrand500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}