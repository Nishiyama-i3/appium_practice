class Menu
  ##操作#（3）My Gardenをタップする
  def my_garden_tap
    my_garden_menu.click
    MyGardenPage.new()
  end

  def plant_list_tap
    plant_list_menu.click
    PlantListPage.new()
  end
  private
  ## UI要素# My gardenのメニュー/他のメニューと同一のresource_idが設定されている
  def my_garden_menu
    package_name = "com.google.samples.apps.sunflower"
    find_elements(id: "#{package_name}:id/design_menu_item_text").first
  end

  def plant_list_menu
    package_name = "com.google.samples.apps.sunflower"
    find_elements(id: "#{package_name}:id/design_menu_item_text")[1]
  end
end