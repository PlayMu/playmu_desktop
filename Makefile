.PHONY: icons upgrade clean

default: upgrade

icons:
	@echo "Generating launcher icons..."
	@dart run launcher_icons
	@rm -rf macos/AppIcon.icon
	@cp -r assets/icons/icon_macos.icon macos/AppIcon.icon
	@make clean

upgrade:
	@echo "Upgrading packages..."
	@make clean
	@flutter pub upgrade
	@flutter pub upgrade --major-versions

clean:
	@echo "Cleaning the project..."
	@flutter clean
	@flutter pub get
