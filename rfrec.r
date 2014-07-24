source("dataload.r")

tu <- table(ratings$uid, ratings$rating)
tm <- table(ratings$mid, ratings$rating)

freqUser <- function(users.table, u, r){
	return(users.table[u,r])
}

freqItem <- function(items.table, i, r){
	return(items.table[i,r])
}

indicator.avg_user <- function(users.table, u, r){
	rate.avg = round(sum(users.table[u,]*1:5)/sum(users.table[u,]))
	return(rate.avg == r)
}

indicator.avg_item <- function(items.table, i, r){
	rated.avg = round(sum(items.table[i,]*1:5)/sum(items.table[i,]))
	return(rated.avg == r)
}

rfrec.pred <- function(tu=tu,ti=tm,u,i){
	tmp <- rep(0,5)
	for(r in 1:5){
		tmp[r] <- (freqUser(tu,u,r) + 1 + indicator.avg_user(tu,u,r)) * (freqItem(ti,i,r) + 1 + indicator.avg_item(ti,i,r))
	}
	return(which.max(tmp))
}
