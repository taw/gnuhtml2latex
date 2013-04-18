OBJ = debian/copyright en.1 pl.1

.SUFFIXES: .pod .1

.pod.1:
	ln -sf $< gnuhtml2latex.pod && \
	pod2man --center='GNU/Linux Freedomization Project' gnuhtml2latex.pod >$@
	rm -f gnuhtml2latex.pod

all: $(OBJ)

clean:
	rm -f $(OBJ)

debian/copyright: gnuhtml2latex
	perl -e '<>; while (<>) {/^#/ or exit; print}' <gnuhtml2latex >debian/copyright
