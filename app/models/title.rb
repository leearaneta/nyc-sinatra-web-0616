class Title < ActiveRecord::Base
  has_many :figure_titles
  has_many :figures, through: :figure_titles
end

# params = {tv_shows{name => whatever, genre_ids => [1, 2, 3]}}
#
# TvShow.create(params[tv_shows])
# TvShow.create(name: whatever, genre_ids: [1, 2, 3])
# TvShow.create(name: whatever, genre_id: 1)
# TvShow.create(name: whatever, genre_id: scary)
