module ApiResponseConcern
  extend ActiveSupport::Concern

    def render_resource_response(resource)
      if resource.save
        head :ok
      else
        render json: { errors: resource.errors.messages }, status: :unprocessable_entity
      end
    end
end
