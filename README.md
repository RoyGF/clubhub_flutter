# Readme

Project uses Codemagic for CI/CD.
[![Codemagic build status](https://api.codemagic.io/apps/6632b3daef215b03d3add9f7/6632b3daef215b03d3add9f6/status_badge.svg)](https://codemagic.io/apps/6632b3daef215b03d3add9f7/6632b3daef215b03d3add9f6/latest_build)

In order to run this project you need to do the following steps:

1. Install FVM (Flutter Version Manager)
2. Install Flutter 3.19.6 using FVM
3. Run Build Runner
4. Run App

## Flutter Version Manager

This project is using FVM with flutter 3.19.6.
In order to install fvm you can use the following command:

Mac:

```
dart pub global activate fvm
```

Linux:

```
dart pub global activate fvm
```

Once you have fvm installed on your machine, you need to install flutter 3.19.6 with the following command:

```
fvm install
```

This will install the flutter sdk that is configured on this project. :tada:

### :bulb: Important Note

From now it is super important to do every flutter command using fvm:
`flutter pub get` --> `fvm flutter pub get`
`flutter clean` --> `fvm flutter clean`

## Build Runner

This project uses `json_serializable` package. The generated code is on Github as well but in case they are missing we can run the following command:

```
fvm dart pub run build_runner build --delete-conflicting-otputs
```

## Run project

The project is configured to run from VS Code using fvm, but in case you want to run it from terminal we can do so using the following command:

```
fvm flutter run -d device_identifier
```

### :bulb: Note

It recommended to run these commands as well.

```
fvm flutter clean
fvm flutter pub get
```

Now if everything was set correctly, you should have no issues running this project.
Thank you so much for taking the time to read this. :smile: Happy Coding. :computer:
