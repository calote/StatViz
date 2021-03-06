performWilcoxonTest <- function(groupA, groupB)
{   
    groupA <- c(groupA);    
    groupB <- c(groupB);
      
    result = findError(c(list(groupA), list(groupB)));
    error =  result$error;
        
    result <- wilcox.test(groupA, groupB, paired = T);
  
    V = result$statistic[["V"]];
    p = result$p.value;
    
    result <- coin::wilcoxsign_test(groupA ~ groupB, distribution = "exact");
    
    name <- names(result@statistic@teststatistic);
    
    Z = result@statistic@teststatistic[[name[1]]];
    
    r = Z/length(groupA);
    
    list(V = V, p = p, r = abs(r), error = error);
}
