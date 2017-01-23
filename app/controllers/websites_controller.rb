class WebsitesController < ApplicationController



  private
    def website_params
      params.require(:website).permit(:name, :domain, :site_id)
    end
end
