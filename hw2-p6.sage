y,m = var('y,m')

dy = y*(m - exp(y))

plot1 = plot(dy(m=0.5), y, xmin=-2, xmax=2) + text("$\\frac{dy}{dt} = y(\\frac{1}{2} - e^y)$", (0.5,0.25))
plot2 = plot(dy(m=1), y, xmin=-2, xmax=2) + text("$\\frac{dy}{dt} = y(1 - e^y)$", (0.5,0.25))
plot3 = plot(dy(m=2), y, xmin=-2, xmax=2) + text("$\\frac{dy}{dt} = y(2 - e^y)$", (0.5,0.5))

plot1.show(axes_labels=("$y$","$\\frac{dy}{dt}$"), figsize=6, xmin=-2, xmax=2, ymin=-2, ymax=2, filename="./hw2-p6-dym0.png")
plot2.show(axes_labels=("$y$","$\\frac{dy}{dt}$"), figsize=6, xmin=-2, xmax=2, ymin=-2, ymax=2, filename="./hw2-p6-dym1.png")
plot3.show(axes_labels=("$y$","$\\frac{dy}{dt}$"), figsize=6, xmin=-2, xmax=2, ymin=-2, ymax=2, filename="./hw2-p6-dym2.png")

f = m - exp(y)

bfp1 = plot(lambda x: 0., xmin=-5, xmax=1, thickness=2.)
bfp2 = plot(lambda x: 0., xmin=1, xmax=5, thickness=2., linestyle='--')
bfp3 = implicit_plot(f == 0, (m, -5, 1), (y, -5, 5), frame=False, linestyle='--')
bfp4 = implicit_plot(f == 0, (m, 1, 5), (y, -5, 5), frame=False)

(bfp1 + bfp2 + bfp3 + bfp4).show(axes_labels=("$\mu$","$y_c$"), axes=True, figsize=6, xmin=-5, xmax=5, ymin=-5, ymax=5, filename="./hw2-p6-bifurcation.png")
