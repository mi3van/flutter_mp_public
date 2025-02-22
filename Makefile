define merge-google
    ./merge_import_script.sh GOOGLE
	flutter clean
endef
define merge-huawei
    ./merge_import_script.sh HUAWEI
	flutter clean
endef
define merge-rustore
    ./merge_import_script.sh RUSTORE
	flutter clean
endef
define merge-windows
    ./merge_import_script.sh Windows
	flutter clean
endef

db:
	cd local_plugins/data; dart run build_runner build --delete-conflicting-outputs
api:
	cd local_plugins/store/basic_google; dart run build_runner build --delete-conflicting-outputs

# Build BUNDLE-release versions
andr-go-bun-r:
	$(call merge-google)
	flutter build appbundle --flavor=google --release --obfuscate --split-debug-info=/.debug/obfuscate_info
andr-hu-bun-r:
	$(call merge-huawei)
	flutter build appbundle --flavor=huawei --release --obfuscate --split-debug-info=/.debug/obfuscate_info
andr-ru-bun-r:
	$(call merge-rustore)
	flutter build appbundle --flavor=rustore --release --obfuscate --split-debug-info=/.debug/obfuscate_info

# Build APK-release versions
andr-go-apk-r:
	$(call merge-google)
	flutter build apk --flavor=google --release --obfuscate --split-debug-info=/.debug/obfuscate_info
andr-hu-apk-r:
	$(call merge-huawei)
	flutter build apk --flavor=huawei --release --obfuscate --split-debug-info=/.debug/obfuscate_info
andr-ru-apk-r:
	$(call merge-rustore)
	flutter build apk --flavor=rustore --release --obfuscate --split-debug-info=/.debug/obfuscate_info

# Build DEBUG-Apk versions
andr-go-apk:
	$(call merge-google)
	flutter build apk --flavor=google --debug
andr-hu-apk:
	$(call merge-huawei)
	flutter build apk --flavor=huawei --debug
andr-ru-apk:
	$(call merge-rustore)
	flutter build apk --flavor=rustore --debug

define pub-get
	timeout 3
	flutter pub get
endef

merge-go:
	$(call merge-google)
	$(call pub-get)
merge-hu:
	$(call merge-huawei)
	$(call pub-get)
merge-ru:
	$(call merge-rustore)
	$(call pub-get)
merge-wi:
	$(call merge-windows)
	$(call pub-get)

# Upgrage all possible libraries

define upgrade-fun
	flutter pub upgrade --major-versions
	cd local_plugins/data; flutter pub upgrade --major-versions
	cd local_plugins/domain; flutter pub upgrade --major-versions
	cd local_plugins/store/basic_google; flutter pub upgrade --major-versions
	cd local_plugins/store/basic_g_android_auth; flutter pub upgrade --major-versions
	cd local_plugins/store/g_android/pack; flutter pub upgrade --major-versions
	cd local_plugins/store/g_rustore/pack; flutter pub upgrade --major-versions
	cd local_plugins/store/g_windows/pack; flutter pub upgrade --major-versions
	cd local_plugins/store/huawei/pack; flutter pub upgrade --major-versions
endef

upgrade:
	$(call upgrade-fun)
	$(call upgrade-fun)

# Build WINDOWS-release
win-go-r:
	$(call merge-windows)
	flutter pub get
	dart run msix:publish
