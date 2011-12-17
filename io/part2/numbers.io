NumberGame := Object clone
NumberGame init := method(n, trial_count,
        self _n := n
        self _ans := Random value(100) floor()
        self _max_trial := trial_count
        self _trial_count := 0)

NumberGame start := method(
        while(self _trial_count < self _max_trial,
                "Input number: #{self _trial_count + 1} trial" interpolate println
                a := File standardInput readLine() asNumber() floor()
                if(a == self _ans,
                        "Congrats!!" println; return,
                        if (a < self _ans,
                                "Too Few" println,
                                "Too Much" println)
                        self _trial_count = self _trial_count + 1))
        "Not Cleard... the answer is #{self _ans}" interpolate println
)

game := NumberGame clone()
game init(100, 5)
game start()
