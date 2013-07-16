class ScheduleReport < Prawn::Document
  def to_pdf
    font_families.update(
      "Verdana" => {
        :bold => "/home/pavel/prawn_fonts/verdanab.ttf",
        :italic => "/home/pavel/prawn_fonts/verdanai.ttf",
        :normal  => "/home/pavel/prawn_fonts/verdana.ttf" })
    font "Verdana", :size => 10
    text "Расписание школы танцев Sky Dance", size: 22, style: :bold, align: :center
    move_down(18)
    @genres = Genre.all
    data = []

    @genres.each do |genre|
      font_size 20
      image genre.photo.thumb, width: 35
      move_down 5
      text genre.title
      move_down 20
      genre.groups.decorate.map do |group|
        image group.teacher.decorate.first_photo_thumb, width: 25
        move_down 5
        font_size 16
        text "#{group.teacher.decorate.fio} - #{group.category.describe}"
        move_down 10
        font_size 10
        data << ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс", "Цена за курс", "за одно занятие"]
        font_size 12
        data << [group.lesson_time(:monday),
                 group.lesson_time(:tuesday),
                 group.lesson_time(:wednesday),
                 group.lesson_time(:thursday),
                 group.lesson_time(:friday),
                 group.lesson_time(:saturday),
                 group.lesson_time(:sunday),
                 "#{group.price} руб.",
                 "#{group.once_price} руб."]
      end
      table data, width: 500
    end

    creation_date = Time.zone.now.strftime("Расписание актуально на  %e %b %Y в %H:%M")
    go_to_page(page_count)
    move_down(710)
    text creation_date, :align => :right, :style => :italic, :size => 9
    render
  end
end
