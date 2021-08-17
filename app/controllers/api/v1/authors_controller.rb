module Api
    module V1
        class AuthorsController < ApplicationController

            protect_from_forgery with: :null_session

            # @get: /api/v1/authors.json
            def index
                authors = Author.all
                render json: AuthorSerializer.new(authors).serialized_json
            end

            # @get: /api/v1/authors/:slug
            def show
                author = Author.find_by(slug: params[:slug])
                render json: AuthorSerializer.new(author).serialized_json
            end

            # @post: /api/v1/authors.json
            def create
                author = Author.new(author_params)
                if author.save
                    render json: AuthorSerializer.new(author).serialized_json
                else
                    render json: { errors: author.errors.message }, status: 208
                end
            end

            # @patch: /api/v1/authors/:slug
            def update
                author = Author.find_by(slug: params[:slug])
                if author.update(author_params)
                    render json: AuthorSerializer.new(author).serialized_json
                else
                    render json: { errors: author.errors.message }, status: 208
                end
            end

            # @delete: /api/v1/authors/:slug
            def destroy
                author = Author.find_by(slug: params[:slug]) # primeiro passo - identificar o fulano
                if author.delete # teste lógico, verificar se funcionou
                    head :no_content
                else # verificar se não funcionou
                    render json: { errors: author.errors.message }, status: 208
                end
            end


            private

            def author_params
                params.require(:author).permit(:name)
            end
        end
    end
end