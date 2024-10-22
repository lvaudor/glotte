#' Get lines of table txt_page such that the column 'variable' contains the text pattern 'value'
#'
#' @param conn the connection to the GloUrb package
#' @param value the text pattern that is searched in the lines of the txt_page table.
#' @param variable the variable in which to look for the text pattern. Defaults to text_en.
#'
#' @return the filtered txt_page table
#' @export
#'
#' @examples
#' conn=glourbi::connect_to_glourb()
#' destroy_in_text_en=get_txt_page(conn,value="destroy")
#' dam_in_title=get_txt_page(conn,variable="title",value="dam")
get_txt_page=function(conn,value,variable="text_en"){
  query=glue::glue("SELECT * FROM txt_page WHERE {variable} LIKE '%{value}%';")
  result=DBI::dbGetQuery(conn=conn,
                         query)
  return(result)
}

#' Get lines of table txt_segment such that the column 'variable' contains the text pattern 'value'
#'
#' @param conn the connection to the GloUrb package
#' @param value the text pattern that is searched in the lines of the txt_page table.
#' @param variable the variable in which to look for the text pattern. Defaults to text.
#'
#' @return the filtered txt_segment table
#' @export
#'
#' @examples
#' conn=glourbi::connect_to_glourb()
#' destroy_in_text=get_txt_segment(conn,value="destroy")
#' dam_in_text=get_txt_segment(conn,var="tokenized_text",value="dam")
get_txt_segment=function(conn,value,variable="text"){
  query=glue::glue("SELECT * FROM txt_segment WHERE {variable} LIKE '%{value}%';")
  result=DBI::dbGetQuery(conn=conn,
                         query)
  return(result)
}