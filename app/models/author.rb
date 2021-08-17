class Author < ApplicationRecord

    before_create :slugify

    def slugify
        puzzle = rand(10000...999999)
        self.slug = "#{name.parameterize}-#{puzzle}"
    end

    def get_name
        authors.name
    end
end