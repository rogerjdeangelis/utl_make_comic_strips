Creating comic strips. Hand drawn graphs

see
https://matplotlib.org/xkcd/examples/showcase/xkcd.html

see
https://www.dropbox.com/s/e011t9ibh81tnam/simple1.png?dl=0


HAVE  (this plot is a poor redition of the link above)

   )
   (
 H )  :-) :-) :-) :-) :-)
 E (                     )
 A )  THE DAY I REALIZED  (
 L (  I COULD COOK BACON   (
 T )                        )
 H (                         (
   )                          (
   (                           )
   )                            (
   (                             (
   )                              )
   (                               (
   )^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v
             TIME


WANT (Comic strip like plot)
============================


   FOR GALLERY OF EXAMPLES

   https://goo.gl/JkAzZd

   https://www.google.com/search?q=PYTHON+XKCD+GALLERY&tbm=isch&tbo=
   u&source=univ&sa=X&ved=0ahUKEwjp8KG7hMrUAhVk7oMKHfY7Dy4Q7AkIYw&biw=1352&bih=812


*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;

%utl_submit_py64('
from matplotlib import pyplot as plt;
import numpy as np;
plt.xkcd();
fig = plt.figure();
ax = fig.add_subplot(1, 1, 1);
ax.spines["right"].set_color("none");
ax.spines["top"].set_color("none") ;
plt.xticks([]);
plt.yticks([]);
ax.set_ylim([-30, 10]);
data = np.ones(100);
data[70:] -= np.arange(30);
plt.annotate(
    "THE DAY I REALIZED\nI COULD COOK BACON\nWHENEVER I WANTED",
    xy=(70, 1), arrowprops=dict(arrowstyle="->"), xytext=(15, -10));
plt.plot(data);
plt.xlabel("time");
plt.ylabel("my overall health");
fig.savefig("d:/png/simple1.png");
');



%macro utl_submit_py64(pgm)/des="Semi colon separated set of py commands";
  * write the program to a temporary file;
  filename py_pgm "%sysfunc(pathname(work))/py_pgm.py" lrecl=32766 recfm=v;
  data _null_;
    length pgm  $32755 cmd $1024;
    file py_pgm ;
    pgm=&pgm;
    semi=countc(pgm,';');
      do idx=1 to semi;
        cmd=cats(scan(pgm,idx,';'));
        if cmd=:'. ' then
           cmd=trim(substr(cmd,2));
           put cmd $char384.;
           putlog cmd $char384.;
      end;
  run;

  run;quit;
  %let _loc=%sysfunc(pathname(py_pgm));
  %put &_loc;
  filename rut pipe  "C:\Python27/python.exe &_loc";
  data _null_;
    file print;
    infile rut;
    input;
    put _infile_;
  run;
  filename rut clear;
  filename py_pgm clear;
%mend utl_submit_py64;


