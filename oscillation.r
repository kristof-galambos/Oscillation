
m <- 1.0
k <- 1.0
x <- 10.0
v <- 0.0
T <- 50.0
tstep <- 0.01
b = 0.1

tvect <- c()
xvect <- c()
tt <- 0.0
a <- 0.0
while (tt < T) {
	a <- -k*x/m - b*v
	x <- x + v*tstep
	v <- v + a*tstep
	tt <- tt + tstep
	xvect <- append(xvect, x)
	tvect <- append(tvect, tt)
}

write(xvect, "r_oscillation.txt", sep='\n')
png('r_oscillation.png')
plot(tvect, xvect, xlab='time (s)', ylab='position (m)', main=paste('SHM with b = ', b))
