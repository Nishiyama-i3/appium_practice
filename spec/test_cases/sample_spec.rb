require 'spec_helper'
RSpec.describe "page transition" do
  
  it "メニューを開いてMy gardenをタップしたらトップページが表示される" do |example|
    #操作(Plantリストページを開きMyGardenページに戻ってくる)
    my_garden_page = MyGardenPage.new().go_to_menu.my_garden_tap
    #期待するもの(メインページが表示される)
    expect(my_garden_page.displayed?).to be true
    example.metadata[:screenshots] = []
    example.metadata[:screenshots] << {
      caption: 'mygardenpage',
      path: '../../MyGardenPage.png'
    }
  end

  example 'メニューを開いてplant listをタップしたらplant listが表示される' do |example|
    plant_list_page = MyGardenPage.new().go_to_menu.plant_list_tap
    #期待するもの(メインページが表示される)
    expect(plant_list_page.displayed?).to be true
    example.metadata[:screenshots] = []
    example.metadata[:screenshots] << {
      caption: 'plantlistpage',
      path: '../../PlantListPage.png'
    }
  end

  example 'メニューを開いてplant listをタップしたらplant listが表示され、植物をタップするとその詳細が見れる' do |example|
    plant_details_page = PlantListPage.new().go_to_plant_details
    #期待するもの(メインページが表示される)
    expect(plant_details_page.displayed?).to be true
    plant_details_page.back_to_plant_list
    example.metadata[:screenshots] = []
    example.metadata[:screenshots] << {
      caption: 'plantdetailspage',
      path: '../../PlantDetailsPage.png'
    }
  end

  example '植物詳細画面から植物を追加できる' do |example|
    plant_details_page = PlantListPage.new().go_to_plant_details
    #期待するもの(メインページが表示される)
    plant_details_page.add_button_tap
    my_garden_page = plant_details_page.back_to_plant_list.back_to_mygarden
    expect(my_garden_page.plant_added?).to be true
    example.metadata[:screenshots] = []
    example.metadata[:screenshots] << {
      caption: 'plantimage',
      path: '../../PlantImage.png'
    }
  end
end
