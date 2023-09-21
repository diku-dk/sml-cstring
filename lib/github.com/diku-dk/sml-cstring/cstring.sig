(** Catenable strings, with constant time string catenation. *)

signature CSTRING = sig
  type t
  val fromString : string -> t
  val $          : string -> t
  val &          : t * t -> t
  val empty      : t
  val concat     : t list -> t
  val concatWith : string -> t list -> t
  val map        : (char -> char) -> t -> t
  val translate  : (char -> string) -> t -> t
  val foldl      : (char * 'a -> 'a) -> 'a -> t -> 'a
  val foldr      : (char * 'a -> 'a) -> 'a -> t -> 'a
  val implode    : char list -> t
  val explode    : t -> char list
  val toString   : t -> string
end

(**

[type t] The type of catenable strings.

[fromString s] returns the catenable string represented by s.

[$ s] equals fromString s.

[s1 & s2] returns the catenable string resulting from catenating s1
and s2. This operation has O(1) complexity.

[empty] is the empty catenable string.

[concat ts] returns the catenable string resulting from catenating the
catenable strings in ts (in order).

[concatWith s ts] returns the catenable string resulting from catenating the
catenable strings in ts (in order) with the string s as deliminator.

[map f s] equals to (fromString o CharVector.map f o toString) s.

[translate f s] equals to (fromString o String.translate f o toString) s.

[foldl f n s] equals to (CharVector.foldl f n o toString) s.

[foldr f n s] equals to (CharVector.foldl f n o toString) s.

[implode s] equals fromString (String.implode s).

[explode s] equals String.explode (toString s).

[toString s] returns a string representing the catenable string s.

*)
