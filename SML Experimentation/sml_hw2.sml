(* 
###################################################################################
Your name: Shane Menzigian

I affirm that I have not violated the
Academic Integrity policies detailed in the syllabus
###################################################################################
*)

(* #1 - quicksort *)
fun quicksort [] = []
  | quicksort [x] = [x]
  | quicksort (pivot::xs) =
  (*Base Case - Empty list or one item list, which returns nil and the list respectively.
    Recusive Cases - The list is split into the head and the tail. The head is the pivot. The first item in the rest
                    of the list is compared to the pivot. If it is less than the pivot, it is added to a list which
                    will be concatonated before the pivot. If it is greater, it goes to the "after" list.
    *)
    let
      fun partition ([], less, greater) = (less, greater)
        | partition (y::ys, less, greater) =
          if y < pivot then partition (ys, y::less, greater)
          else partition (ys, less, y::greater);
      val (less, greater) = partition (xs, [], [])
    in
      quicksort less @ [pivot] @ quicksort greater
    end;


(* #2 - member *)

fun isMember (_, nil) = false
  | isMember (x, y::ys) =
    (*
    Base Case - Nil, which returns false, or if the target is equal to the head of the list, which returns true.
    Recursive Case - If the target does not match the head, call the function with the target and the tail.
    *)
    if x = y then
      true
    else
      isMember (x, ys);
               
               
(* #3 - returns the union of sets (lists) s1 and s2*)
(* You may assume that s1 and s2 do not have any duplicate elements *)
fun union ([], set2) = set2
(*
Base Case - Either list is nil, which returns the non-nil list.
Recursive Case - Check the head of the first list. If it's in the second list, concat it to the function of the first tail and the second list.
*)
  | union (set1, []) = set1
  | union (x::xs, set2) =
    if isMember(x, set2) then
      union (xs, set2)
    else
      x :: union (xs, set2); 


(* #4 - returns the intersection of sets (lists) s1 and s2 *)
(* You may assume that s1 and s2 do not have any duplicate elements *)
fun intersection ([], _) = []
(*
Base Case - Either list is nil, which returns nil.
Recursive Case - If the head of the first list is not in the second list, add it to the result of the 
                function with the first tail and the second list.
                If it is in the second list, call the function with the first tail and the second list.
*)
  | intersection (_, []) = []
  | intersection (set1 as x::xs, set2) =
    if isMember(x, set2) then
      x :: intersection (xs, set2)
    else
      intersection (xs, set2);

(* #5 - Return list of integers from start (inclusive) to stop (exclusive) by step *)

fun range (start, stop, step) =
(*
Base Case - Start is greater than stop, which returns the list.
Recursive Case - Add step to start, then make that the head of a list. the next term is range, but step is added to start.
*)
    if start >= stop then
        []
    else if start + step >= stop then
        [start]
    else
        start :: range(start + step, stop, step);

(* #6 - Return a slice of a list between indices start inclusive, and stop exclusive. Assume first element of list is at index 0*)
fun nthElement ([], _) = nil
(*
Base Case - index is nil, which returns nil, or the list is one member and index is 0, which returns the head.
Recursive Case - If n isn't 0, call nthelement with the tail and n-1.
*)
  | nthElement (x::_, 0) = x
  | nthElement (_::xs, n) = nthElement(xs, n - 1);

fun slice (lst, start, endPos) =
    let
        fun take (0, _) = []
        (*
        Base Case - If step is 0 or if the list is empty, return an empty list.
        Recursive Case - Since we're adding, take the head and call the function with the tail of the list and the
        number of items to add reduced by 1.
        *)
          | take (_, []) = []
          | take (n, x::rest) = x :: take(n - 1, rest);
          
        fun drop (0, lst) = lst
        (*
        Base Case - If step is 0 or if the list is empty, return an empty list.
        Recursive Case - Since we're adding, take the head and call the function with the tail of the list and the
        number of items to remove reduced by 1.
        *)
          | drop (_, []) = []
          | drop (n, _::rest) = drop(n - 1, rest);
          
        val droppedList = drop (start, lst);
    in
        take (endPos - start, droppedList)
    end;

(* #7 - binary search *)
fun mid [] = (0)
(*
Helpher function, non-recursive.
*)
  | mid lst =
    let
      val len = length lst;
      val midIndex = len div 2;
      val midValue = nthElement (lst, midIndex-1);
    in
      (midValue)
    end;

fun binarySearch (lst, target) =
    (*
    Base Case - If the first item is greater than the last item, return false. Otherwise, if the middle value = the target, return true.
    Recursive Case - If the target is greater than the middle, call binary search with the front half of the list. Otherwise, call the back half.
    *)
    let
        fun search (first, last) =
            if (first > last) then false
            else
                let
                    val midIndex = (first + last) div 2;
                    val midValue = nthElement(lst, midIndex);
                in
                    if (midValue = target) then
                        true
                    else if (midValue < target) then search (midIndex + 1, last)
                    else search (first, midIndex - 1)
                end;
    in
        search (0, length lst - 1)
    end;



    