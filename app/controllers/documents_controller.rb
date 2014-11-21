class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  def index
    @documents = Document.where(project_id: params[:project_id])
    @project = @documents.first.project
  end

  # GET /documents/1
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
    @project = Project.find(params[:project_id])
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to @document, notice: 'Document was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /documents/1
  def update
    if @document.update(document_params)
      redirect_to @document, notice: 'Document was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /documents/1
  def destroy
    @document.destroy
    redirect_to documents_url, notice: 'Document was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
      @project = @document.project
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      hash = params.require(:document).permit(:project_id, :name, :content)
    end
end
