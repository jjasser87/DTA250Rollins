#DTA250 - Fall 2023
#JJ

# Layers ----

## Introduction ----
# The ggplot2 package uses a layered approach to creating plots.
# This means that you can add different layers to a plot to create a more
# complex plot.

## Prerequisites ----

#TODO
# load the tidyverse package using the library() function
library(tidyverse)

# Load the mpg dataset using the data() function
data("mpg")

## Aesthetic mappings ----
# The aes() function is used to specify the aesthetic mappings of a plot.
# The aesthetic mappings are the mappings between the variables in the data
# frame and the visual properties of the plot.
# The visual properties of the plot include the x and y coordinates, the color,
# the fill, the shape, the size, the alpha, and the stroke.

#TODO
# Create a scatter (geom_point()) plot of the displ and hwy columns of the 
# mpg dataset.
# In the aes() function, set the x parameter to the displ column and the y
# parameter to the hwy column. Set the color parameter to the class column.
ggplot(data = mpg) +
    geom_point(aes(x=displ, y=hwy, color=class))

#TODO
# Repeat the previous plot, but this time use the shape parameter instead of the
# color parameter.
ggplot(data = mpg) +
    geom_point(aes(x=displ, y=hwy, shape=class))

#TODO
# Repeat the previous plot, but this time use the size parameter instead of the
# shape parameter.
ggplot(data = mpg) +
    geom_point(aes(x=displ, y=hwy, size=class))

#TODO
# Repeat the previous plot, but this time use the alpha parameter instead of the
# size parameter.
ggplot(data = mpg) +
    geom_point(aes(x=displ, y=hwy, alpha=class))


## Geometric objects ----
# The geom_point() function is used to create a scatter plot.
# There are many other geometric objects that can be used to create different
# types of plots.

#TODO
# Create a scatter plot of the displ and hwy columns of the mpg dataset.
# In the aes() function, set the x parameter to the displ column and the y
# parameter to the hwy column. Set the color parameter to the drv column.
# Hint: This aes() function should be directly inside the ggplot() function.
# Add a geom_smooth() layer to the plot.
# Inside the geom_smooth() function, add an aes() function and set the
# linetype parameter to the drv column.
ggplot(data = mpg, aes(x=displ, y=hwy, color=drv)) +
    geom_point() +
    geom_smooth(aes(linetype=drv))

# Having the aes() function inside the ggplot() function means that the
# aesthetic mappings are applied to all the layers of the plot.

#TODO
# Repeat the previous plot, but this time remove color=drv from the aes()
# function inside the ggplot() function.
# Add an aes() function inside the geom_point() function and set the
# color parameter to the drv column.
# Completely remove the aes() function inside the geom_smooth() function.
ggplot(data = mpg, aes(x=displ, y=hwy)) +
    geom_point(aes(color=drv)) +
    geom_smooth()

### Specifying data for each layer ----

#TODO
# Create a scatter plot of the displ and hwy columns of the mpg dataset.
# However, this time, highlight the 2seater cars as red dots.
ggplot(data = mpg, aes(x=displ, y=hwy)) +
    geom_point() +
    geom_point(data=mpg |> filter(class=="2seater"), color="red")

#TODO
# Repeat the last TODO and add another geom_point() layer.
# The data is again from mpg and the filter is for the 2seater class
# But this time, set the shape parameter to 'circle open', with size
# 3 and color red.
ggplot(data = mpg, aes(x=displ, y=hwy)) +
    geom_point() +
    geom_point(data=mpg |> filter(class=="2seater"), color="red") +
    geom_point(data=mpg |> filter(class=="2seater"), shape='circle open', size=3, color="red")

### Using extension packages
# The ggplot2 package is very extensible.
# There are many extension packages that add new geometric objects to the
# ggplot2 package.
# There is a whole gallery for ggplot2 extensions at
# https://exts.ggplot2.tidyverse.org/gallery/

#TODO
# Install "ggridges" package using the install.packages() function
install.packages("ggridges")

#TODO
# Load the ggridges package using the library() function
library(ggridges)

#TODO
# Create a ridgeline plot of the hwy and drv columns of the mpg dataset.
# Start with the ggplot() function and set the data parameter to mpg.
# Inside ggplot(), add aes() and set the x parameter to the hwy column,
# and the y parameter to the drv column, and the fill parameter to the drv,
# and the color parameter to the drv.
# Add a geom_density_ridges() layer to the plot.
# Set alpha to 0.5 and show.legend to FALSE.
ggplot(data = mpg, aes(x=hwy, y=drv, fill=drv, color=drv)) +
    geom_density_ridges(alpha=0.5, show.legend=FALSE)


## Statistical transformations ----

# Consider the following plot:
ggplot(data = diamonds, aes(x=cut)) +
    geom_bar()
# How is the plot created?
# Check Figure 10.2 from the book
# https://r4ds.hadley.nz/layers#fig-vis-stat-bar 

# Let us use the stat_summary() function
#TODO
# Create a ggplot() object with the diamonds dataset.
# Add a + sign after the ggplot() function.
# Create a stat_summary() object and inside it create an aes() object.
# Set the x parameter to the cut column and the y parameter to the depth column.
# Outside the aes() function but inside the stat_summary() function, set the
# fun.min parameter to min and the fun.max parameter to max.
# also, set the fun parameter to median.
ggplot(data = diamonds) +
    stat_summary(
        aes(x=cut, y=depth), 
        fun.min=min, 
        fun.max=max, 
        fun=median
        )

## Coordinate systems ----
# The coordinate system is the system that is used to map the data to the
# visual properties of the plot.


#TODO
# Follow after me...

bar <- ggplot(data = diamonds) +
    geom_bar(
        aes(x = clarity, fill = clarity),
        show.legend = FALSE,
        width = 1
    ) +
    theme(aspect.ratio = 1)

bar

bar + coord_flip()
bar + coord_polar()
