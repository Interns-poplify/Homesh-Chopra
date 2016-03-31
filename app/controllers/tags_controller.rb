class TagsController < ApplicationController
	before_action :set_tag, only: [:show, :edit, :update, :destroy]
	def show
  @tag = Tag.find(params[:id])
end
def index
		@tags=Tag.all
	end
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to @tags, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end



end

