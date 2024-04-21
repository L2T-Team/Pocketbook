import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pocketbook/language/language.dart';
import 'package:pocketbook/model/responses/category_model.dart';
import 'package:get/get.dart';
import 'package:pocketbook/utils/app_asset.dart';
import 'package:pocketbook/utils/app_style.dart';

class ItemCategoryWidget extends StatelessWidget {
  final List<CategoryModel> listCategories;
  final String indicatorSelected;
  final CategoryModel? categorySelected;
  final Function(CategoryModel) categorySelectedAction;
  final Function navigateCategory;
  const ItemCategoryWidget({
    super.key,
    required this.listCategories,
    required this.indicatorSelected,
    this.categorySelected,
    required this.categorySelectedAction,
    required this.navigateCategory,
  });

  @override
  Widget build(BuildContext context) {
    var listCategory = listCategories
        .where((element) => indicatorSelected == LanguageKey.expense.tr
            ? (element.type == LanguageKey.expense.tr || element.type == null)
            : (element.type != LanguageKey.expense.tr || element.type == null))
        .toList();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      itemCount: listCategory.length,
      itemBuilder: (BuildContext context, int index) {
        final item = listCategory[index];
        final width = ((MediaQuery.of(context).size.width - 32) / 4);
        return SizedBox(
          width: width,
          height: 99.0,
          child: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              if (item.name == null && item.type == null) {
                navigateCategory();
              } else {
                categorySelectedAction(item);
              }
            },
            child: SizedBox(
              width: width,
              height: 99.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Image
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    width: 56.0,
                    height: 56.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                      color: AppColor.grey201913,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28.0),
                      child: Stack(
                        children: [
                          /// Image
                          Container(
                            width: 56.0,
                            height: 56.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28.0),
                              color: AppColor.grey201913.withOpacity(0.5),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(28.0),
                              child: (item.image ?? '').isNotEmpty
                                  ? CachedNetworkImage(
                                      imageUrl: (item.image ?? ''),
                                      width: 56.0,
                                      height: 56.0,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          SpinKitCircle(
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                          ),

                          /// Check Icon
                          item.name == null && item.type == null
                              ? Container(
                                  color: AppColor.black1C2030.withOpacity(0.5),
                                  width: 56.0,
                                  height: 56.0,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    AppImages.icMore,
                                    width: 56.0,
                                    height: 56.0,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : (categorySelected?.name == item.name &&
                                      categorySelected?.id == item.id
                                  ? Container(
                                      color:
                                          AppColor.black1C2030.withOpacity(0.5),
                                      width: 56.0,
                                      height: 56.0,
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: 24.0,
                                        height: 24.0,
                                        child: Image.asset(
                                          AppImages.icChecked,
                                          width: 24.0,
                                          height: 24.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : const SizedBox()),
                        ],
                      ),
                    ),
                  ),

                  /// Name
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1.5),
                    alignment: Alignment.center,
                    child: Text(
                      item.name ?? LanguageKey.more.tr,
                      textAlign: TextAlign.center,
                      style: TextStyles.normalTextStyle(
                        size: 12.0,
                        color: AppColor.black1C2030,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
        childAspectRatio: ((MediaQuery.of(context).size.width - 32) / 4) / 99.0,
      ),
    );
  }
}
