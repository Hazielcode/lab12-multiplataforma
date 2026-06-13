import 'package:flutter/cupertino.dart';

import 'shared_styles.dart';

class RegisterProductPage extends StatefulWidget {
  const RegisterProductPage({super.key});

  @override
  State<RegisterProductPage> createState() => _RegisterProductPageState();
}

class _RegisterProductPageState extends State<RegisterProductPage> {
  static const _categories = [
    'Abarrotes',
    'Cocina',
    'Lacteos',
    'Snacks',
    'Limpieza',
  ];

  int _categoryIndex = 0;
  DateTime _expirationDate = DateTime(2026, 6, 13);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Registrar Producto',
          style: TextStyle(
            color: AppColors.darkText,
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Completa los datos principales del producto.',
          style: TextStyle(color: AppColors.deepTeal),
        ),
        const SizedBox(height: 22),
        const AppTextField(
          placeholder: 'Nombre del producto',
          icon: CupertinoIcons.bag,
        ),
        const SizedBox(height: 16),
        _SelectableCupertinoField(
          label: 'Categoria',
          value: _categories[_categoryIndex],
          icon: CupertinoIcons.tags,
          onPressed: _showCategoryPicker,
        ),
        const SizedBox(height: 16),
        _SelectableCupertinoField(
          label: 'Fecha de vencimiento',
          value: _formatDate(_expirationDate),
          icon: CupertinoIcons.calendar,
          onPressed: _showDatePicker,
        ),
        const SizedBox(height: 16),
        const AppTextField(
          placeholder: 'Precio',
          icon: CupertinoIcons.money_dollar,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        const AppTextField(
          placeholder: 'Stock',
          icon: CupertinoIcons.cube_box,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        const AppTextField(
          placeholder: 'Descripcion',
          icon: CupertinoIcons.doc_text,
          maxLines: 3,
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 54,
          child: CupertinoButton(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(16),
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.check_mark_circled,
                  color: AppColors.darkText,
                ),
                SizedBox(width: 10),
                Text(
                  'Guardar producto',
                  style: TextStyle(
                    color: AppColors.darkText,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showCategoryPicker() {
    var selectedIndex = _categoryIndex;

    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) {
        return _PickerSheet(
          title: 'Categoria',
          onDone: () {
            setState(() => _categoryIndex = selectedIndex);
            Navigator.pop(context);
          },
          child: CupertinoPicker(
            scrollController: FixedExtentScrollController(
              initialItem: _categoryIndex,
            ),
            itemExtent: 42,
            onSelectedItemChanged: (index) => selectedIndex = index,
            children: [
              for (final category in _categories)
                Center(
                  child: Text(
                    category,
                    style: const TextStyle(color: AppColors.darkText),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _showDatePicker() {
    var selectedDate = _expirationDate;

    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) {
        return _PickerSheet(
          title: 'Fecha de vencimiento',
          onDone: () {
            setState(() => _expirationDate = selectedDate);
            Navigator.pop(context);
          },
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: _expirationDate,
            minimumDate: DateTime(2026),
            maximumDate: DateTime(2030, 12, 31),
            onDateTimeChanged: (date) => selectedDate = date,
          ),
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }
}

class _SelectableCupertinoField extends StatelessWidget {
  const _SelectableCupertinoField({
    required this.label,
    required this.value,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.lightBorder),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: AppColors.deepTeal,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      color: AppColors.darkText,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(CupertinoIcons.chevron_down, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}

class _PickerSheet extends StatelessWidget {
  const _PickerSheet({
    required this.title,
    required this.child,
    required this.onDone,
  });

  final String title;
  final Widget child;
  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      color: AppColors.surface,
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: CupertinoColors.white,
                border: Border(
                  bottom: BorderSide(color: AppColors.lightBorder),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.darkText,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: onDone,
                    child: const Text(
                      'Listo',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
