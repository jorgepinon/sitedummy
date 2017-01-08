class WebsitesController < ApplicationController

  def create
    @website = Website.new(website_params)
    if @website.save
      flash[:success] = "Site published!"
    else
      flash[:error] = "Uh oh. Something didn’t work."
    end
    redirect_to edit_site_path(params[:website][:site_id])
  end

  # PATCH/PUT /websites/1
  def update
    website = Website.find_by(site_id: params[:id])
    if website.blank?
      logger.debug 'no site dude, first time?'
    else
      if website.update(website_params)
        flash[:success] = "Site changes published!"
      else
        # TODO: pass errors to site view
        flash[:error] = "Uh oh. Something didn’t work."
      end
    end
    redirect_to edit_site_path(params[:website][:site_id])
  end


  private
    def website_params
      params.require(:website).permit(:name, :domain, :site_id)
    end
end
