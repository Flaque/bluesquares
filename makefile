all:
	flutter run -d all

android-emulator:
	emulator -avd Pixel_2_API_26 &

create-models:
	flutter packages pub run build_runner build