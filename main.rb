# main.rb

require_relative 'task_manager'

manager = TaskManager.new

loop do
  puts "\nВиберіть дію:"
  puts "1. Додати задачу"
  puts "2. Видалити задачу"
  puts "3. Редагувати задачу"
  puts "4. Позначити задачу як виконану"
  puts "5. Показати всі задачі"
  puts "6. Фільтрувати задачі"
  puts "7. Вийти"

  choice = gets.chomp.to_i

  case choice
  when 1
    print "Введіть опис задачі: "
    description = gets.chomp
    print "Введіть дедлайн (YYYY-MM-DD): "
    deadline = gets.chomp
    manager.add_task(description, deadline)
    puts "Задачу додано."
  when 2
    print "Введіть ID задачі для видалення: "
    id = gets.chomp.to_i
    manager.delete_task(id)
    puts "Задачу видалено."
  when 3
    print "Введіть ID задачі для редагування: "
    id = gets.chomp.to_i
    print "Введіть новий опис задачі: "
    description = gets.chomp
    print "Введіть новий дедлайн (YYYY-MM-DD): "
    deadline = gets.chomp
    manager.edit_task(id, description, deadline)
    puts "Задачу відредаговано."
  when 4
    print "Введіть ID задачі, яку виконано: "
    id = gets.chomp.to_i
    manager.mark_completed(id)
    puts "Задачу позначено як виконану."
  when 5
    manager.tasks.each do |task|
      puts "ID: #{task.id}, Опис: #{task.description}, Дедлайн: #{task.deadline}, Виконано: #{task.completed}"
    end
  when 6
    print "Фільтрувати за статусом виконання? (yes/no): "
    status_filter = gets.chomp.downcase
    status = nil
    if status_filter == 'yes'
      print "Введіть статус (true/false): "
      status = gets.chomp == 'true'
    end

    print "Фільтрувати за датою до? (yes/no): "
    before_filter = gets.chomp.downcase
    before_date = nil
    if before_filter == 'yes'
      print "Введіть дату (YYYY-MM-DD): "
      before_date = gets.chomp
    end

    print "Фільтрувати за датою після? (yes/no): "
    after_filter = gets.chomp.downcase
    after_date = nil
    if after_filter == 'yes'
      print "Введіть дату (YYYY-MM-DD): "
      after_date = gets.chomp
    end

    filtered_tasks = manager.filter_tasks(status: status, before_date: before_date, after_date: after_date)
    filtered_tasks.each do |task|
      puts "ID: #{task.id}, Опис: #{task.description}, Дедлайн: #{task.deadline}, Виконано: #{task.completed}"
    end
  when 7
    puts "До побачення!"
    break
  else
    puts "Невірний вибір, спробуйте ще раз."
  end
end
