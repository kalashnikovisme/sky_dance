class ScheduleReport < Prawn::Document
  def to_pdf
    font_families.update(
      "Verdana" => {
        :bold => "/home/pavel/prawn_fonts/verdanab.ttf",
        :italic => "/home/pavel/prawn_fonts/verdanai.ttf",
        :normal  => "/home/pavel/prawn_fonts/verdana.ttf" })
    font "Verdana", :size => 10
    text "Отчет за #{Time.zone.now.strftime('%b %Y')}", :size => 15, :style => :bold, :align => :center
    move_down(18)
    @genres = Genre.all
    data = []

    @genres.each do |genre|
      text genre.title
      genre.groups.decorate.map do |group|
        text "#{group.teacher.decorate.fio} #{group.category.describe}"
        data << ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
        data << [group.lesson_time(:monday),
                 group.lesson_time(:tuesday),
                 group.lesson_time(:wednesday),
                 group.lesson_time(:thursday),
                 group.lesson_time(:friday),
                 group.lesson_time(:saturday),
                 group.lesson_time(:sunday)]
      end
      table data, width: 500
    end

    creation_date = Time.zone.now.strftime("Отчет сгенерирован %e %b %Y в %H:%M")
    go_to_page(page_count)
    move_down(710)
    text creation_date, :align => :right, :style => :italic, :size => 9
    render
  end
end
