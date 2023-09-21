(* Catenable strings *)

structure CString :> CSTRING = struct

datatype t = S of string | L of t list

val fromString = S

val $ = S

val op & = fn (a,b) => L[a,b]

val empty = L []

fun concat ts = L ts

fun concatWith s ts =
    let fun interl nil = nil
          | interl (xs as [_]) = xs
          | interl (x :: xs) = x :: S s :: interl xs
    in L (interl ts)
    end

fun toString t =
    let fun loop (S s,a) = s::a
          | loop (L(t::ts),a) = loop(t,loop(L ts,a))
          | loop (L nil,a) = a
    in String.concat(loop(t,nil))
    end

fun map f s = (fromString o CharVector.map f o toString) s

fun translate f s = (fromString o String.translate f o toString) s

fun foldl f n s = (CharVector.foldl f n o toString) s

fun foldr f n s = (CharVector.foldr f n o toString) s

fun explode s = String.explode (toString s)

fun implode xs = fromString(String.implode xs)
end
