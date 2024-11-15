# test_task_manager.rb

require 'minitest/autorun'
require_relative 'task_manager'

class TestTaskManager < Minitest::Test
  def setup
    @manager = TaskManager.new
    @manager.tasks = []
  end

  def test_add_task
    @manager.add_task('Тестова задача', '2025-01-01')
    assert_equal 1, @manager.tasks.size
    assert_equal 'Тестова задача', @manager.tasks.first.description
  end

  def test_delete_task
    @manager.add_task('Задача для видалення', '2025-01-01')
    id = @manager.tasks.first.id
    @manager.delete_task(id)
    assert_equal 0, @manager.tasks.size
  end

  def test_edit_task
    @manager.add_task('Стара задача', '2025-01-01')
    id = @manager.tasks.first.id
    @manager.edit_task(id, 'Нова задача', '2025-02-01')
    assert_equal 'Нова задача', @manager.tasks.first.description
    assert_equal Date.parse('2025-02-01'), @manager.tasks.first.deadline
  end

  def test_mark_completed
    @manager.add_task('Невиконана задача', '2025-01-01')
    id = @manager.tasks.first.id
    @manager.mark_completed(id)
    assert @manager.tasks.first.completed
  end

  def test_filter_tasks
    @manager.add_task('Задача 1', '2025-01-01')
    @manager.add_task('Задача 2', '2025-03-01')
    @manager.mark_completed(@manager.tasks.first.id)

    completed_tasks = @manager.filter_tasks(status: true)
    assert_equal 1, completed_tasks.size
    assert_equal 'Задача 1', completed_tasks.first.description

    date_filtered_tasks = @manager.filter_tasks(before_date: '2025-02-01')
    assert_equal 1, date_filtered_tasks.size
    assert_equal 'Задача 1', date_filtered_tasks.first.description
  end
end
