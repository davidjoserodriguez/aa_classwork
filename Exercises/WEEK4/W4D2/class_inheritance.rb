require "byebug"
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
        # newBoss.assigned_employees = self.assigned_employees
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
        queue = [self]
        until queue.empty?
            # debugger
            # p total_salary
            el = queue.shift
            if el != self
                total_salary += el.salary
            end
            if el.is_a?(Manager)
                el.assigned_employees.each do |employee|
                    queue << employee
                # total_salary += el.salar
                end
            end
        end

        return total_salary * multiplier
    end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
david = Employee.new("David", "TA", 10000, darren)
shawna = Employee.new("Shawna", "TA", 12000, darren)
p ned.bonus(5)