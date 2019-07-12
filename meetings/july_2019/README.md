# July 2019: Reproducible Data Workflows with drake

## Presenter: [Garrick Aden-Buie](mailto:Garrick.Aden-Buie@moffitt.org)

### Meeting location
Date/time: Friday, July 19th @ 2pm

Location: [Moffitt Stabile Research Building (SRB)](https://goo.gl/maps/o6j3rtTuxCB2), David Murphey Conference Room (1st floor)

### Meeting details

**drake** is an R package that provides a powerful, flexible workflow management tool for reproducible data anaylsis pipelines. **drake** alleviates the pain of managing large (and even small) data analyses, speeding up iteration and development while providing reproducibility guarantees that are essential for modern research.

<https://ropensci.github.io/drake/>

In this session, we'll learn how to use **drake** to manage a data analysis workflow by writing functions that define the steps of the analysis. We'll then learn how **drake** can keep track of all of these steps, from start to finish, and intelligently update only the outdated steps when your data or code change.

We'll work through a few examples together, so please bring a laptop with the **drake** and **visNetwork** packages installed.  (If you don't have a laptop you can share with someone who does at the session.) You would also benefit from installing the **tidyverse** package for the session.

```r
# drake and dependencies
install.packages(c("drake", "visNetwork"))

# Install the tidyverse (if not currently installed)
# install.packages("tidyverse")
```

Note: if you've used **drake** before, please ensure that you have version `7.0.0` or later installed.