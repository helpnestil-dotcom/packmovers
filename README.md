# PackMovers

Mobile-first logistics and booking prototype for local deliveries, mini-truck bookings, and household moves in Chittoor. Booking details, rates, driver information, OTP, and map positions are sample content; live GPS and booking services are not connected.

## Structure
- `mobile_app/` - Flutter Android/iOS app with a native booking and demo tracking flow
- `index.html` - PackMovers welcome/splash screen
- `home.html` - Chittoor logistics dashboard
- `vehicle-selection.html` - pickup/drop route, fleet, add-ons, payment, and booking summary
- `live-tracking.html` - live trip map, driver details, pickup OTP, and status timeline
- `src/css/splash.css` - splash screen motion and focus styles
- `src/css/styles.css` - dashboard styles and focus states
- `src/css/vehicle-selection.css` - booking page styles and reduced-motion support
- `src/css/live-tracking.css` - tracking map animation and focus styles
- `src/js/splash-config.js` - splash Tailwind theme
- `src/js/tailwind-config.js` - dashboard Tailwind theme
- `src/js/vehicle-selection-config.js` - vehicle selection Tailwind theme
- `src/js/live-tracking-config.js` - live tracking Tailwind theme

## Run
Open `index.html` in a browser, or run `python -m http.server 8000` from this folder and visit http://localhost:8000. The splash screen's **Book a Move** action opens the dashboard, and **Instant Cost** opens vehicle selection.

## Flutter mobile app
The `mobile_app` Flutter project contains the same four-screen flow: welcome, Chittoor dashboard, vehicle selection, and trip tracking. From that directory, run `flutter pub get` and `flutter run` to launch on a connected device or emulator. Build an Android install package with `flutter build apk --release`; build an iOS app on macOS with `flutter build ios --release`.

The mobile booking and tracking values are sample data. The route map is an illustration, and GPS, driver calls, sharing, payment, authentication, and backend booking services are not connected. Android builds require Android SDK command-line tools and accepted Android licenses; iOS builds require macOS and Xcode.
