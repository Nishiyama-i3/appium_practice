class PlantListPage
  def displayed?
    flag = exists { plant_list_item }
    #このメソッドを呼び出すとMyGardenPage.pngというファイル名の#スクリーンショットが保存されます
    screenshot("#{self.class.name}.png")
    
    flag
  end
  ##操作#（2）plantリストページを開く
  def back_to_mygarden
    back_to_my_garden_button.click
    MyGardenPage.new()
  end

  def go_to_plant_details
    plant_list_item.click
    PlantDetailsPage.new()
  end
  private
  ## UI要素
  def back_to_my_garden_button
    find_element(accessibility_id: "Navigate up")
  end

  def plant_list_item
    find_elements(id: "com.google.samples.apps.sunflower:id/plant_item_image").first
  end
end