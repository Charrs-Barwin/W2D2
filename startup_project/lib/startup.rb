require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name,funding,salaries)
        @name,@funding,@salaries = name,funding,salaries
        @employees = []
    end
    require "byebug"
    def valid_title?(title)
        @salaries.keys.include?(title)
    end

    def >(st)
        @funding > st.funding
    end
    
    def hire(employee_name,title)
        raise_error if !valid_title?(title)
        @employees << Employee.new(employee_name,title)
    end

    def size
        @employees.count
    end

    def pay_employee(em)
        pay = salaries[em.title]
        raise_error if @funding < pay
        em.pay(pay)
        @funding -= pay
    end

    def payday
        @employees.each{|e|pay_employee(e)}
    end


    def average_salary
        @employees.map{|em|salaries[em.title]}.sum / @employees.count.to_f
    end

    def close
        @employees.clear
        @funding = 0
    end

    def acquire(st)
        @funding += st.funding
        st.salaries.each{|title,pay| salaries[title]=pay if ! salaries.has_key?(title)}
        @employees += st.employees
        st.close
    end

end
