class ScheduleReport < Prawn::Document
  def font_style
    font_families.update(
      "Verdana" => {
        bold: "#{Rails.root}/public/assets/verdana-bold.ttf",
        italic:"#{Rails.root}/public/assets/verdana-italic.ttf",
        normal: "#{Rails.root}/public/assets/verdana.ttf"
        })
  end

  def header
    font "Verdana", size: 10
    text I18n.t("reports.head"), size: 22, style: :bold, align: :center
    move_down 18
  end

  def every_day(group)
    week_row = Lesson.day.values.each do |day|
      group.lesson_time(day)
    end
    week_row + ["#{group.price} #{I18n.t('rub')}", "#{group.once_price} #{I18n.t('rub')}"]
  end

  def group_row(group)
    image group.teacher.decorate.first_photo_thumb, width: 25
    move_down 5
    font_size 16
    text "#{group.teacher.decorate.fio} - #{group.category.describe}"
    move_down 10
    font_size 10
    @data = [I18n.t('date.abbr_day_names')[1..6] <<
            I18n.t('date.abbr_day_names')[0] <<
            I18n.t('reports.course_price') <<
            I18n.t('reports.single_price')]
    font_size 12
    @data << every_day(group)
  end

  def genre_table(genre)
    font_size 20
    image genre.photo.thumb, width: 35
    move_down 5
    text genre.title
    move_down 20
    genre.groups.decorate.map do |group|
      group_row group
      table @data, width: 500
    end
  end

  def to_pdf
    font_style
    header
    @genres = Genre.all
    @data = []

    @genres.each do |genre|
      genre_table genre
    end

    creation_date = Time.zone.now.strftime(I18n.t('report.actual_for'))
    go_to_page page_count
    move_down 710
    text creation_date, align: :right, style: :italic, size: 9
    render
  end
end
