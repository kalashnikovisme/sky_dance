# Надо добавить ещё одну фотографию учителя. Добавить фотографию к первому Жанру танца.

photo = Photo.last.photo
Photo.all.each do |p|
  p.photo = photo
  p.save!
end

photo = Genre.order('id').first.photo
Genre.all.each do |g|
  g.photo = photo
  g.save!
end
