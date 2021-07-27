class Employee
    attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus = self.salary * multiplier
        bonus 
    end
    
end

class Manager < Employee

    attr_reader :assigned_employees
    def initialize(name, title, salary, boss)
        super
        @assigned_employees = []
    end
    
    def bonus(multiplier)
        total_salary = 0
        assigned_employees.each do |employee|
            total_salary += employee.salary 
        end
        bonus = total_salary * multiplier
    end
end