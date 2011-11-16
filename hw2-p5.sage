y,m = var('y,m')

dy = 1 + m*y + y^2

plot1 = plot(dy(m=-3), y, xmin=-2, xmax=4) + text("$\\frac{dy}{dt} = 1 - 3y + y^2$", (1.5,-1.75))
plot2 = plot(dy(m=-2), y, xmin=-2, xmax=4) + text("$\\frac{dy}{dt} = 1 - 2y + y^2$", (2.5,0.5))
plot3 = plot(dy(m=-1), y, xmin=-2, xmax=4) + text("$\\frac{dy}{dt} = 1 - y + y^2$", (1.75,1))

plot1.show(axes_labels=("$y$","$\\frac{dy}{dt}$"), figsize=6, xmin=-1, xmax=3, ymin=-2, ymax=5, filename="./hw2-p5-dym-3.png")
plot2.show(axes_labels=("$y$","$\\frac{dy}{dt}$"), figsize=6, xmin=-1, xmax=3, ymin=-2, ymax=5, filename="./hw2-p5-dym-2.png")
plot3.show(axes_labels=("$y$","$\\frac{dy}{dt}$"), figsize=6, xmin=-1, xmax=3, ymin=-2, ymax=5, filename="./hw2-p5-dym-1.png")

cps1 = -m - sqrt(m^2 - 4) / 2 - y
cps2 = -m + sqrt(m^2 - 4) / 2 - y

branch1 = implicit_plot(cps1, (m, -4, -2), (y, -8, 8), frame=False, plot_points=5e2)
branch2 = implicit_plot(cps1, (m, 2, 4), (y, -8, 8), frame=False, plot_points=5e2)
branch3 = implicit_plot(cps2, (m, -4, -2), (y, -8, 8), frame=False, plot_points=5e2, linestyle='--')
branch4 = implicit_plot(cps2, (m, 2, 4), (y, -8, 8), frame=False, plot_points=5e2, linestyle='--')

(branch1 + branch2 + branch3 + branch4).show(axes_labels=("$\mu$","$y_c$"), axes=True, figsize=6, xmin=-4, xmax=4, ymin=-8, ymax=8, filename="./hw2-p5-bifurcation.png")
