# device_info_app

A new Flutter project.

## Getting Started

This project views your device model and operating system version.

## Widgets used in HomePage:

  - Scaffold
      - AppBar to view page title
      - body
          - Column to put widgets vertically
              - Check platform type, then: InfoDisplayWidget to view device model and os version
              - if data is not valid yet, a CircularProgressIndicator will show up

## Note that:
  - getDeviceInfo function is created to get device info based on platform type
  - This function is called in initState to get these info when the page starts
