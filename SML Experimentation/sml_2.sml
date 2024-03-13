(* 
###################################################################################
Your name: Shane Menzigian

I affirm that I have not violated the
Academic Integrity policies detailed in the syllabus
###################################################################################
*)

(* SML comments appear like this *)

(* #1 - pow *)
fun pow (a, b) = 
if b = 0 then 1 
else if b = 1 then a 
else pow(a*a, b-1);


(* #2 - sumTo *)
fun sumTo (x:int) =
val sumTo = fn : int -> real;  
if x = 0 then real(x)
else (1.0/real(x))+sumTo(x-1);
               
               
(* #3 - repeat *)
fun repeat (s, n) = 
if n = 0 then ""
else s ^ repeat(s, n-1);


(* #4 - binary *)
fun binary x = 
val binary = fn : int -> string;
if x div 2 = 0 then toString(x mod 2)
else binary (x div 2) ^ toString(x mod 2);

fun toString(x) =
int.toString(x)



(* #5 - countNegative *)
fun countNegative x = ~1;


(* #6 - absList *)
fun absList x = [];


(* #7 - split *)
fun split x = [];


(* #8 - isSorted *)
fun isSorted x = false;

 
(* #9 - collapse *) 
fun collapse x = [];

        
(* #10 - insert *)        
fun insert (n, x) = [];

(* #11 - decimal *)
fun decimal (s:string) = 0;
