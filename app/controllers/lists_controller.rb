class ListsController < ApplicationController
  # listはデータベースを使うところ、つまりモデルを扱うコントローラ。モデルを扱うコントローラは、アクション名が定められている。（省略記法を使うため）
  # アクションはルーティングによる指定されるときの名前、メソッドはそのコントロールクラスのアクションに実装されたコード。
  def new #アクション
    #Viewへ渡すためのインスタンス変数にからのModelオブジェクトを生成する。
    @list = List.new #メソッド newメソッドは、データの新規作成フォームを表示する。
  end

  def create
    #1.&2. データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    #3. データをデータベースに保存するためのsaveメソッド実行
    if @list.save
    #4. トップ画面へリダイレクトするためのコード
      redirect_to list_path(@list.id)
    else
      render :new #'new' :new 記述法はどちらでも
      # render: アクション名 同じコントローラ内の別アクションのViewを表示できます。
      # エラーメッセージを扱う際はrender（エラー文をページに追加するだけ）、それ以外はredirect_toを使う。redirectはインスタンス変数が再度実行され、エラーメッセージが上書きされてしまうから。
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])  
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id]) #データ（レコード）を1件取得
    list.destroy #データを削除
    redirect_to '/lists'
  end
  
  
  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
