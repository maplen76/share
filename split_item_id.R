item_id <- function(...) {
    require(stringr)
    require(xlsx)
    x <- readLines("item_id.html")
    x1 <- str_split_fixed(x, "[[:space:]]", 2)
    colnames(x1) <- c("item_id", "item_name")
    x2 <- as.data.frame.matrix(x1)
    x2$item_name <- str_trim(x2$item_name, side = "left")
        
    z <- loadWorkbook("P12 Post Launch.xlsx")
    sheet <- createSheet(wb = z, sheetName = "itemID")
    addDataFrame(x = x2, sheet = sheet, row.names = F)
    saveWorkbook(wb = z, file = "P12 Post Launch.xlsx")
    
    return(x2)
}

# Use regular expression to extract the item_id
# x$item_id <- str_extract(x[,1], "com.ubisoft.mkd..+_[a-z]+")
