# rDolphin

## Please run these commands in the R console to install the package:

1. `install.packages("devtools"))`    #installation of package necessary to install rDolphin from Github
2. `source("https://bioconductor.org/biocLite.R"); biocLite("MassSpecWavelet")`            #installs MassSpecWavelet
3. `devtools::install_github("danielcanueto/rDolphin", build_vignettes = TRUE)`           #installs rDolphin
4. `library(rDolphin)`          #loads rDolphin

If, at some moment, the installation fails, probably the reason is a missing dependency. Please read on the console for "there is no package called" messages, install the package required with `install.packages` and run `devtools::install_github("danielcanueto/rDolphin", build_vignettes = TRUE)` again.


## Introduction to the package:

For a quick look to the capabilitites of the package, examples of sessions of profiling of MTBLS1 and MTBLS242 Metabolights data sets are available on the next links:

MTBLS1: https://www.dropbox.com/s/cpjwnubpd6tdydj/MTBLS1_session.RData?dl=0

MTBLS242: https://www.dropbox.com/s/uyq8a8dpala53fp/MTBLS242_session.RData?dl=0

To load e.g. the MTBLS242 profiling session, run “rDolphin_GUI()” to open the GUI and click on the "Reanudate a saved session" button on the left panel. 


A vignette is available for the use of functions outside the GUI and can be run with this command `browseVignettes("rDolphin")`. An introductory tutorial for the use of rDolphin inside the GUI is available on this link: https://docs.google.com/document/d/12OJHLgs4dbboBQJHUP0YExfIeZQV8l7n4HQmkWZBWwo/edit

## Tab Images of MTBLS1 session:

![alt text](https://cloud.githubusercontent.com/assets/21126465/25331880/df9f75e2-28e4-11e7-8e85-ae117f279d17.png)

![alt text](https://cloud.githubusercontent.com/assets/21126465/25332294/25baf29e-28e6-11e7-8fa5-feeeecfb6493.png)

![alt text](https://cloud.githubusercontent.com/assets/21126465/25331878/df9d5ca8-28e4-11e7-99d4-9bd89e3d8174.png)

![alt text](https://cloud.githubusercontent.com/assets/21126465/25331882/dfa16046-28e4-11e7-87b0-d10e6a7f71e8.png)

![alt text](https://cloud.githubusercontent.com/assets/21126465/25331881/dfa12748-28e4-11e7-9932-d120a31cef72.png)




