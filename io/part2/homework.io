# フィボナッチ
fib := method(n,
       if(n==0, 0,
       if(n==1, 1,
          fib(n-2) + fib(n-1)
       )))
for(i, 1, 10, fib(i) println)

# 除算のオーバーライド
(10/0) println # => inf
orig_div := Number getSlot("/")
Number / = method(n, if(n==0, 0, self orig_div(n)))
(10/0) println # => 0

# 2次元配列の総和
sum := method(li,
        result := 0
        for(i, 0, li size - 1,
            inner := li at(i)
            for (j, 0, inner size - 1,
                result = result + inner at(j)))
        return result)

l := list(list(1,2,3,4,5), list(1,1,1,1,1))
sum(l) println

# myAverage
List myAverage := method(nil,
        if(self size == 0, return 0, nil)
        total := 0
        for(i, 0, self size - 1,
                val := self at(i)
                if (val type == "Number", nil,
                        Exception raise("non number object"))
                total = total + val)
        return total / self size)

list(1,2,3,4) myAverage println
list() myAverage println
e := try(
        list("a", 10, 15) myAverage println
     )
     e catch(Exception,
        "exc!" println)

# Matrix
Matrix := Object clone

Matrix dim := method(x, y,
        self _data := List clone
        for(i, 0, y - 1,
                row := List clone
                row setSize(x)
                self _data append(row)
        )
)

Matrix set := method(x, y, value,
        self _data at(x) atPut(y, value)
)

Matrix get := method(x, y,
        return self _data at(x) at(y))

Matrix trans := method(
        x := self _data size
        y := self _data at(0) size
        ret := Matrix clone
        ret dim(y, x)
        for(i, 0, x-1,
                for (j, 0, y-1,
                        ret set(j, i, self get(i, j))))
        return ret
)

Matrix toFile := method(filename,
        csv := File openForUpdating(filename)
        x := self _data size
        y := self _data at(0) size
        for(i, 0, x-1,
                line := self _data at(i) join(",")
                csv write(line)
                csv write("\n")
        )
        csv close()
)

Matrix fromFile := method(filename,
        csv := File openForReading(filename)
        lines := csv readLines
        csv close()
        x := lines at(0) split(",") size
        y := lines size
        ret := Matrix clone
        ret dim(x, y)
        lines foreach(i, line,
                items := line split(",")
                items foreach(j, val,
                        ret set(i, j, val)))
        return ret
)

matrix := Matrix clone
matrix dim(2, 2)
matrix set(0, 0, 1)
matrix set(1, 0, 2)
matrix set(0, 1, 3)
matrix set(1, 1, 4)
matrix get(0, 0) println
matrix get(1, 0) println
matrix get(0, 1) println
matrix get(1, 1) println
new_matrix := matrix trans()
new_matrix get(0, 0) println
new_matrix get(1, 0) println
new_matrix get(0, 1) println
new_matrix get(1, 1) println

new_matrix toFile("mat.csv")

"from file test" println
from_file := Matrix fromFile("mat.csv")
from_file get(0, 0) println
from_file get(1, 0) println
from_file get(0, 1) println
from_file get(1, 1) println

