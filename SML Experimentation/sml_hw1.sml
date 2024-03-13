(* 
###################################################################################
Your name:

I affirm that I have not violated the
Academic Integrity policies detailed in the syllabus
###################################################################################
*)

(* SML comments appear like this *)

(* #1 - pow *)
fun pow (a, b) = 
if b = 0 then 1 
else a*pow(a, b-1);


(* #2 - sumTo *)
fun sumTo (x:int) = 
if x = 0 then real(x)
else (1.0/real(x))+sumTo(x-1);
               
               
(* #3 - repeat *)
fun repeat (s, n) = 
if n = 0 then ""
else s ^ repeat(s, n-1);


(* #4 - binary *)
fun binary x = 0;


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
