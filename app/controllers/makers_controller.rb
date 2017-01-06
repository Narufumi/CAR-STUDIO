class MakersController < ApplicationController
  def index
    @japan   = Maker.where(country: "日本")
    @germany = Maker.where(country: "ドイツ")
    @america = Maker.where(country: "アメリカ")
    @england = Maker.where(country: "イギリス")
    @italy   = Maker.where(country: "イタリア")
    @france  = Maker.where(country: "フランス")
    @sweden  = Maker.where(country: "スウェーデン")
    @korea   = Maker.where(country: "韓国")
  end
end
