
class ArchivesSpaceService < Sinatra::Base

  Endpoint.delete('/')
    .description("Delete EVERYTHING")
    .permissions([:administer_system])
    .returns([200, :deleted]) \
  do
    url = Solr.solr_url + "/update"
    req = Net::HTTP::Post.new(url.request_uri)
    req['Content-type'] = 'text/xml'
    req.body = "<delete><query>*:*</query></delete>"
    req['X-ArchivesSpace-Session'] = env["HTTP_X_ARCHIVESSPACE_SESSION"]

    Net::HTTP.start(url.host, url.port) do |http|
      response = http.request(req)
      raise "error deleting index" unless response.code =~ /200/
    end

    DB.open do |db|
      100.times do
        db.tables.each do |table|
          next if table == :schema_info
          begin
            db.drop_table(table)
          rescue
          end
        end
      end

      db << "UPDATE schema_info SET version = 0"
      
      DBMigrator.setup_database(db)

      ArchivesSpaceService.set_up_base_permissions
      ArchivesSpaceService.create_search_user
      ArchivesSpaceService.create_public_user
      ArchivesSpaceService.create_staff_user
    end
  end
end
