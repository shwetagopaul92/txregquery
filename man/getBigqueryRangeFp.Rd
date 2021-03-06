% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getBigqueryRangeFp.R
\name{getBigqueryRangeFp}
\alias{getBigqueryRangeFp}
\title{query Footprint data from bigquery}
\usage{
getBigqueryRangeFp(mychr, mystart, myend, myproject, mydataset, mybilling)
}
\arguments{
\item{mychr}{chromosome}

\item{mystart}{start position}

\item{myend}{end position}

\item{myproject}{project name in bigquery}

\item{mydataset}{database name in bigquery}

\item{mybilling}{billing group in bigquery}
}
\description{
query Footprint data from bigquery
}
\examples{
\dontrun{
mychrGo="chr17"
mystartGo=41196312-500*1000
myendGo=41322262+500*1000
myprojectGo="cgc-xx-xxxx"
mydatasetGo="txregnet"
mybillingGo = "cgc-xx-xxxx"
res_fp=getBigqueryRangeFp(mychrGo,mystartGo,myendGo,myprojectGo,mydatasetGo,mybillingGo)
res_fp
}
}
