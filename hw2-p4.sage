y,m = var('y,m')
dy = m*y + y^3 - y^5

pdy1 = plot(dy(m=1), y, xmin=-2.5, xmax=2.5, ymin=-2, ymax=2, axes_labels=("$y$","$\\frac{dy}{dt}$")) + text("$\\frac{dy}{dt} = y + y^3 - y^5$", (-0.75,1), color='blue')
pdy2 = plot(dy(m=-1), y, xmin=-2.5, xmax=2.5, ymin=-2, ymax=2, axes_labels=("$y$","$\\frac{dy}{dt}$")) + text("$\\frac{dy}{dt} = -y + y^3 - y^5$", (-1.75,1), color='blue') 
pdy3 = plot(dy(m=-0.125), y, xmin=-2.5, xmax=2.5, ymin=-0.5, ymax=0.5, axes_labels=("$y$","$\\frac{dy}{dt}$")) + text("$\\frac{dy}{dt} = -\\frac{y}{8} + y^3 - y^5$", (-1.75,0.25), color='blue')

pdy1.show(figsize=6, filename="./hw2-p4-m1.png")
pdy2.show(figsize=6, filename="./hw2-p4-m-1.png")
pdy3.show(figsize=6, filename="./hw2-p4-m-0125.png")

stable1 = plot(lambda x: 0., thickness=2., xmin=-3, xmax=0)
stable2 = implicit_plot(dy == 0, (m, -0.25, 0.5), (y, 1/sqrt(2), 2), frame=False)
stable3 = implicit_plot(dy == 0, (m, -0.25, 0.5), (y, -2, -1/sqrt(2)), frame=False)
unstable1 = plot(lambda x: 0., thickness=2., xmin=0, xmax=3, linestyle="--")
unstable2 = implicit_plot(dy == 0, (m, -0.25, 0), (y, -1/sqrt(2), 1/sqrt(2)), frame=False, linestyle='--')
#(stable1 + stable2 + stable3 + unstable1 + unstable2).show(xmin=-0.5, xmax=0.5, ymin=-2, ymax=2, figsize=6, axes=True, axes_labels=("$\mu$","$y_c$"), filename='./hw2-p4-bifurcation.png')
