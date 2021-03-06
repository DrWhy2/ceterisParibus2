% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate_profiles_lce.R
\name{calculate_profiles_lce}
\alias{calculate_profiles_lce}
\title{Calculate Local Conditional Expectation profiles}
\usage{
calculate_profiles_lce(data, variable_splits, model, dataset,
  predict_function = predict, ...)
}
\arguments{
\item{data}{set of observations. Profile will be calculated for every observation (every row)}

\item{variable_splits}{named list of vectors. Elements of the list are vectors with points in which profiles should be calculated. See an example for more details.}

\item{model}{a model that will be passed to the \code{predict_function}}

\item{dataset}{a data.frame, usually training data of a model, used for calculation of LCE profiles}

\item{predict_function}{function that takes data and model and returns numeric predictions. Note that the ... arguments will be passed to this function.}

\item{...}{other parameters that will be passed to the \code{predict_function}}
}
\value{
a data frame with profiles for selected variables and selected observations
}
\description{
This function Local Conditional Expectation profiles
}
\details{
Note that \code{calculate_profiles_lce} function is S3 generic.
If you want to work on non standard data sources (like H2O ddf, external databases)
you should overload it.
}
\examples{
library("DALEX2")
 \dontrun{
library("randomForest")
set.seed(59)
apartments_rf_model <- randomForest(m2.price ~ construction.year + surface + floor +
                                      no.rooms + district, data = apartments)
explainer_rf <- explain(apartments_rf_model,
      data = apartments[,2:6], y = apartments$m2.price)
vars <- c("construction.year", "surface", "floor", "no.rooms", "district")
variable_splits <- calculate_variable_splits(apartments, vars)
new_apartment <- apartments[1, ]

profiles <- calculate_profiles_lce(new_apartment, variable_splits,
                               apartments_rf_model, explainer_rf$data)
profiles
}
}
