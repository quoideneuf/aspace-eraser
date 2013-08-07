class EraseDatabaseController < ApplicationController

  skip_before_filter :unauthorised_access

  def index

    uri = URI("#{JSONModel::HTTP.backend_url}/")
    req = Net::HTTP::Delete.new(uri.request_uri)

    MemoryLeak::Resources.invalidate_all!

    JSONModel::HTTP.do_http_request(uri, req)    

    redirect_to({:controller => :welcome, :action => :index}, :flash => {:success => I18n.t("plugins.erase_database.success")})
  end
end
