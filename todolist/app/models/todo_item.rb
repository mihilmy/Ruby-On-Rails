class TodoItem < ActiveRecord::Base
    belongs_to :todo_list
    default_scope  { order "due_date asc"}
    
    def self.get_count
        TodoItem.where(completed: true).count
    end
end
