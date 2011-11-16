y,m = var('y,m')

dy = y + m * y / (1 + y^2)

pdy1 = plot(dy(m=0), y, xmin=-2, xmax=2, ymin=-2, ymax=2, axes_labels=("$y$","$\\frac{dy}{dt}$")) + text("$\\frac{dy}{dt} = y$", (-0.5,0.25), color='blue')
pdy2 = plot(dy(m=-1), y, xmin=-2, xmax=2, ymin=-2, ymax=2, axes_labels=("$y$","$\\frac{dy}{dt}$")) + text("$\\frac{dy}{dt} = y - \\frac{y}{1 + y^2}$", (-0.5,0.25), color='blue') 
pdy3 = plot(dy(m=-2), y, xmin=-2, xmax=2, ymin=-2, ymax=2, axes_labels=("$y$","$\\frac{dy}{dt}$")) + text("$\\frac{dy}{dt} = y - \\frac{2 y}{1 + y^2}$", (-1.5,0.25), color='blue')

pdy1.show(figsize=6, filename="./hw2-p7-m-0.png")
pdy2.show(figsize=6, filename="./hw2-p7-m-1.png")
pdy3.show(figsize=6, filename="./hw2-p7-m-2.png")

branch1 = sqrt(abs(1+m))
branch2 = -1 * sqrt(abs(1+m))

b1p = plot(branch1, m, xmin=-4, xmax=-1, linestyle='--')
b2p = plot(branch2, m, xmin=-4, xmax=-1, linestyle='--')
z1p = plot(lambda x: 0., xmin=-4, xmax=-1, thickness=2.)
z2p = plot(lambda x: 0., xmin=-1, xmax=1, thickness=2., linestyle='--')

(b1p+b2p+z1p+z2p).show(xmin=-3, xmax=1, ymin=-2, ymax=2, axes=True, axes_labels=("$\mu$","$y_c$"), figsize=6, filename="./hw2-p7-bifurcation.png")
