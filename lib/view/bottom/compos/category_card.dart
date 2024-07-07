import 'package:alleventstask/domain/models/json_models/categories_model.dart';
import 'package:alleventstask/general_providers.dart';
import 'package:alleventstask/utils/constants/k_colors.dart';
import 'package:alleventstask/utils/constants/k_styles.dart';
import 'package:alleventstask/utils/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryCard extends HookConsumerWidget {
  final List<CategoriesModel> categories;
  const CategoryCard({
    required this.categories,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   category.category!.capitalizeFirst(),
        //   style: Kstyles.kAppBarTextStyle.copyWith(
        //     fontSize: Responsive.getFontSize(18),
        //   ),
        // ),
        Wrap(
          runSpacing: 5,
          children: List.generate(
            // 3, // length of the categories/subcategories
            categories.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  onSelected: (v) {
                    ref.read(eventsViewProvider).configSelectedCategory(
                        fromBottomSheet: true, categories[index]);
                  },
                  backgroundColor: ref
                              .read(eventsViewProvider)
                              .selectedCategories
                              .category ==
                          categories[index].category
                      ? KColors.primaryColor
                      : KColors.whiteColor,
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: ref
                                  .read(eventsViewProvider)
                                  .selectedCategories
                                  .category ==
                              categories[index].category
                          ? KColors.primaryColor
                          : KColors().midGreyColor,
                    ),
                  ),
                  label: Text(
                    categories[index].category!.capitalizeFirst(),
                    style: Kstyles.kAppBarTextStyle.copyWith(
                      color: ref
                                  .read(eventsViewProvider)
                                  .selectedCategories
                                  .category !=
                              categories[index].category
                          ? KColors().greyColor
                          : KColors.whiteColor,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
