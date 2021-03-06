exterior <-
function (id1, id2) 
{
	stopifnot(is.vector(id1))
	stopifnot(is.vector(id2))
	stopifnot(length(id1)==length(id2))
	stopifnot(length(id1)==length(unique(id1)))
	stopifnot(length(id2)==length(unique(id2)))
	n <- length(id1)
	ident <- id1 == id2
	nident <- sum(ident)
	id1 <- id1[!ident]
	id2 <- id2[!ident]
	inter <- intersect(id1, id2)
	while (length(inter) >= 1) {
        dup <- inter[1]
        w1 <- which(id1 == dup)
        w2 <- which(id2 == dup)
        id1 <- c(id1[w2], id1[-c(w1, w2)])
        id2 <- c(id2[w1], id2[-c(w1, w2)])
        if (id1[1] == id2[1]) {
            id1 <- id1[-1]
            id2 <- id2[-1]
        }
        inter <- intersect(id1, id2)
    }
	o<-order(id1)
	id1<-id1[o]
	id2<-id2[o]
	list(id1 = id1, id2 = id2)
}
