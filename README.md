# Lab12_Fernando_Mas - RetroStore (Implementación con Cupertino)

Este laboratorio implementa el diseño de una aplicación de inventario, utilizando **componentes de Cupertino** para brindar una apariencia y navegación estilo iOS, y aplicando un renovado **Tema Retro / Cyberpunk**.

## Cambios Implementados (Modo Retro)

1. **Renombrado de Aplicación:** El nombre del proyecto y los textos visuales cambiaron de `BodegaFMAS` a **`RetroStore`**.
2. **Paleta de Colores Retro:**
   - **Fondo General y Superficies:** Tonos morados/azul muy oscuros (`0xFF1A1A2E`, `0xFF16213E`) simulando el espacio o un entorno de terminal retro.
   - **Colores Principales:** Fucsia Neón (`0xFFFF00FF`) y Cyan (`0xFF00FFFF`) para botones, bordes e íconos.
   - **Tipografía y Textos:** Implementación de fuente `'Courier'` con color Verde Terminal (`0xFF00FF41`) para resaltar la temática retro/hacker.
3. **Optimización de Compatibilidad:**
   - Actualización de `pubspec.yaml` para asegurar que el proyecto se ejecute correctamente en el SDK actual.
   - Corrección de propiedades no compatibles (como `minimumSize` y `.withValues()`) adaptándolas a versiones estables del SDK (`.withOpacity()`).

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

*(Actualiza las capturas reemplazando los archivos en la carpeta `ScreenShoots` con la nueva interfaz de RetroStore)*

### Login
![Captura Login](<ScreenShoots/Captura Login.png>)

### Menú Principal
![Captura Menu](<ScreenShoots/Captura Menu .png>)

### Registro de Producto
![Captura Registro](<ScreenShoots/Captura Registro.png>)

### Selector Cupertino de Categoría
![Captura Registro Cupertino](<ScreenShoots/Captura Registro CUpertino.png>)

### Selector Cupertino de Fecha
![Captura Registro Cupertino 2](<ScreenShoots/Captura Registro CUpertino 2.png>)

### Lista de Productos
![Captura Registro Lista de Productos](<ScreenShoots/Captura Registro Lista de Productos.png>)

### Editar Perfil
![Captura Edit Profile](<ScreenShoots/Captura Edit Profile.png>)
