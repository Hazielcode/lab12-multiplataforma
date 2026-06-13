import 'package:flutter/cupertino.dart';

import 'login.dart';
import 'product_list.dart';
import 'profile.dart';
import 'register_product.dart';
import 'shared_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  static const _pages = [
    MenuTab(),
    RegisterProductPage(),
    ProductListPage(),
    ProfilePage(),
  ];

  static const _items = [
    _NavItem(
      label: 'Menu',
      icon: CupertinoIcons.rectangle_grid_2x2,
      activeIcon: CupertinoIcons.rectangle_grid_2x2_fill,
    ),
    _NavItem(
      label: 'Registrar',
      icon: CupertinoIcons.add_circled,
      activeIcon: CupertinoIcons.add_circled_solid,
    ),
    _NavItem(
      label: 'Listado',
      icon: CupertinoIcons.list_bullet,
      activeIcon: CupertinoIcons.list_bullet,
    ),
    _NavItem(
      label: 'Profile',
      icon: CupertinoIcons.person,
      activeIcon: CupertinoIcons.person_fill,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.darkText,
        middle: const Text(
          'RetroStore',
          style: TextStyle(
            color: AppColors.surface,
            fontWeight: FontWeight.w800,
          ),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              CupertinoPageRoute(builder: (_) => const LoginPage()),
              (route) => false,
            );
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                CupertinoIcons.square_arrow_right,
                color: AppColors.surface,
                size: 18,
              ),
              SizedBox(width: 4),
              Text(
                'Salir',
                style: TextStyle(
                  color: AppColors.surface,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(child: _pages[_currentIndex]),
            _CupertinoNavBar(
              currentIndex: _currentIndex,
              items: _items,
              onChanged: (index) => setState(() => _currentIndex = index),
            ),
          ],
        ),
      ),
    );
  }
}

class _CupertinoNavBar extends StatelessWidget {
  const _CupertinoNavBar({
    required this.currentIndex,
    required this.items,
    required this.onChanged,
  });

  final int currentIndex;
  final List<_NavItem> items;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.lightBorder)),
      ),
      child: Row(
        children: [
          for (var index = 0; index < items.length; index++)
            Expanded(
              child: _CupertinoNavButton(
                item: items[index],
                selected: currentIndex == index,
                onPressed: () => onChanged(index),
              ),
            ),
        ],
      ),
    );
  }
}

class _CupertinoNavButton extends StatelessWidget {
  const _CupertinoNavButton({
    required this.item,
    required this.selected,
    required this.onPressed,
  });

  final _NavItem item;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.darkText : AppColors.deepTeal;

    return CupertinoButton(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      onPressed: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        decoration: BoxDecoration(
          color: selected ? AppColors.secondary : CupertinoColors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              selected ? item.activeIcon : item.icon,
              color: color,
              size: 22,
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem {
  const _NavItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
}

class MenuTab extends StatelessWidget {
  const MenuTab({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _MenuItem(
        'Registrar Producto',
        'Agrega datos del producto',
        CupertinoIcons.bag_badge_plus,
        AppColors.primary,
      ),
      _MenuItem(
        'Listado Productos',
        'Revisa productos disponibles',
        CupertinoIcons.cube_box_fill,
        AppColors.greenTeal,
      ),
      _MenuItem(
        'Profile',
        'Actualiza tu informacion',
        CupertinoIcons.person_crop_circle,
        AppColors.secondary,
      ),
      _MenuItem(
        'Logout',
        'Salir de la sesion actual',
        CupertinoIcons.square_arrow_right,
        AppColors.danger,
      ),
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: AppColors.deepTeal,
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Menu principal',
                style: TextStyle(
                  color: AppColors.surface,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Panel visual para administrar una bodega con productos, registros y perfil.',
                style: TextStyle(color: CupertinoColors.white, height: 1.4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ...items.map((item) => _MenuTile(item: item)),
      ],
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({required this.item});

  final _MenuItem item;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      shadow: true,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: item.color.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, color: item.color),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: AppColors.darkText,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  style: const TextStyle(color: AppColors.deepTeal),
                ),
              ],
            ),
          ),
          const Icon(CupertinoIcons.chevron_right, color: AppColors.primary),
        ],
      ),
    );
  }
}

class _MenuItem {
  const _MenuItem(this.title, this.subtitle, this.icon, this.color);

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
}
