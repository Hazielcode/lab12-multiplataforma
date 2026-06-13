import 'package:flutter/cupertino.dart';

import 'shared_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Center(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 108,
                height: 108,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  CupertinoIcons.person_fill,
                  color: AppColors.surface,
                  size: 64,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  CupertinoIcons.pencil,
                  color: AppColors.darkText,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        const Center(
          child: Text(
            'Editar Profile',
            style: TextStyle(
              color: AppColors.darkText,
              fontSize: 26,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 22),
        const AppTextField(
          placeholder: 'Nombre',
          icon: CupertinoIcons.person_crop_square,
        ),
        const SizedBox(height: 16),
        const AppTextField(
          placeholder: 'Apellidos',
          icon: CupertinoIcons.person_2,
        ),
        const SizedBox(height: 16),
        const AppTextField(
          placeholder: 'Descripcion',
          icon: CupertinoIcons.doc_text,
          maxLines: 4,
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 54,
          child: CupertinoButton(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(16),
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.check_mark_circled_solid),
                SizedBox(width: 10),
                Text(
                  'Actualizar perfil',
                  style: TextStyle(
                    color: CupertinoColors.white,
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
}
