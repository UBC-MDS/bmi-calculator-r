
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bmi.calculator

<!-- badges: start -->
<!-- badges: end -->

This R package is for calculation of BMI (body mass index), and some
more computations based on weight loss goals. The package provides
simple answers to a user’s weight loss goals in terms of how much weight
loss/gain and calorie deficit/increase should be aimed for with a target
weight and time frame in mind. The package also provides helpful
visualizations about BMI and calorie intake change trajectory leading to
the target.

## Installation

You can install the development version of bmi.calculator from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/bmi-calculator-r")
```

## Functions

The package contains the following functions

- `calculate_bmi`: computes user’s BMI based on weight and height. Also
  creates a visual of the BMI on scale
- `project_bmi`: computes how much average change in BMI should be
  achieved per week given a targeted weight and the timeframe to reach
  the goal. Also presents a visual trajectory for BMI
- `project_calories`: computes how much average calorie intake is ideal
  per week given a targeted weight and the timeframe to reach the goal.
  Also presents a visual trajectory for calories
- `exercise_plan`: suggests possible exercise plans to achieve the
  targeted weight. Also gives a graph showing how much exercise of each
  kind is needed per day

## Example

The package is under active work for now, and the package functions need
updating with appropriate functionality. The usage will be updated with
details as the functions are updated.

## Suitability within R Ecosystem

Our BMI calculator is unique in the sense that it provides easy and
instantly understandable visuals to quickly get the gist of how healthy
a person is. The package does not rely on any historical data of a
person’s weights, and hence needs no dataset files to be provided. The
only arguments needed for the functions of this calculator are current
weight and height, and target weight with timeframe in case weight
change is desired. It also recommends simple figures for weight
gain/loss goals. To the best of our understanding, there are currently
no packages in the R ecosystem that offer functionality similar to this
package.

## Contributing

Interested in contributing? Check out the contributing guidelines.
Please note that this project is released with a [Code of
Conduct](https://github.com/UBC-MDS/bmi-calculator-r/blob/master/CODE_OF_CONDUCT.md).
You can follow guidelines outlined
[here](https://github.com/UBC-MDS/bmi-calculator-r/blob/master/.github/CONTRIBUTING.md)
in case you want to contribute to the project. By contributing to this
project, you agree to abide by its terms.

The list of contributors to the original project can be found
[here](https://github.com/UBC-MDS/bmi-calculator-r/blob/master/.github/CONTRIBUTORS.md).

## License

`bmi_calculator` package was created by Qurat-ul-Ain Azim, Natalie Cho,
HanChen Wang, Kelvin Wong. It is licensed under the terms of the MIT
license.

## Credits

`bmi_calculator` was created following the guidelines of this
[`Book`](https://r-pkgs.org/whole-game.html).
