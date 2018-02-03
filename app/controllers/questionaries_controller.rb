class QuestionariesController < ApplicationController
  before_action :set_questionary, only: [:show, :edit, :update, :destroy, :sendform]
  # layout 'questionaries'

  # GET /questionaries
  # GET /questionaries.json
  def index
    @questionaries = Questionary.all.order('created_at desc')
  end

  # GET /questionaries/1
  # GET /questionaries/1.json
  def show
  end

  def sendform
    #id = params[:id]
    #questionary.id

    #@questionary_item.id.countをparamsで渡す？
     @items = Questionary.find(params[:id]) #質問項目のオブジェクトが取得可能
     @choices = @items.questionary_item # 質問項目が持っている、回答選択肢のすべてのオブジェクトを取得
    for i in @choices.count #回答選択肢のすべてのオブジェクトの数の分だけ、ループを回す
    
    result ='question_id:' + id
    #for i in @questionary_item.questionary_id.count
    #for i in 1..100
      str = 'r' + i.to_s
      if params[str] == nil then
        result += ',' + str + ':0'
      else
        result += ',' + str + ':' + params[str]
        #params[str]=r+count.itemsのvalue
      end
    end

    

    comment = params[:comment]



    obj = QuestionaryResult.new
    obj.questionary_id = id
    obj.result = result
    obj.comment = comment
    obj.save!
    redirect_to '/questionary_results/calc/' +@questionary.id.to_s
    
     
  end

  # GET /questionaries/new
  def new
    @questionary = Questionary.new
  end

  # GET /questionaries/1/edit
  def edit
  end

  # POST /questionaries
  # POST /questionaries.json
  def create
    @questionary = Questionary.new(questionary_params)

    respond_to do |format|
      if @questionary.save
        format.html { redirect_to '/questionary_items/new/' + @questionary.id.to_s }
        format.json { render :show, status: :created, location: @questionary }
      else
        format.html { render :new }
        format.json { render json: @questionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionaries/1
  # PATCH/PUT /questionaries/1.json
  def update
    respond_to do |format|
      if @questionary.update(questionary_params)
        format.html { redirect_to @questionary, notice: 'Questionary was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionary }
      else
        format.html { render :edit }
        format.json { render json: @questionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionaries/1
  # DELETE /questionaries/1.json
  def destroy
    @questionary.destroy
    respond_to do |format|
      format.html { redirect_to questionaries_url, notice: 'Questionary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionary
      @questionary = Questionary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionary_params
      params.require(:questionary).permit(:title, :description, :deadline)
    end
end
