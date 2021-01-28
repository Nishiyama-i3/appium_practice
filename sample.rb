# require 'appium_lib'

# capabilities = {
#   automationName: 'uiautomator2',
#   platformName: 'Android',
#   disableWindowAnimation: true,
#   deviceName: 'SO-02J',
#   app: "./app-debug.apk",
#   unicodeKeyboard: true,
#   newCommandTimeout: 300
# }

# opts = {
#   capabilities: {
#     platformName: :android,
#     platformVersion: '8.0',
#     deviceName: 'SO-02J',
#     automationName: 'uiautomator2',
#     app: '/Users/nishiyama/downloads/sunflower-main/app-debug.apk'
#   },
#   path: '/wd/hub',
#   port: 4723
# }
# @driver = Appium::Driver.new({caps: capabilities}, false)

# @driver.start_driver
# # Appium.promote_appium_methods Object
# @driver.find_element(:accessibility_id, "上へ移動").click
# resource_id = "com.google.samples.apps.sunflower:id/design_menu_item_text"
# @driver.find_elements(:id, resource_id).first.click

# @driver.driver_quit

require'appium_lib'
capability = {
  automationName:'uiautomator2',
  platformName:'Android',
  disableWindowAnimation: true,
  deviceName:'Android Emulator',
  app:ENV['APP_PATH'] || "./#{Dir['*.apk'].last}",
  unicodeKeyboard:  true,
  newCommandTimeout: 300,
  avd: "Pixel_3a_API_30_x86"
}
@driver = Appium::Driver.new({caps: capability}, true)
# Android Driverを開始します(古いDriverがあれば破棄されます)
@driver.start_driver
#これを記載することによりdriverを書くのを省略可能です
Appium.promote_appium_methods Object
#（1）指定した:accessibility_idのUI要素をタップします。
#ここでは左上上部にあるUI要素をタップしています。
find_element(:accessibility_id, "Navigate up").click
#（2）指定した:idが設定されている複数のUI要素の中から１番目のUI要素をタップします。
#（1）をタップして表示されたメニューの中から１番目に返ってきたメニューをタップしています。
resource_id = "com.google.samples.apps.sunflower:id/design_menu_item_text"
find_elements(:id, resource_id).first.click
#終了する
@driver.driver_quit