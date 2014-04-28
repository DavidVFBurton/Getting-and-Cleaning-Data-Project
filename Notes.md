Please note:
===

Some comment errors were found in the code.
---

In the following code segment, the comments are out of date:

```{r}
## Data Locations

## These are the absolute paths to the data files.

  TraningFiles <- "train/"
  TestingFiles <- "test/"


## Let's load some libraries and set our working path to the script location.
## Remember, this is all relative to my hard drive

  library(sqldf)
```

I used to have absolute paths to the data, but I changed them to relative for deployment.

I also had the working directory hard coded in the program but had sense removed it.

That is why the comments in the above code segment do not make sense.

Problems with the REPO
---

I unfortunately exploded my REPO and had to delete and re-post my files, Everything should be fine now.
I do not want to make any corrections to the comments above as I fear exploding my REPO again.

and that would just be bad.
