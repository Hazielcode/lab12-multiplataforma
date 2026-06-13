# Lab12_Fernando_Mas - RetroStore (Implementación con Cupertino)

Este laboratorio implementa el diseño de una aplicación de inventario, utilizando **componentes de Cupertino** para brindar una apariencia y navegación estilo iOS, y aplicando un renovado **Tema Retro / Cyberpunk**.

## Resumen de Cambios (Lo que hicimos)

1. **Nuevo Nombre y Marca:** Se renombró la aplicación de `BodegaFMAS` a **`RetroStore`**.
2. **Transformación Visual (Estilo Cyberpunk/Retro):**
   - **Fondos Oscuros:** Cambio radical del fondo a tonos morado oscuro y azul marino (`0xFF1A1A2E`, `0xFF16213E`) estilo terminal.
   - **Tonos Neón:** Uso intenso de **Fucsia Neón** (`0xFFFF00FF`) y **Cyan** (`0xFF00FFFF`) en botones, bordes, íconos y contenedores interactivos.
   - **Tipografía Hacker:** Se aplicó la fuente `'Courier'` con un texto en color **Verde Terminal** (`0xFF00FF41`) en toda la aplicación para dar esa estética de código clásico.
3. **Optimización de Compatibilidad:**
   - Corrección de la versión de SDK en `pubspec.yaml` (ajustada a la versión local `^3.5.0` y compatibilidad de `flutter_lints`).
   - Reemplazo de sintaxis no soportada en versiones previas de Flutter (como `minimumSize` y `.withValues()`) adaptándolas para una compilación exitosa (`.withOpacity()`).

## Tecnologías y Componentes Utilizados

- **Flutter con Dart.**
- `CupertinoApp` (con tema Dark activado).
- `CupertinoPageScaffold` para las pantallas y estructura base.
- `CupertinoNavigationBar` para la barra superior.
- `CupertinoButton` para botones interactivos.
- `CupertinoTextField` para campos de entrada de texto.
- `CupertinoActivityIndicator` para la pantalla de carga.
- `CupertinoPicker` y `CupertinoDatePicker` para interactuar con listas y fechas de forma nativa en iOS.
- `CupertinoIcons` para la iconografía estilo Apple.

## Funcionamiento de la App

La aplicación simula el control de inventario llamado **RetroStore**. Permite iniciar sesión, mostrar una carga breve, navegar por un menú principal, registrar productos, interactuar con selectores nativos Cupertino (fecha y categoría), ver un listado de productos y editar el perfil del usuario.

## Capturas

*(La apariencia actual con el nuevo Modo Retro se encuentra documentada aquí abajo)*

### Login
![Captura Login](<ScreenShoots/cap1.png>)

### Menú Principal
![Captura Menu](<ScreenShoots/cap2.png>)

### Registro de Producto
![Captura Registro](<ScreenShoots/cap3.png>)

### Selector Cupertino de Categoría
![Captura Registro Cupertino](<ScreenShoots/cap4.png>)

### Selector Cupertino de Fecha
![Captura Registro Cupertino 2](<ScreenShoots/cap5.png>)

### Lista de Productos
![Captura Registro Lista de Productos](<ScreenShoots/cap6.png>)

### Editar Perfil
![Captura Edit Profile](<ScreenShoots/cap7.png>)
