part of 'food_page.dart';

class SheetResult {
  final FoodData foodData;
  final File? imageFile;

  SheetResult({
    required this.foodData,
    required this.imageFile,
  });
}

Future<SheetResult?> _showFoodBottomSheet({
  required BuildContext context,
  required Food? food,
}) {
  return showModalBottomSheet(
    enableDrag: false,
    context: context,
    elevation: 2,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    builder: (context) => _FoodBottomSheet(food: food),
  );
}

class _FoodBottomSheet extends StatefulWidget {
  final Food? food;

  const _FoodBottomSheet({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  State<_FoodBottomSheet> createState() => _FoodBottomSheetState();
}

class _FoodBottomSheetState extends State<_FoodBottomSheet> {
  static const _minPickValue = 1;
  static const _maxPickValue = 100;

  String? _name;
  int _proteinsPer100g = _minPickValue;
  int _carbohydatesPer100g = _minPickValue;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _name = widget.food?.name;
    _proteinsPer100g = widget.food?.proteins != null ? widget.food!.proteins : _minPickValue;
    _carbohydatesPer100g = widget.food?.carbohydrates != null ? widget.food!.carbohydrates : _minPickValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      padding: Insets.normal,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.food != null
                      ? LocaleKeys.pages_food_edit_sheet_edit_title.tr()
                      : LocaleKeys.pages_food_edit_sheet_create_title.tr(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            Spacing.normal,
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LayoutBuilder(builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_imageFile == null)
                        _FoodImage.url(
                          onImagePicked: (image) => setState(() => _imageFile = image),
                          imageUrl: widget.food?.imageUrl,
                        )
                      else
                        _FoodImage.file(
                          onImagePicked: (image) => setState(() => _imageFile = image),
                          imageFile: _imageFile,
                        ),
                      const Spacer(),
                      SizedBox(
                        width: constraints.maxWidth * 0.75,
                        child: AppTextField(
                          initialText: widget.food?.name,
                          onChanged: (value) => _name = value,
                          labelText: LocaleKeys.common_name.tr(),
                        ),
                      ),
                    ],
                  );
                }),
                Spacing.normal,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.common_carbohydrate_amount_in_gram.tr(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    AppSlider(
                      value: _carbohydatesPer100g,
                      minValue: _minPickValue,
                      maxValue: _maxPickValue,
                      onValueChanged: (value) => setState(() => _carbohydatesPer100g = value),
                    ),
                  ],
                ),
                Spacing.tiny,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.common_protein_amount_in_gram.tr(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    AppSlider(
                      value: _proteinsPer100g,
                      minValue: _minPickValue,
                      maxValue: _maxPickValue,
                      onValueChanged: (value) => setState(() => _proteinsPer100g = value),
                    ),
                  ],
                ),
                Spacing.normal,
                ElevatedButton(
                  onPressed: _isSubmittable
                      ? () {
                          Navigator.of(context).pop(
                            SheetResult(
                              foodData: FoodData(
                                name: _name!,
                                proteins: _proteinsPer100g,
                                carbohydrates: _carbohydatesPer100g,
                              ),
                              imageFile: _imageFile,
                            ),
                          );
                        }
                      : null,
                  child: Text(LocaleKeys.pages_food_edit_sheet_submit_button_label.tr()),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool get _isSubmittable => _name != null;
}

class _FoodItem extends StatelessWidget {
  final Food food;
  final double maxWidth;

  const _FoodItem({
    required this.food,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    final FoodBloc bloc = BlocProvider.of(context);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _FoodImage.url(
              onImagePicked: (_) {},
              imageUrl: food.imageUrl,
              size: maxWidth,
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Theme.of(context).primaryColorLight,
                  child: IconButton(
                    icon: const Icon(Icons.edit_note_outlined),
                    color: Theme.of(context).colorScheme.onSurface,
                    onPressed: () async {
                      final result = await _showFoodBottomSheet(context: context, food: food);
                      if (result != null) {
                        bloc.createFood(result.foodData, result.imageFile);
                      }
                    },
                  ),
                ),
                Spacing.small,
                Container(
                  color: Theme.of(context).primaryColorDark,
                  child: IconButton(
                    icon: const Icon(Icons.delete_forever_outlined),
                    color: Theme.of(context).colorScheme.onSurface,
                    onPressed: () => bloc.deleteFood(food),
                  ),
                ),
              ],
            )
          ],
        ),
        Spacing.tiny,
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.name,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).primaryColorLight,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            Text.rich(
              TextSpan(
                text: LocaleKeys.common_protein_amount_in_gram.tr(),
                style: Theme.of(context).textTheme.labelMedium,
                children: [
                  TextSpan(
                    text: food.proteins.toString(),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: LocaleKeys.common_carbohydrate_amount_in_gram.tr(),
                style: Theme.of(context).textTheme.labelMedium,
                children: [
                  TextSpan(
                    text: food.carbohydrates.toString(),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _FoodImage extends StatelessWidget {
  final ValueChanged<File>? onImagePicked;
  final String? imageUrl;
  final File? imageFile;
  final double size;

  const _FoodImage.url({
    Key? key,
    required this.onImagePicked,
    required this.imageUrl,
    this.size = 60,
  })  : imageFile = null,
        super(key: key);

  const _FoodImage.file({
    Key? key,
    required this.onImagePicked,
    required this.imageFile,
    this.size = 60,
  })  : imageUrl = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onImagePicked != null
          ? () async {
              final ImagePicker picker = ImagePicker();
              final XFile? file = await picker.pickImage(source: ImageSource.gallery);
              if (file != null) {
                onImagePicked!(File(file.path));
              }
            }
          : null,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border.all(color: Theme.of(context).colorScheme.onSurface),
          image: _decorationImage,
        ),
        child: imageUrl == null ? const Icon(Icons.image) : null,
      ),
    );
  }

  DecorationImage? get _decorationImage {
    final ImageProvider? imageProvider;
    if (imageUrl != null) {
      imageProvider = NetworkImage(imageUrl!);
    } else if (imageFile != null) {
      imageProvider = FileImage(imageFile!);
    } else {
      imageProvider = null;
    }
    if (imageProvider == null) {
      return null;
    }

    return DecorationImage(image: imageProvider, fit: BoxFit.fill);
  }
}
