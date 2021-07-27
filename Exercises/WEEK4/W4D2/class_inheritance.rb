class Employee
    attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        if self.boss != nil
            boss.assigned_employees << self
        end
    end

    def boss=(newBoss)
        self.boss = newBoss
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
            if !employee.assigned_employees.empty?
                employee.assigned_employees.each do |subEmployee|
                    total_salary += subemployee.salary
                end
            else
            total_salary += employee.salary
            end
        end
        bonus = total_salary * multiplier
    end
end