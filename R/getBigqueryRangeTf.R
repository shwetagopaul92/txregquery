#'query TF data from bigquery
#'@import GenomicRanges
#'@import bigrquery
#'@import dplyr
#'@import DBI
#'@import magrittr
#'@param mychr chromosome
#'@param mystart start position
#'@param myend end position
#'@param myproject project name in bigquery
#'@param mydataset database name in bigquery
#'@param mybilling billing group in bigquery
#'@examples
#'\dontrun{
#' mychrGo="chr17"
#' mystartGo=41196312-500*1000
#' myendGo=41322262+500*1000
#' myprojectGo="cgc-xx-xxxx"
#' mydatasetGo="txregnet"
#' mybillingGo = "cgc-xx-xxxx"
#' res_tf=getBigqueryRangeTf(mychrGo,mystartGo,myendGo,myprojectGo,mydatasetGo,mybillingGo)
#' res_tf
#' }
#' @export
getBigqueryRangeTf <- function(mychr, mystart, myend, myproject, mydataset, mybilling){
  require(bigrquery)
  require(dplyr)
  require(magrittr)
  require(DBI)
  require(GenomicRanges)
  txreg_bq = DBI::dbConnect(dbi_driver(), project=myproject, dataset=mydataset, billing=mybilling) #make connection to bigquery
  tf_tbl = txreg_bq %>% tbl("TF")  #make connection to required table
  res = tf_tbl %>% filter(chr==mychr) %>% filter(start >= mystart) %>% filter(end <= myend) %>% as.data.frame
  myrange=GRanges(res$chr, IRanges(res$start, res$end), mcols=res)
  myrange
}
