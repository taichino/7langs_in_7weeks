curlyBrackets := method(
        r := Map clone
        call message arguments foreach(arg,
                prop := arg asString split(":")
                r atPut(prop at(0) strip, prop at(1) strip)
        )
        return r
)

Builder := Object clone

Builder currentIndent := method(
        indent := self getSlot("indent")
        if (indent == nil,
                self indent := 0
                indent := 0)
        indent_text := ""
        for (i, 0, indent - 1, 1,
                indent_text = indent_text .. "    ")
        return indent_text
)

Builder incr := method(
        self indent = self indent + 1
)

Builder decr := method(
        self indent = self indent - 1
)

Builder forward := method(
        write(self currentIndent, "<", call message name)
        if(call message arguments size > 0,
                props := call message arguments at(0)
                if(props name == "curlyBrackets",
                        props := doMessage(props)
                        if(props type == "Map",
                                props keys foreach(key,
                                        write(" #{key}=#{props at(key)}" interpolate)
                                )
                        )
                )
        )
        writeln(">")
        self incr
        call message arguments foreach(arg,
                content := self doMessage(arg)
                if(content type == "Sequence", writeln(self currentIndent, content)))
        self decr
        writeln(self currentIndent, "</", call message name, ">"))

Builder ul({"title":"Programing Languages"},
        li({"author":"Steve Dekorte"}, "Io"),
        li("Lua"),
        li("Javascript")
        ul(li("Perl"),
           li({"type":"OOP"}, "Ruby"),
           li("Python")
        )
)
