class SnippetsController < ApplicationController
  before_action :set_snippet, only: [:index, :edit, :update, :destroy]

  def search
    @snippets = Snippet.search params[:q], default_operator: 'AND'
    print @snippets.results.first
    #response = Article.search query:     { match:  { title: "Fox Dogs" } },
    #                      highlight: { fields: { title: {} } }
    #respond_to do |format|
    #    format.json { render json: @snippets }
    #end
  end

  # GET /snippets
  # GET /snippets.json
  def index
    @snippet = Snippet.new
    logger.debug @snippet
    logger.debug "New snippet id: #{@snippet.uuid}"
  end

  # GET /snippets/1/edit
  def edit
    render :index
  end

  # POST /snippets
  # POST /snippets.json
  def create
    logger.debug "CREATE"
    @snippet = Snippet.new(snippet_params)

    respond_to do |format|
      if @snippet.save
        format.html { redirect_to @snippet, notice: 'Snippet was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @snippet }
        format.json { render json: @snippet }
      else
        #format.html { render action: 'new' }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snippets/1
  # PATCH/PUT /snippets/1.json
  def update
    logger.debug "UPDATE"
    respond_to do |format|
      if @snippet.update(snippet_params)
        #format.html { redirect_to @snippet, notice: 'Snippet was successfully updated.' }
        format.json { head :no_content }
      else
        #format.html { render action: 'edit' }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snippets/1
  # DELETE /snippets/1.json
  def destroy
    @snippet.destroy
    respond_to do |format|
      format.html { redirect_to snippets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snippet
      @snippet = Snippet.where(uuid: params[:uuid]).first
      @snippets = Snippet.all.order('created_at desc').limit(5)
      logger.debug @snippet
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def snippet_params
      params.require(:snippet).permit(:content, :language, :title)
    end
end
