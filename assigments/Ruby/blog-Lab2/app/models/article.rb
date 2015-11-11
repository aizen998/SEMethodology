class Article < ActiveRecord::Base
	validates :titke, presence: true,
                    length: { minimum: 5 }
end
