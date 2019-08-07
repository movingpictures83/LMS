
input <- function(inputfile) {
   my_data <<- read.csv(inputfile, header = T);
   cn <<- colnames(my_data);
   cn <<- cn[2:length(cn)];
   my_data <<- my_data[,-1];
   my_data <<- apply(my_data, 1, as.numeric);
   my_data <<- t(my_data);
   colnames(my_data) <<- cn;
   #my_data <<- as.matrix(my_data);
   #my_data <<- my_data[,-1];
}

run <- function() {
   test_bact = cn;
   lms <- list()
   m_lms <<- matrix(,nrow=length(test_bact),ncol=length(test_bact))
   idx_i <- 1
   for(i in test_bact){
        idx_j <- 1
        for(j in test_bact){
                lm.out <- lm(my_data[,i] ~ my_data[,j])
                lms[[length(lms)+1]] <- lm.out
                m_lms[idx_i,idx_j] <<- lms[[length(lms)]]$coefficients[2]
                idx_j <- idx_j + 1
        }
        idx_i <- idx_i + 1
   }
   colnames(m_lms) <<- cn;
   rownames(m_lms) <<- cn;
}

output <- function(outputfile) {
   write.table(m_lms, file=outputfile, sep=",");
   #pdf(paste(outputfile,"pdf",sep="."));#, height=1500, width=10000);
   #b <- boxplot(rawdata);  # Have to run after the PDF
   #write.table(b$stats, file=paste(outputfile,"csv",sep="."),sep=",");
   #dev.off();
}
