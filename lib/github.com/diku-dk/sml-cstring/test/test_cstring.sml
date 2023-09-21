fun pr s = print ("CString." ^ s ^ "\n")

fun test s b =
    if b then pr (s ^ ": OK")
    else pr (s ^ ": ERR")

fun itest s expected n =
    if n=expected then pr (s ^ ": OK")
    else pr(s ^ ": ERR - expected " ^ Int.toString expected ^ " but got " ^ Int.toString n)

open CString infix &

val () = print "Testing CString\n"

val a = $ "hi"

val b = $ "there"

val space = $ " "

val () = test "concat" ("hi there" = toString(a & space & b))

val () = test "empty" ("" = toString empty)

val () = test "foldr" ("hithere" = String.concat(List.map str (foldr (op ::) nil (a & b))))

val () = test "foldl" ("hithere" = String.concat(List.map str (rev(foldl (op ::) nil (a & b)))))

val () = test "map" ("HITHERE" = toString(map Char.toUpper (a & b)))

val () = print "End Testing CString\n"
