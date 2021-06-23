class TokenMappingsController < ApplicationController
  before_action :set_token_mapping, only: %i[ show edit update destroy ]

  # GET /token_mappings or /token_mappings.json
  def index
    @token_mappings = TokenMapping.all
  end

  # GET /token_mappings/1 or /token_mappings/1.json
  def show
  end

  # GET /token_mappings/new
  def new
    @token_mapping = TokenMapping.new
  end

  # GET /token_mappings/1/edit
  def edit
  end

  # POST /token_mappings or /token_mappings.json
  def create
    @token_mapping = TokenMapping.new(token_mapping_params)

    respond_to do |format|
      if @token_mapping.save
        format.html { redirect_to @token_mapping, notice: "Token mapping was successfully created." }
        format.json { render :show, status: :created, location: @token_mapping }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @token_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /token_mappings/1 or /token_mappings/1.json
  def update
    respond_to do |format|
      if @token_mapping.update(token_mapping_params)
        format.html { redirect_to @token_mapping, notice: "Token mapping was successfully updated." }
        format.json { render :show, status: :ok, location: @token_mapping }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @token_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /token_mappings/1 or /token_mappings/1.json
  def destroy
    @token_mapping.destroy
    respond_to do |format|
      format.html { redirect_to token_mappings_url, notice: "Token mapping was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_token_mapping
      @token_mapping = TokenMapping.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def token_mapping_params
      params.require(:token_mapping).permit(:match, :token_type, :token_variant, :replace)
    end
end
