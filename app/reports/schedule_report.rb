class ScheduleReport < Prawn::Document
  Widths = [200, 200, 120]
  Headers = ['Дата добавления', 'Клиент', 'Баланс']

  def row(amount)
    row = [amount]
    make_table([row]) do |t|
      t.column_widths = Widths
      t.cells.style :borders => [:left, :right], :padding => 2
    end
  end

  def to_pdf
    # привязываем шрифты
    font_families.update(
      "Verdana" => {
        :bold => "/home/pavel/prawn_fonts/verdanab.ttf",
        :italic => "/home/pavel/prawn_fonts/verdanai.ttf",
        :normal  => "/home/pavel/prawn_fonts/verdana.ttf" })
    font "Verdana", :size => 10
    text "Отчет за #{Time.zone.now.strftime('%b %Y')}", :size => 15, :style => :bold, :align => :center
    move_down(18)
    # выборка записей
    @schedule = Lesson.all
    data = []
    items = @schedule.each do |item|
      data << row(item.group.genre.title)
    end

    head = make_table([Headers], :column_widths => Widths)
    table([[head], *(data.map{|d| [d]})], :header => true, :row_colors => %w[cccccc ffffff]) do
      row(0).style :background_color => '000000', :text_color => 'ffffff'
      cells.style :borders => []
    end
    # добавим время создания внизу страницы
    creation_date = Time.zone.now.strftime("Отчет сгенерирован %e %b %Y в %H:%M")
    go_to_page(page_count)
    move_down(710)
    text creation_date, :align => :right, :style => :italic, :size => 9
    render
  end
end
