class Public::SearchesController < ApplicationController

  before_action :authenticate_end_user!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'site'
      @records = Site.search_for(@content, @method)
    else
      render 'index'
    end
  end

  def index
    @tags = Tag.all
  end

  def fieldsearch
    @tags = Tag.all



    # splitで正規表現を使ってキーワードを空白(全角・半角・連続)分割する
    #   連続した空白も除去するので、最後の“+”がポイント
    # @keywords = params[:keywords].split(/[[:blank:]]+/)

    # 検索タイプ取得
    #   AND : AND検索 / OR : OR検索
    # @type = params[:type]

    # 空のモデルオブジェクト作成（何も入っていない空配列のようなもの）
    # @results = Site.none

  #   # タイプ別で検索実行
  #   if @type == 'AND'
  #     # -----------
  #     # AND検索
  #     # -----------
  #     #each_with_index=> eachループで回しつつ、それぞれのデータに番号を振りたいとき
  #     @keywords.each_with_index do |keyword, i|
  #       # 1回目のループでは、1つ目のワードで検索
  #       #   結果を@resultsに詰め込む
  #       @results = Site.search(keyword) if i == 0

    @prefecture = params[:prefecture_id]
    @field_type = params[:field_type_id]

  #       →ここで＆検索を実施
    @results = Site.search(prefecture_id,field_type_id)
  #       # 2回目以降のループでは、1回目の結果を更にモデル定義の検索メソッドで絞り込みしていく
  #       #   結果を@resultsに詰め込む
  #       @results = @results.merge(@results.search(keyword))
  #     end
  #   else
  #     # -----------
  #     # OR検索
  #     # -----------
  #     @keywords.each do |keyword|
  #       # 単純にモデル定義の検索メソッドにデータを渡す。
  #       #   検索ワードの数だけor検索を行う
  #       #   結果を@resultsに詰め込む
  #       @results = @results.or(Site.search(keyword))
  #       →ここで＆検索を実施　@results = Site.or_search(prefecture_id,field_type_id)
  #     end
  #   end

  #   render :index
  # end

end
