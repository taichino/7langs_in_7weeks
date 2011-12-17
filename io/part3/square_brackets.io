squareBrackets := method(
        l := List clone
        call message arguments foreach(arg,
                l append(doMessage(arg))
        )
        return l
)
li1 := [1, 2, 3]
li2 := [1, 2, 3, [10, 20, 30], 4, 5, 6]

li1 println
li2 println

li2 at(3) at(0) println
