# PsicoDex — ¿Qué Pokémon eres?

App Flutter del curso Multimedia para móviles (USB Bogotá).

## Instalación
1. `flutter create psicodex`
2. Reemplazar `lib/`, `pubspec.yaml` y agregar `assets/` de este paquete.
3. Borrar `test/widget_test.dart` (apunta a la app de ejemplo).
4. En `android/app/src/main/AndroidManifest.xml`, antes de `<application>`:
   `<uses-permission android:name="android.permission.INTERNET"/>`
5. `flutter pub get` y `flutter run`.

## APIs
- PokeAPI (pokeapi.co): tipos, altura, peso e imágenes oficiales.
- TCGdex (tcgdex.dev): carta del juego de cartas en el Detalle.

## Despliegue web
`flutter build web --release` y subir `build/web` a Vercel o GitHub Pages
(para Pages: `flutter build web --release --base-href /NOMBRE_REPO/`).
