
<!-- README.md is generated from README.Rmd. Please edit that file -->

# eyeCleanR

This package can be used to clean raw eye-tracking data based on
expected patterns for exploratory analysis. The current implementation
focuses on sequential reading, where y coordinates are correlated with
time and x coordinates follow a quasi-regular oscillatory pattern.

## Installation

You can install this version of eyeCleanR using the following command:

``` r
devtools::install_github("abeith/eyeCleanR")
```

You can then use `library(eyeCleanR)` to load the package.

## Vignettes

Use the following command to browse the documentation for this package.

``` r
browseVignettes("eyeCleanR")
```

Alternatively, to view vignettes in R, use `vignette(package =
"eyeCleanR")` to see a list of available vignettes and then open the
relevant vignette (e.g. `vignette("new_lines", package = "eyeCleanR")`).

## Aim

The aim of this package is to facilitate the non-destructive detection
of reading behaviours for exploratory analysis. The `saccades` package
(von der Malsburg 2015) adopts a method set out by Engbert and Kliegl
(2003) to identify saccades based on the velocity of eye movements. This
approach draws the distinction between saccadic and microsaccadic
movement, allowing for small movements within fixations and large
movements between fixations. Where areas of interest (AOIs) are
categorical, the timing and position of a fixation can be used to infer
visual attention as a categorical variable. However, this requires the
signal to noise ratio (SNR) of the observed point of gaze (POG) data to
be large enough to distinguish between neighbouring AOIs. In
naturalistic reading tasks this may not be the case as the spatial
distance between lines is small. For example, a saccade from the first
word in the first line of a text, to the first word in the second line
of a text would may be smaller than the saccades from the first word to
the second word within a line. This is problematic as two saccades of
similar magnitude would be observed while the ordinal progression
through the text would be very different.

`eyeCleanR` attempts to facilitate the identification of reading
behaviours by cleaning the signal, rather than aggregating to fixations.
The advantage of this is greater flexibility, allowing the researcher to
detect patterns while avoiding destructive transformations. The
`detect_newline()` function in particular addresses the problem of
identifying saccades to a new line. While the amplitude of these
saccades in the y coordinate are small, they are associated with large
negative saccades in the x coordinate. Using a similar approach to
Engbert and Kliegl (2003), velocity is used to identify when the
magnitude of a saccade indicates a shift in attention. High velocity
left saccades are assumed to be indicative of progression to a new line.
This assumption is likely to hold for data with a high SNR and the
reader following a predictable progressive reading pattern. For noisy
data, or data with frequent regressions, additional data cleaning steps
are necessary to reject large regressions and artefacts. The
`filter_points()` function offers a simple method of rejecting points
outside of the target area. Where this is not sufficient, the
`new_lines` vignette provides an example of how modelling the function
of y-axis position over time can be used to reject outliers.

The advantages of identifying saccades to a new line are demonstrated in
the `x_progress` vignette. For languages read from left to right,
reading progress within lines can be expressed variations in a
continuous variable over time. This time series representation of
reading progress allows observations to be modelled and compared to
predicted patterns or other readers. The examples provided in the
vignette demonstrate how data can be modelled and visualised. However,
as there is no aggregation of data, the researcher is free to apply
whichever method of analysis is appropriate for the research question.
Non parametric approaches can also be used in the analysis of x
coordinate time series, using packages such as `infotheo` (Meyer 2014)
for Mutual Information calculations or `crqa` (Coco, James D. Dixon, and
Nash 2018) for Cross-Recurrence Quantification Analysis.

## References

<div id="refs" class="references">

<div id="ref-crqa">

Coco, Moreno I., Rick Dale with contributions of James D. Dixon, and
John Nash. 2018. *Crqa: Cross-Recurrence Quantification Analysis for
Categorical and Continuous Time-Series*.
<https://CRAN.R-project.org/package=crqa>.

</div>

<div id="ref-engbert_microsaccades_2003">

Engbert, Ralf, and Reinhold Kliegl. 2003. “Microsaccades Uncover the
Orientation of Covert Attention.” *Vision Research* 43 (9): 1035–45.
<https://doi.org/10.1016/S0042-6989(03)00084-1>.

</div>

<div id="ref-infotheo">

Meyer, Patrick E. 2014. *Infotheo: Information-Theoretic Measures*.
<https://CRAN.R-project.org/package=infotheo>.

</div>

<div id="ref-saccades">

von der Malsburg, Titus. 2015. *Saccades: Detection of Fixations in
Eye-Tracking Data*. <https://CRAN.R-project.org/package=saccades>.

</div>

</div>
